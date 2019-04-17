module QuestionsHelper

  def current_year
    Time.current.year
  end

  def github_url(title, repo_url)
    render inline: "<a href=#{repo_url}>#{title}</a>"
  end

  def question_header_by(action, test_title)
    case action
      when :new
        title = "<h1>Create a New #{test_title} Question</h1>"
      when :edit
        title = "<h1>Edit #{test_title} Question</h1>"
      else
        raise StandardError('Unknown action')
    end

    render inline: title
  end

end
