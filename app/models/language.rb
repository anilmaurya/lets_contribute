class Language
  include Mongoid::Document

  field :name, type: String

  validates :name, uniqueness: true

  has_and_belongs_to_many :repositories
  has_and_belongs_to_many :issues
end
