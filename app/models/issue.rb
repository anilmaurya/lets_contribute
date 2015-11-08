class Issue
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  scope :random, -> { skip(rand(0..self.count)).limit(1) }

  field :html_url, type: String
  field :title, type: String
  field :comments_count, type: Integer
  field :body, type: String
  field :milestone, type: String
  field :state, type: String

  validates :html_url, :title, presence: true
  validates :html_url, uniqueness: true

  belongs_to :repository
  has_and_belongs_to_many :languages
end
