namespace :import do
  desc "import dockets from dockets.txt file"
  task :dockets => :environment do
    Case.import_file
  end
end

namespace :create do  
  desc "create courts" 
  task :courts => :environment do
    Court.import
  end
end