module ApplicationHelper
  def markdown(body)
    find_and_preserve MarkdownService.call(body)
  end

  def issue_number(issue)
    "##{issue.html_url.scan(/[0-9]+\z/).first}"
  end
end
