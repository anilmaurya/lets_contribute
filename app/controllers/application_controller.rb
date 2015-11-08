class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @issue = Issue.all.sample

    @languages = Language.all.map do |language|
      { id: language.id, name: language.name }
    end

    render 'home/index'
  end
end
