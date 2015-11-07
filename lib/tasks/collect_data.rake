desc "Task to collect data"
task :collect_data => :environment do
  Language.all.each do |language|
    language.fetch_repositories
    p "Language --------#{language}"
    sleep(2.seconds)
  end

  Repository.all.each do |repo|
    repo.fetch_issues
    p "Repo --------#{repo}"
    sleep(2.seconds)
  end
end
