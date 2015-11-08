class IssuesController < ApplicationController
  before_action :get_issue, only: :index

  def index
    render "index.js.haml"
  end

  private

  def get_issue
    if params[:language_id].present?
      # return random issue if No issue present.
      @issue = Issue.where(:language_id.in => [params[:language_id]]).sample || Issue.all.sample
    else
      @issue = Issue.all.sample
    end
  end
end
