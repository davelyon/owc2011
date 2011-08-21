function update_character() {
  $("#post_tweet_twitter_post").keyup(function() {
    var current = $("#post_tweet_twitter_post").attr("value");
    var number_left =  140 - current.length;
    $("#twitter_character_coundown").html(number_left);
  });
};

$(document).ready(function() {
  $(".datepicker").datepicker({dateFormat: 'yy-mm-dd'});
  $(".timepicker").AnyTime_picker();
  $('div.newsletter').dialog({autoOpen: false, width: 320, height: 180, dialogClass: 'newsletter-wrapper', modal: true});
  $('a.newsletter').live('click', function(event) {
    event.preventDefault();
    $('div.newsletter').dialog("open");
  });
  update_character();
});
