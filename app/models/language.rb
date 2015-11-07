class Language
  include Mongoid::Document

  field :name, type: String

  validates :name, uniqueness: true

  has_and_belongs_to_many :repositories, dependent: :destroy
  has_and_belongs_to_many :issues

  def fetch_repositories 
    repos = Github::Client::Search.new.repos(q: "language:#{name}", order: 'stars', order: 'desc')
    repos.items.each do |repo|
      repository = Repository.where(html_url: repo.html_url).try(:first) || Repository.new(html_url: repo.html_url)
      repository.assign_attributes(name: repo.name, full_name: repo.full_name, html_url: repo.html_url, url: repo.url,
                                   description: repo.description, has_issues: repo.has_issues, 
                                   stars_count: repo.stargazers_count, forks_count: repo.forks, 
                                   watchers_count: repo.watchers_count, open_issues_count: repo.open_issues)
      repository.languages << self
      repository.save!
    end
  end

  def self.collect_data
    self.each do |language|
      language.fetch_repositories
    end
  end
end
