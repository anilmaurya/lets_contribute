desc "Task to collect data"
task :collect_data => :environment do
  Language.all.each do |language|
    # Donot add new repository for now
    if language.repositories.empty?
      begin
        language.fetch_repositories
        p "Language --------#{language.name}"
      rescue Exception => e
        p "Exception: #{e.to_s}"
        sleep 1.minute
        language.fetch_repositories
      end
    end
  end

  Repository.all.each do |repo|
    begin
      p "#repos -- #{repo.name}"
      repo.fetch_issues
    rescue Exception => e
      p "Exception: #{e.to_s}"
      sleep 1.minute
      repo.fetch_issues
    end
  end
end
