namespace :db do
	desc "reseed the database"
task reseed: ['db:drop', 'db:create', 'db:migrate', 'db:seed'] do
  puts "Reseeding Complete"
end
end
