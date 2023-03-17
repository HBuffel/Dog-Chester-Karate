Feature:

  Scenario: Search Breeds by Name
  Given path '/breeds/search'
  And param q = 'husky'
  When method get
  Then status 200
  And match response contains {name: 'husky'}

  Scenario: Get Breeds List
    Given path '/breeds'
    When method get
    Then status 400
    And match response contains {name: 'affenpinscher'}

  Scenario: Get Images by Breed
    Given path '/images/search'
    And param breed_id = 1
    When method get
    Then status 200
    And match response contains {breed_id: 1}