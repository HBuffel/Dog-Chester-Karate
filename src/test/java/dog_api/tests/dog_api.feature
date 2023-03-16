Feature: dog_api

  Background:
    * url 'https://api.thedogapi.com

  Scenario: Get all breeds
    Given path 'breeds'
    When method get
    Then status 200
    And match response == '#notnull'

  Scenario: Search breeds by name
    Given path 'breeds/search'
    And param q = 'husky'
    When method get
    Then status 200
    And match response contains 'husky'

  Scenario: Get random image
    Given path 'images/random'
    When method get
    Then status 200
    And match response contains 'https://'

  Scenario: Add breed to favourites
    Given path 'favourites'
    And request { breed_id: 1 }
    When method post
    Then status 200

  Scenario: Get favourites
    Given path 'favourites'
    When method get
    Then status 200
    And match response == 'SUCCESS'

  Scenario: Delete favourite by id
    Given path 'favourites/1'
    When method delete
    Then status 200