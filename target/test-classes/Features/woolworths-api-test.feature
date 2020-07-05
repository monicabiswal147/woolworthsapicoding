@CircuitsApi
Feature: As a Formula 1 fan, I want to know the number of races for a given Formula 1 season

   Background:
     * url baseUrl

  @Test1
  Scenario Outline: Check the number of races in a season Given: I want to know the number of Formula One races in <season> When:  I retrieve the circuit list for that season Then:  there should be <numberOfCircuits> circuits in the list returned

  # Test Strategy: Happy path -Hit the circuits API to get the response and assert that its 200
  # Remove the unwanted data from the XML and create a subset called as Race Array for us to retrieve all seasons in the response
  # Count the total number of circuits for a particular season for each of the Node [Race] to validate the example table
  # Assumption: The structure of the response body remains same along with the data

    Given path '/api/f1'
    When method GET
    Then status 200

# Retrieve the list of all seasons from the response
    * def RaceArray = $response//RaceTable
    * def allSeasons = get RaceArray.RaceTable.Race[*].@.season
    * def currentSeason = '<season>'

# Call the javascript file to validate If the season is present in response body, it should have list of circuit names
    * def expect = read('classpath:Season.js')
    * def expectedValue = expect(currentSeason,allSeasons)

# Assert that if the season is present in response body, it should have list of circuit names
# Assert that the count of number of circuits from the data table matches as per season

    And match //Race[@season='<season>']/Circuit/CircuitName == expectedValue
    And match response count(//Race[@season='<season>']/Circuit/CircuitName) == <numberOfCircuits>


    Examples:
      | season | numberOfCircuits |
      | 1950   | 7                |
      | 1966   | 0                |
      | 2017   | 0                |
      | 2016   | 0                |
      | 1951   | 8                |
      | 1952   | 8                |
      | 1953   | 7                |


  @Test2
  Scenario: Schema Validation

    Given path '/api/f1'
    When method GET
    Then status 200
    * def RaceDetails = $response//RaceTable
    * print RaceDetails
    * def allSeasons = get RaceDetails.RaceTable.Race[*].@.season
    And match each allSeasons[*] == '#string'
    And match RaceDetails count(//Race[@season]/Circuit/CircuitName) == 30






