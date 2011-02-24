# require 'growl'

ENV["WATCHR"] = "1"
$spec_cmd = "rspec --colour --format nested"

def growl(message)
  # if message.match(/\s0\s(errors|failures)/)
  #   title = 'Watchr: All tests passed'
  #   image = File.join(File.expand_path(File.dirname(__FILE__)), '.watchr_images', 'pass.png')
  # else
  #   title = 'Watchr: Tests are failing'
  #   image = File.join(File.expand_path(File.dirname(__FILE__)), '.watchr_images', 'pass.png')
  # end
  # Growl.notify message, :icon => image, :title => title
end

def run(cmd)
  system('clear')
  puts(cmd)
  system(cmd)
end

def run_spec(spec)
  result = run "#{$spec_cmd} #{spec}"
  growl result.split("\n").last rescue nil
end

def run_all_specs
  result = run "#{$spec_cmd} spec/"
  growl result.split("\n").last rescue nil
end

def related_specs(path)
  Dir['spec/**/*.rb'].select { |file| file =~ /#{File.basename(path).split(".").first}_spec.rb/ }
end

def run_all_features
  run "cucumber"
end

def run_feature(feature)
  run "cucumber #{feature}"
end

def run_suite
  run_all_specs
  run_all_features
end

watch('spec/spec_helper\.rb') { run_all_specs }
watch('spec/support/.*') { run_all_specs }
watch('spec/.*_spec\.rb') { |m| run_spec m[0] }
watch('app/.*\.rb') { |m| related_specs(m[0]).map {|tf| run_spec tf } }
watch('lib/.*\.rb') { |m| related_specs(m[0]).map {|tf| run_spec tf } }
watch('features/support/.*') { |m| run_all_features }
watch('features/.*\.feature') { |m| run_feature m[0] }

# Ctrl-\
Signal.trap 'QUIT' do
  puts " --- Running all specs ---\n\n"
  run_all_specs
end

@interrupted = false

# Ctrl-C
Signal.trap 'INT' do
  if @interrupted then
    @wants_to_quit = true
    abort("\n")
  else
    puts "Interrupt a second time to quit"
    @interrupted = true
    Kernel.sleep 1.5
    # raise Interrupt, nil # let the run loop catch it
    @interrupted = false
    run_suite
  end
end