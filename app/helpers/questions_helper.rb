module QuestionsHelper

  def current_year
    Time.current.year
  end

  def github_url(title, repo_url)
    link_to(title, repo_url, target: "_blank")
  end

  def question_header_by(question)
    question_title = question.test.title

    if question.new_record?
      title = "<h1>Create a new question in '#{question_title}' test</h1>"
    else
      title = "<h1>Edit question in '#{question_title}' test</h1>"
    end
    render inline: title
  end

end
