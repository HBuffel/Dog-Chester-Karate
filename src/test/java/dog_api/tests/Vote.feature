Feature:

  Scenario: Get Votes for an Image
  Given path '/votes'
  And param image_id = 'image-id'
  When method get
  Then status 200
  And match response contains {image_id: 'image-id'}

  Scenario: Vote for an Image
    Given path '/votes'
    And request {image_id: 'image-id', value: 1}
    When method post
    Then status 200
    And match response contains {message: 'SUCCESS'}