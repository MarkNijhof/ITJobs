
Feature: Home page that shows a link to add new jobs
	In order to add new jobs
	As a site visitor and potential employer
	I want to see a link to be able to add a new job

	Scenario: Visit home page
    Given I am on "the homepage"
    Then I should see "add a job"
