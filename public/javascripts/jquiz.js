/* 
THIS CODE IS CREATED BY THE FOLKS AT WEBSITEDESIGNERNC.COM 
GO VISIT FOR ALL YOUR PROGRAMMING AND WEB DESIGN NEEDS!
*/

$(function() {

	var count = 0;	
	var howmanyquestions = $("#jquiz > li").length;
	
	//the function for a clicked item
	$("#jquiz li ul li").click(function(){
	
		if (!($(this).parent("ul").hasClass("answered"))) {
		
			// removes unanswered class and adds answered class so they cannot change answer
			$(this).parent("ul").addClass("answered");
			
			// runs if they clicked the incorrect answer
			if (!($(this).hasClass("correct"))) {
				// puts strike-through wrong answer and makes their answer red for incorrect
				$(this).addClass("wronganswer");
				$(this).siblings(".correct").addClass("realanswer");
				// animate explanation & add styling depending on answer
				$(this).parent().parent().children("div").prepend('<p>INCORRECT</p>');
				$(this).parent().parent().children("div").addClass("wrongbox");
				$(this).parent().parent().children("div").fadeTo(500, 1);
			}
			
			// runs if they clicked the correct answer
			if ($(this).hasClass("correct")) {
				//adds one to quiz total correct tally
				count++;
				// makes correct answer green
				$(this).addClass("correctanswer");
				// animate explanation & add styling depending on answer
				$(this).parent().parent().children("div").prepend('<p>CORRECT</p>');
				$(this).parent().parent().children("div").addClass("rightbox");
				$(this).parent().parent().children("div").fadeTo(750, 1);
			}
			
			if ($('ul.answered').length == howmanyquestions) {
				$('#jquizremarks').fadeIn('slow');
				$('#jquiztotal').html('You got a '+count+' out of '+howmanyquestions+' on the quiz.');
			}
		}
		

		
	});

});
