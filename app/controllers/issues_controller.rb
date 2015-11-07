class IssuesController < ApplicationController
  before_action :get_issue, only: :index

  def index
    render json: @issue, serializer: IssuesSerializer
  end

  private

  def get_issue
    if params[:language_id].present?
      @issue = Issue.where(:language_id.in => [params[:language_id]]).sample
    else
      @issue = Issue.all.sample
    end
  end
end
