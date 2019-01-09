Feature: Homepage navigation

  Scenario: User clicks on log in
    Given I am on the homepage
    When I click on log in
    Then I should see the log in page

  Scenario: User clicks on sign up
    Given I am on the root_path
    When I click on sign up
    Then I should see the sign up page

  Scenario: User clicks on community
    Given I am on homepage location
    When I click on community
    Then I should see the community page

  Scenario: User click on FAQ
    Given homepage
    When I click on FAQ
    Then I should see the FAQ page

  Scenario: User clicks on the team
    Given root
    When I click on The Team
    Then I should see the team page

  Scenario: User clicks on Supplemental Income
    Given home
    When I click on Supplemental Income
    Then I should see the Supplemental Income page

  Scenario: User clicks Our Reviews
    Given home page
    When I click on Our Reviews
    Then I should see reviews page

  Scenario: User clicks search
    Given on homepage
    When I click search
    Then I should see search page


