class IssuesSerializer < ActiveModel::Serializer
  attributes :id, :html_url, :title, :comments_count, :body, :milestone

  has_one :repository
end
