// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function update_character() {
  $("#post_tweet_twitter_post").keyup(function() {
    var current = $("#post_tweet_twitter_post").attr("value");
    var number_left =  140 - current.length;    
    $("#twitter_character_coundown").html(number_left);
  });
};


$(document).ready(update_character);

$(document).ready(function(){
  $(".datepicker").datepicker({ dateFormat: 'yy-mm-dd'});
  
});