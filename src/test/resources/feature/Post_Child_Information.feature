Feature: Register Child API Test
Background: 
	 Given I have a valid parent token
 
  Scenario: Validate Child Registration with valid data
    When I send a POST request to child endpoint
    Then I should receive a 200 OK response
    Then the child registration response should store childId
    Then The response message should be for child "Child information saved successfully."
    Then the returned childId should be a positive number
 
  Scenario: Register a new parent linked to a child with valid data
    When I send a POST request to Parent endpoint
    Then I should receive a 200 OK response
    Then The response message should be for Parent guardian "Parent information saved successfully."
    And the response should contain the parentId


  Scenario: Register emergency contact linked to the child
    When I send a POST request to Emergency Contact endpoint
    Then I should receive a 200 OK response
    And the response should contain the emergency contact ID(s)
 
  Scenario: Register pickup contact linked to the child
    When I send a POST request to Pickup Contact endpoint
    Then I should receive a 200 OK response
    And the response should contain the pickup contact ID(s)
 
 @runthis
  Scenario: Upload health document for the child
    When I send a POST request to Health Document Upload endpoint
    Then I should receive a 200 OK response
    And the response should confirm document upload success

  Scenario: Delete uploaded health document for the child
    Given I have a valid parent token
    When I send a Post request to Health Document Delete endpoint
    Then I should receive a 200 OK response
    And the document should be removed successfully
 
  Scenario: Submit health information for the child
    When I send a POST request to Health Info endpoint
    Then I should receive a 200 OK response
    And the response should contain the healthInfoId

  Scenario: Submit consent information for the child
    When I send a POST request to Consent endpoint
    Then I should receive a 200 OK response
    And the response should contain the consentId

  Scenario: Submit final child registration
    When I send a PUT request to Final Submission endpoint
    Then I should receive a 200 OK response
    And the child registration status should be updated to COMPLETE
