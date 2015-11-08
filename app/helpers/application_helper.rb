module ApplicationHelper
  def markdown(body)
    Markdown.new(body).to_html.html_safe
  end

  def issue_number(issue)
    "##{issue.html_url.scan(/[0-9]+\z/).first}"
  end
end
