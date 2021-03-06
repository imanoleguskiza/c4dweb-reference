Feature: Test homepage content and blocks
  In order to test the correct content displayed in the homepage
  As a group member and non-member and anonymous user
  I need to be able to see various content for various user roles.

  @api
  Scenario: Logged in user should have access to the site homepage.
    Given I am logged in as user "mariecurie"
    When I visit the site homepage
    Then I should see the site homepage

  @api
  Scenario: Logged in user should not see button to open the introduction video.
    Given I am logged in as user "mariecurie"
    When I visit the site homepage
    Then I should not see the homepage introduction video block

  @api
  Scenario: Anonymous user should have access to the site homepage.
    Given I am an anonymous user
    When I visit the site homepage
    Then I should see the site homepage

  @api
  Scenario: Logged in user should see group owner in "My Groups" and "My Projects".
    Given I am logged in as user "isaacnewton"
    When  I visit the site homepage
    Then  I should see "My Groups"
    And   I should see "My Projects"
    And   I should see "Owner of the following Group(s)"
    And   I should see "Administrator of the following Project(s)"

  @api
  Scenario: Anonymous user should see button to open the introduction video.
    Given I am an anonymous user
    When I visit the site homepage
    Then I should see the homepage introduction video block

  @api
  Scenario: Anonymous user can't see "My Groups" block
    Given I am an anonymous user
    When  I visit the site homepage
    Then  I should not see "My Groups"
    And   I should not see "My Projects"
    And   I should not see "Owner of the following Group(s)"
    And   I should not see "Owner of the following Project(s)"

  @api
  Scenario: Logged in, non member user can't see "My Groups" block
    Given I am logged in as user "president"
    When  I visit the site homepage
    Then  I should not see "My Groups"
    And   I should not see "My Projects"
    And   I should not see "Owner of the following Group(s)"
    And   I should not see "Owner of the following Project(s)"

  @api
  Scenario: Logged in, member user should see "My Groups" block
    Given I am logged in as user "isaacnewton"
    When  I visit the site homepage
    Then  I should see "My Groups"
    And   I should see "My Projects"
    And   I should see "Tennis Group" in the "div.my-groups" element
    And   I should see "Show more" in the "div.my-groups" element
    And   I should see "Lusail City" in the "div.my-projects" element

  @api
  Scenario: Anonymous user can't see "Suggested Groups" block
    Given I am an anonymous user
    When  I visit the site homepage
    Then  I should not see "Suggested Groups"

  @api
  Scenario: Logged in user without any topics of interest, should not see "Suggested Groups" block
    Given I am logged in as user "president"
    When  I visit the site homepage
    Then  I should not see "Suggested Groups"

  @api
  Scenario: Logged in user with a topic of interest, should see "Suggested Groups" block
    Given I am logged in as user "alfrednobel"
    When  I visit the site homepage
    Then  I should see "Suggested Groups"

  @api
  Scenario: Anonymous user should see "Featured projects" block
    Given I am an anonymous user
    When  I visit the site homepage
    Then  I should see "Featured projects"

  @api
  Scenario: Logged in, member user should see "Featured projects" block
    Given I am logged in as user "president"
    When  I visit the site homepage
    Then  I should see "Featured projects"

  @api
  Scenario: Anonymous user should see maximum three "Upcoming events"
    Given I am an anonymous user
    When  I visit the site homepage
    Then  I should see "Upcoming events" in the "div.sidebarblock.upcoming-events" element
    And   I should see only "2" events

  @api
  Scenario: Logged in user should see more than one "Upcoming events"
    Given I am logged in as user "mariecurie"
    When  I visit the site homepage
    Then  I should see "Upcoming events" in the "div.sidebarblock.upcoming-events" element
    And   I should see only "2" events

  @api
  Scenario: Check featured block is displayed correctly.
    Given I am an anonymous user
    When  I visit the site homepage
    Then  I should see an ".pane-featured-block" element

  @api
  Scenario: Logged in, non member user should see the suggested groups video.
    Given I am logged in as user "president"
    When  I visit the site homepage
    Then  I should see the suggested groups video block

  @javascript
  Scenario: Change one group access to restricted.
    Given I am logged in as user "admin"
    Then  I change access of group "Nobel prize" to "Private"

  @javascript
  Scenario: Everyone should see a functioning carousel.
    Given I am logged in as user "president"
    When  I visit the site homepage
    Then  I should see the carousel and all the slides

  @javascript
  Scenario: Anonymous user can see article activities and doesn't see filter.
    Given I am an anonymous user
    When  I visit the site homepage
    Then  I should wait not to see "Display content based on"
    And   I should not see "Nobel Prize" in the "div.activity-stream" element
    And   I should see "posted" in the "div.activity-stream" element

  @javascript
  Scenario: Logged in user can see article activities and filter.
    Given I am logged in as user "isaacnewton"
    When  I visit the site homepage
    Then  I should wait to see "Display content based on"
    And   I should not see "Nobel Prize" in the "div.activity-stream" element
    And   I should see "My groups" in the "div.pane-filter" element
    And   I load more activities
    And   I should see "posted" in the "div.activity-stream" element

  @javascript
  Scenario: Logged in user can't see article activities when My Groups filter is chosen.
    Given I am logged in as user "isaacnewton"
    When  I visit the site homepage
    And   I select the radio button "My groups" with the id "edit-homepage-filter-groups"
    Then  I should wait not to see "Nobel Prize" in the "div.activity-stream" element
    And   I should not see "Football Talk" in the "div.activity-stream" element
    And   I should not see "posted an Article" in the "div.activity-stream" element

  @javascript
  Scenario: Logged in user can't see article activities when My Projects filter is chosen.
    Given I am logged in as user "mariecurie"
    When  I visit the site homepage
    And   I select the radio button "My projects" with the id "edit-homepage-filter-projects"
    And   I should wait not to see "created a new Article" in the "div.activity-stream" element
    And   I should not see "updated the Article" in the "div.activity-stream" element

  @javascript
  Scenario: Logged in, non member user with no interests can't see My group nor My interests filter
            and restricted group activities.
    Given I am logged in as user "president"
    When  I visit the site homepage
    Then  I should wait to see "Latest activity"
    Then  I should not see "Display content based on"
    And   I should not see "My groups" in the "div.pane-filter" element
    And   I should not see "Nobel Prize" in the "div.activity-stream" element
    And   I should not see "uploaded" in the "div.activity-stream" element
    And   I load more activities
    And   I should see "posted" in the "div.activity-stream" element

  @javascript @wip
  Scenario: Logged in, non member user should see only activities from groups of
  interests when filter is set to My interests
    Given I am logged in as user "president"
    When  I visit the site homepage
    And   I select the radio button "My interests" with the id "edit-homepage-filter-interests"
    Then  I should wait not to see "Lusail City" in the "div.activity-stream" element
    And   I load all activities
    And   I should see "Article" in the "div.activity-stream" element

  @javascript
  Scenario: Change one group access back to public.
    Given I am logged in as user "admin"
    Then  I change access of group "Nobel prize" to "Public"

  @javascript
  Scenario: Anonymous user can see the news activity.
    Given I am an anonymous user
    When  I visit the site homepage
    And   I load all activities until I see "News example"

  @javascript
  Scenario: Authenticated user can see the news activity.
    Given I am logged in as user "alfrednobel"
    When  I visit the site homepage
    And   I load all activities until I see "News example"

  @javascript
  Scenario: Authenticated user should not see the news activity when filtered by groups.
    Given I am logged in as user "alfrednobel"
    When  I visit the site homepage
    And   I select the radio button "My groups" with the id "edit-homepage-filter-groups"
    And   I load all activities
    And   I should not see "News example" in the "div.activity-stream" element
