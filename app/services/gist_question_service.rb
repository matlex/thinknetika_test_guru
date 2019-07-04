class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GITHUB_GIST_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
        "description": I18n.t('gist_description', test_title: @test.title),
        "files": {
            "test-guru-question.txt": {
                "content": gist_content
            }
        }
    }
  end

  def gist_content
    content = ['= ' * 50]
    content += [@question.body]
    content += ['= ' * 50]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end