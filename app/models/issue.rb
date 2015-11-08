class Issue
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  scope :random, -> (skip_count) { skip(skip_count).limit(1) }

  field :html_url, type: String
  field :title, type: String
  field :comments_count, type: Integer
  field :body, type: String
  field :milestone, type: String
  field :state, type: String
  field :created_by_name, type: String
  field :created_by_url, type: String
  field :issue_created_at, type: DateTime
  field :creator_avatar, type: String

  validates :html_url, :title, presence: true
  validates :html_url, uniqueness: true

  belongs_to :repository
  has_and_belongs_to_many :languages
end
