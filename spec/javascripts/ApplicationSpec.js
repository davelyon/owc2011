
describe("Application", function() {
  
  beforeEach(function() {
    return loadFixtures("tweet_form.html");
  });

  it("counts down", function() {
    
    update_character
    
    expect($('#twitter_character_coundown').html()).toEqual("140")
  });

});
