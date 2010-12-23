class HomeController < ApplicationController
  def index
    File.read(File.join('public', 'index.html'))

  end

end
