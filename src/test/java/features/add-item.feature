Feature: Add item and return id

  Background:
    * url baseUrl

  Scenario:
    * def randomId = (Math.floor(Math.random() * 10000) + 100) + ''
    Given path 'inventory', 'add'
    And request
      """
      {
        "id": "#(randomId)",
        "name": "Hawaiian",
        "image": "hawaiian.png",
        "price": "$14"
      }
      """
    When method POST
    Then status 200
    * def savedId = randomId
    * print 'savedId:', savedId
    * karate.set('savedId', savedId)

