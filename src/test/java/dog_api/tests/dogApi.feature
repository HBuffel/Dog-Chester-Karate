Feature: TheDogAPI Test

  Background:
    * url 'https://api.thedogapi.com/v1'
    * configure ssl = true
    * header x-api-key = 'live_Pei0UXjVT3GYrLcSawxV4JWzXZdvenzaPumMFWy3FbLnr59bmQNzrqFFF5T5hyGd'

  Scenario: Get Breeds List
    Given path '/breeds'
    When method get
    Then status 400
    And match response contains {name: 'affenpinscher'}

  Scenario: Search Breeds by Name
    Given path https://api.thedogapi.com/v1/breeds/search?q=husky
    And param q = 'husky'
    When method get
    Then status 201
    And match response contains {name: 'husky'}

  Scenario: Get Random Dog Image
    Given path '/images/search'
    And param limit = 1
    When method get
    Then status 200
    And match response[0].breeds[0] contains {name: 'husky'}
    And match response[0].url != nu

  Scenario: Get Categories List
    Given path '/categories'
    When method get
    Then status 200
    And match response contains {name: 'Alaskan Husky'}

  Scenario: Get Images by Breed
    Given path '/images/search'
    And param breed_id = 1
    When method get
    Then status 200
    And match response contains {breed_id: 1}

  Scenario: Add Image to Favorites
    Given path '/favourites'
    And request {image_id: '9ccXTANkb', sub_id: 'your-user-1234'}
    When method post
    Then status 200

  Scenario: Get Favorite Images
    Given path '/favourites'
    When method get
    Then status 200
    And match response contains {sub_id: 'your-user-1234'}

  Scenario: Vote for an Image
    Given path '/votes'
    And request {image_id: 'asf2', value: 146361}
    When method post
    Then status 201
    And match response contains {message: 'SUCCESS'}

  Scenario: Get Votes for an Image
    Given path '/votes'
    And param image_id = 'asf2'
    When method get
    Then status 201
    And match response contains {image_id: 'image-id'}