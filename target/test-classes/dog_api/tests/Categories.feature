Feature:

  Scenario: Get Categories List
    Given path '/categories'
    When method get
    Then status 200
    And match response contains {name: 'breeds'}