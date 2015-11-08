class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def get_issue
    if params[:language_id].present?
      total_issues = Issue.where(:language_ids.in => [params[:language_id]]).count
      @issue = Issue.where(:language_ids.in => [params[:language_id]]).random(rand(0..total_issues)).first
    else
      @issue = Issue.random(rand(0..Issue.count)).first
    end
  end
end
