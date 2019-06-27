module PassedTestsHelper

  def show_current_question_num_of_total
    output_string = I18n.t('.question_num_of_total_html', question_number: @current_test_passage.question_number, total: @current_test_passage.questions_count)
    output_string.html_safe
  end

end
