module PassedTestsHelper

  def show_current_question_num_of_total
    output_string = I18n.t('.question_num_of_total_html', question_number: @current_test_passage.question_number, total: @current_test_passage.questions_count)
    output_string.html_safe
  end

  def show_progressbar
    # not used yet since start using JS modifiers
    progress = (@current_test_passage.question_number / @current_test_passage.questions_count.to_f) * 100
    progress = progress.to_i
    output_string = """
      <div class=\"progress\">
      <div class=\"progress-bar\" role=\"progressbar\" style=\"width: #{progress}%\" aria-valuenow=\"#{progress}\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>
      </div>
      """
    output_string.html_safe
  end

  def get_progress_percentage
    ((@current_test_passage.question_number / @current_test_passage.questions_count.to_f) * 100).to_i
  end

end
