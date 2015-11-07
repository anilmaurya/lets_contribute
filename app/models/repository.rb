class Repository
  include Mongoid::Document

  field :name, type: String
  field :full_name, type: String
  field :html_url, type: String
  field :url, type: String
  field :description, type: String
  field :user, type: String
  field :has_issues, type: Mongoid::Boolean, default: false
  
  field :stars_count, type: Integer, default: 0
  field :forks_count, type: Integer, default: 0
  field :watchers_count, type: Integer, default: 0
  field :open_issues_count, type: Integer, default: 0

  validates :name, :full_name, :html_url, :url, :user, presence: true
  validates :full_name, :html_url, :url, uniqueness: true

  has_and_belongs_to_many :languages
  has_and_belongs_to_many :issues

  before_validation :extract_user

  private

  def extract_user
    self.user = full_name.split("/").try(:first)
  end
end
