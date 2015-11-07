class Issue
  include Mongoid::Document
  field :html_url, type: String
  field :title, type: String
  field :comments_count, type: Integer
  field :body, type: String
  field :milestone, type: String

  validates :html_url, :title, presence: true
  validates :html_url, uniqueness: true

  has_and_belongs_to_many :reposotories
  has_and_belongs_to_many :languages
end
