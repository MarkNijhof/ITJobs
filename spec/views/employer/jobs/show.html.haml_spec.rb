require 'spec_helper'

describe "employer_jobs/show.html.haml" do
  before(:each) do
    @job = assign(:job, stub_model(Employer::Job,
      :title => "Title",
      :text => "Text",
      :keywords => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
