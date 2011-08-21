Given /^the "([^"]*)" quiz has the following question: "([^"]*)"$/ do |quiz_title, question_title|
  quiz = Quiz.find_by_title(quiz_title)
  Question.create(quiz_id: quiz.id, title: question_title)
end
