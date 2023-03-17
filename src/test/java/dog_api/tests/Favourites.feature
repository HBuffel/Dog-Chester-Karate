Background:
* url 'https://api.thedogapi.com/v1'
* configure ssl = true
* header x-api-key = 'live_Pei0UXjVT3GYrLcSawxV4JWzXZdvenzaPumMFWy3FbLnr59bmQNzrqFFF5T5hyGd'

  Scenario: Add Image to Favorites
  Given path '/favourites'
  And request {image_id: 'image-id', sub_id: 'user-id'}
  When method post
  Then status 200