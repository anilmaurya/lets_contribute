class RespositorySerializer < ActiveModel::Serializer
  attributes  :name, :full_name, :description,
              :stars_count, :forks_count, :watchers_count, :open_issues_count
end
