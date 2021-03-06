class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    get_issue

    @languages = Language.not.where(issue_ids: nil).map do |language|
      { id: language.id, name: language.name }
    end

    render 'home/index'
  end
end
