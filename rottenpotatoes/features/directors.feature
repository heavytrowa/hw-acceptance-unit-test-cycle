Feature: search for movies by director
 
  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter
 
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Star Trek    | R      |              |   1979-05-25 |
  | Avengers     | R      | George Lucas |   2019-03-11 |
 
Scenario: add director to existing movie
  When I go to the edit page for "Star Trek"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Star Trek" should be "Ridley Scott"
 
Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "Avengers"
  But   I should not see "Blade Runner"
 
Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Star Trek"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the RottenPotatoes home page 
  And   I should see "'Star Trek' has no director info"

Scenario: sort movies alphabetically
  Given I am on the RottenPotatoes home page
  When I follow "Movie Title"
  Then I should see "Blade Runner" before "Star Wars"
  And I should see "Star Trek" before "Avengers"

Scenario: sort movies in increasing order of release date
  Given I am on the RottenPotatoes home page
  When I follow "Release Date"
  Then I should see "Star Wars" before "Blade Runner"
  And I should see "Avengers" before "Star Trek"
  And I should see "Star Trek" before "Blade Runner"
  
Scenario: add movie
  Given I am on the RottenPotatoes home page
  And  I follow "Add new movie"
  Then I should be on the new movie page
  When I fill in "Title" with "Chicken Run"
  And I select "G" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  And I should see "Chicken Run  was successfully created."
  
Scenario: delete movie
  Given I am on the details page for "Blade Runner"
  And  I press "Delete"
  Then  I should be on the RottenPotatoes home page 
  And   I should see "Movie 'Blade Runner' deleted."
  
Scenario: find movie with same director
  Given I am on the details page for "Avengers"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Avengers"
  And   I should see "Star Wars"
  But   I should not see "Star Trek"
  
Scenario: edit director to existing movie
  When I go to the edit page for "Star Wars"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Star Wars" should be "Ridley Scott"