@CircuitsApi
Feature: As a Formula 1 fan, I want to know the number of races for a given Formula 1 season


  @Test1
  Scenario Outline: Check the number of races in a season Given: I want to know the number of Formula One races in <season> When:  I retrieve the circuit list for that season Then:  there should be <numberOfCircuits> circuits in the list returned

  # Test Strategy: Happy path -Hit the circuits API to get the response and assert that its 200
  # Remove the unwanted data from the XML and create a subset called as Race Array for it parsed effectively using karate XPath
  # Count the total number of circuits for a particular season for each of the Node [Race] to validate the example table

    Given url baseUrl
    And path '/api/f1'
    When method GET
    Then status 200
    * def RaceArray = $response//RaceTable
    * print 'The Race Array as follows: ', RaceArray
    And match RaceArray count(//Race[@season='<season>']/Circuit/CircuitName) == <numberOfCircuits>

    Examples:
      | season | numberOfCircuits |
      | 1950   | 7                |
      | 1966   | 0                |
      | 2017   | 0                |
      | 2016   | 0                |
      | 1951   | 8                |
      | 1952   | 8                |
      | 1953   | 7                |









