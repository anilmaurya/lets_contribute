class IssuesController < ApplicationController
  before_action :get_issue, only: :index

  def index
    render 'index'
  end

  private

  def get_issue
    if params[:language_id].present?
      @issue = Issue.where(:language_ids.in => [params[:language_id]]).order(updated_at: :asc).first
    else
      @issue = Issue.order(updated_at: :asc).first
    end
  end
end
