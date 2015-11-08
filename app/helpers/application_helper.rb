module ApplicationHelper
  def markdown(body)
    MarkdownService.call(body)
  end

  def issue_number(issue)
    "##{issue.html_url.scan(/[0-9]+\z/).first}"
  end
end
