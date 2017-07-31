namespace :db do
    desc 'Create database schemas before going for the first migration'
    task init: ['db:drop','db:create'] do
    ActiveRecord::Base.connection.execute("CREATE SCHEMA keyman AUTHORIZATION keyman")
    puts 'Database initialised'
    end
  end
    