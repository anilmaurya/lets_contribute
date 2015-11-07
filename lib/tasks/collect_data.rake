desc "Task to collect data"
task :collect_data => :environment do
  Language.all.each do |language|
    language.fetch_repositories
    p "Language --------#{language.name}"
    sleep_time = rand(1.2..2.25).seconds
    sleep(sleep_time)
  end

  Repository.all.each do |repo|
    repo.fetch_issues
    sleep_time = rand(1.2..2.25).seconds
    sleep(sleep_time)
  end
end
