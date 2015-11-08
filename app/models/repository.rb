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
  has_many :issues, dependent: :destroy

  before_validation :extract_user

  def fetch_issues
    issue_list = Github::Client::Issues.new.list(user: user, repo: name, per_page: 1000, 
                                                 access_token: ENV['GITHUB_ACCESS_TOKEN'])

    issue_list.each do |issue|
      next unless issue.html_url.include?('issue')
      new_issue = self.issues.find_or_create_by(html_url: issue.html_url)
      new_issue.update_attributes(title: issue.title, comments_count: issue.comments,
                         body: issue.body, milestone: issue.milestone, languages: languages)
    end
  end

  def self.collect_data
    self.each do |repo|
      repo.fetch_issues
    end
  end

  def owner_url
    url = self.html_url
    return url.gsub(/\/[a-z]+*$/, '')
  end

  private

  def extract_user
    self.user = full_name.split("/").try(:first)
  end
end
