require 'spec_helper'

describe "employer_jobs/new.html.haml" do
  before(:each) do
    assign(:job, stub_model(Employer::Job,
      :title => "MyString",
      :text => "MyString",
      :keywords => ""
    ).as_new_record)
  end

  it "renders new job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employer_jobs_path, :method => "post" do
      assert_select "input#job_title", :name => "job[title]"
      assert_select "input#job_text", :name => "job[text]"
      assert_select "input#job_keywords", :name => "job[keywords]"
    end
  end
end
