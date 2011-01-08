require 'spec_helper'

describe "employer_jobs/index.html.haml" do
  before(:each) do
    assign(:employer_jobs, [
      stub_model(Employer::Job,
        :title => "Title",
        :text => "Text",
        :keywords => ""
      ),
      stub_model(Employer::Job,
        :title => "Title",
        :text => "Text",
        :keywords => ""
      )
    ])
  end

  it "renders a list of employer_jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
