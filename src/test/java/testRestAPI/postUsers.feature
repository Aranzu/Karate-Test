Feature: Post API

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")
    * def expectedOutput2 = read("response2.json")

  Scenario: POST datos y aserción
    Given path '/users'
    And request {"name": "sebastian","job": "carpintero"}
    When method POST
    Then status 201
    And match response == {"name": "sebastian", "job": "carpintero", "id": "#string","createdAt": "#ignore"}
    And print response

  Scenario: POST con aserción de datos en archivo response1.json
    Given path '/users'
    And request {"name": "sebastian","job": "carpintero"}
    When method POST
    Then status 201
    And match $ == expectedOutput
    And print response
    
  Scenario: POST obteniendo datos de request1.json y comparandolo con response2.json
    Given path '/users'
    And def reqBody = read("request1.json")
    And set reqBody.job = 'jardinero'
    And request reqBody
    When method POST
    Then status 201
    And match $ == expectedOutput2
    And print response  