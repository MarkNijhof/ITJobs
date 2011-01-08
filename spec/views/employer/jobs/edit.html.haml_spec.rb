require 'spec_helper'

describe "employer_jobs/edit.html.haml" do
  before(:each) do
    @job = assign(:job, stub_model(Employer::Job,
      :title => "MyString",
      :text => "MyString",
      :keywords => ""
    ))
  end

  it "renders the edit job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => job_path(@job), :method => "post" do
      assert_select "input#job_title", :name => "job[title]"
      assert_select "input#job_text", :name => "job[text]"
      assert_select "input#job_keywords", :name => "job[keywords]"
    end
  end
end
