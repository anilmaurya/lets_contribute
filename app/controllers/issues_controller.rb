class IssuesController < ApplicationController
  def index
    get_issue

    render 'index'
  end
end
