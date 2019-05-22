module PassedTestsHelper

  def show_current_question_num_of_total
    output_string = "<h2>Question # #{@current_test_passage.question_number} of #{@current_test_passage.questions_count}</h2>"
    render inline: output_string
  end

end
