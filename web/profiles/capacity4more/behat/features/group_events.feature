Feature: Group Events
  As a group member and non-member
  In order to see and search into all events
  I need to be able to see an upcoming events overview page
  I need to be able to see a past events overview page
  I need to be able to see the events landing page
  I need to be able to see an event detail page

  @api
  Scenario: Check events landing page as an anonymous user
    Given I am an anonymous user
    When I visit the events landing page of group "Nobel Prize"
    Then I should see an upcoming and past events block
    And I should not see the "Add an event" link above the overview

  @api
  Scenario: Check events landing page as group owner
    Given I am logged in as user "alfrednobel"
    When I visit the events landing page of group "Nobel Prize"
    Then I should see an upcoming and past events block
    And I should see the "Add an event" link above the overview

  @api
  Scenario: Check upcoming events overview as an anonymous user
    Given I am an anonymous user
    When I visit the upcoming events overview of group "Nobel Prize"
    Then I should see the upcoming events overview
    And I should not see the "Add an Event" link above the overview

  @api
  Scenario: Check past events overview as an anonymous user
    Given I am an anonymous user
    When I visit the past events overview of group "Nobel Prize"
    Then I should see the past events overview
    And I should not see the "Add an Event" link above the overview

  @api
  Scenario: Check upcoming events overview as group owner
    Given I am logged in as user "alfrednobel"
    When I visit the upcoming events overview of group "Nobel Prize"
    Then I should see the upcoming events overview
    And I should see the "Add an Event" link above the overview

  @api
  Scenario: Check past events overview as group owner
    Given I am logged in as user "alfrednobel"
    When I visit the past events overview of group "Nobel Prize"
    Then I should see the past events overview
    And I should see the "Add an Event" link above the overview

  @api
  Scenario: Check event detail as an anonymous user
    Given I am an anonymous user
    When I visit the group "event" detail page "Nobel Prize Issueing"
    Then I should see the event detail page

  @api
  Scenario: Check event detail as group owner
    Given I am logged in as user "alfrednobel"
    When I visit the group "event" detail page "Nobel Prize Issueing"
    Then I should see the event detail page

  # TODO : Setting the topic does not work on events!
  # @javascript
  @wip
  Scenario: Check group reference field is filled from context and hidden
    Given I am logged in as user "mariecurie"
    When  I start creating "event" "Some new event1" in group "Architecture" without file field "document"
    And   I check the related topic checkbox
    And   I should not see an "edit-og-group-ref-und-0-default" element
    And   I press "Save"
    Then  I should see "Some new event1" in the activity stream of the group "Architecture"

  # TODO : Setting the topic does not work on events!
  # @javascript
  @wip
  Scenario: Check group reference field is filled from context and hidden
    Given I am logged in as user "mariecurie"
    When  I start editing "event" "Some new event1" in group "Architecture"
    Then  I should not see an "edit-og-group-ref-und-0-default" element

  @api
  Scenario: Check GA can edit an event's author
    Given I am logged in as user "galileo"
    When I visit the group "event" detail page "Nobel Prize Issueing"
    And I click "Edit" in the "primary tabs" region
    Then I should see the text "Edit Event Nobel Prize Issueing"
    And I should see the text "Authoring information"

  @api
  Scenario: Check SA can edit an event's author
    Given I am logged in as user "survivalofthefittest"
    When I visit the group "event" detail page "Nobel Prize Issueing"
    And I click "Edit" in the "primary tabs" region
    Then I should see the text "Edit Event Nobel Prize Issueing"
    And I should see the text "Authoring information"

  @javascript
  Scenario: Promote buttons shouldn't be displayed to anonymous users.
    Given  I am an anonymous user
    When I visit the events landing page of group "Nobel Prize"
    Then  I should not see the ".fa-thumb-tack" element

  @javascript
  Scenario: Promote buttons shouldn't be displayed to users without access.
    Given  I am logged in as user "isaacnewton"
    When I visit the events landing page of group "Nobel Prize"
    Then  I should not see the ".fa-thumb-tack" element

  @javascript
  Scenario Outline: Promote and highlight buttons should be displayed to users with access.
    Given  I am logged in as user "<user>"
    When I visit the events landing page of group "Nobel Prize"
    Then  I should see the ".fa-star-o" element
    And   I should see the ".fa-thumb-tack" element

    Examples:
      | user        |
      | alfrednobel |
      | mariecurie  |

