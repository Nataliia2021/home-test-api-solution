Feature: Inventory API tests

  Background:
    * url baseUrl

  Scenario: Get all menu items
    Given path 'inventory'
    When method GET
    Then status 200
    And assert response.data.length >= 9
    And match each response.data == { id: '#notnull', name: '#notnull', price: '#notnull', image: '#notnull' }

  Scenario: Filter by id = 3
    Given path 'inventory', 'filter'
    And param id = 3
    When method GET
    Then status 200
    And match response == { id: '3', name: 'Baked Rolls x 8', price: '#notnull', image: '#notnull' }

  Scenario: Add item and get savedId
    * def result = call read('add-item.feature')
    * def savedId = result.savedId
    * print 'Returned savedId:', savedId

    # Step 2: Filter by ID using savedId from add-item.feature
    Given path 'inventory', 'filter'
    And param id = savedId
    When method GET
    Then status 200
    And match response ==
      """
      {
        id: "#(savedId)",
        name: "Hawaiian",
        price: "$14",
        image: "hawaiian.png"
      }
      """

  Scenario: Add item with existent id
    Given path 'inventory', 'add'
    And request { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }
    When method POST
    Then status 400

  Scenario: Add item with missing information (no id)
    Given path 'inventory', 'add'
    And request
      """
      {
        "name": "Hawaiian",
        "image": "hawaiian.png",
        "price": "$14"
      }
      """
    When method POST
    Then status 400
    And match response contains 'Not all requirements are met'
