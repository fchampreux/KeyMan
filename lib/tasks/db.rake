namespace :db do
    desc 'Create database schemas before going for the first migration'
    task init: ['db:drop','db:create'] do
    ActiveRecord::Base.connection.execute("CREATE SCHEMA keyman AUTHORIZATION keyman")
    puts 'Database initialised'
    end
  end

namespace :db do
    desc 'Initialise evaluation users'
    task evaluation: :environment do
      if Group.count==1
        puts "Creating business groups"
        # May require to define id here because not all db start with 0 or 1
        Group.create(code: 'SALES', name: 'Sales Administration', description: 'Sales department group', created_by: 'RAKE', updated_by: 'RAKE')
        Group.create(code: 'SUPPORT', name: 'Support Administration', description: 'Cusomer services group', created_by: 'RAKE', updated_by: 'RAKE')
        Group.create(code: 'CLINICAL', name: 'Clinical Trial', description: 'Clinical trials group', created_by: 'RAKE', updated_by: 'RAKE')
      end
        
      if User.count==1
        puts "Creating Users 1 to 3 as BUS_ADMIN (2) role"
        User.create(name: 'Stat admin', first_name: 'User1', is_admin: false, email: 'user1@nohoo.biz', user_name: 'User1', language: 'en', section: 'Sales Administration',
                    group_id: 2, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 3, created_by: 'RAKE', updated_by: 'RAKE')
        User.create(name: 'Stat admin', first_name: 'User2', is_admin: false, email: 'user2@nohoo.biz', user_name: 'User2', language: 'en', section: 'Support Administration',
                    group_id: 3, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 3, created_by: 'RAKE', updated_by: 'RAKE')
        User.create(name: 'Stat admin', first_name: 'User3', is_admin: false, email: 'user3@nohoo.biz', user_name: 'User3', language: 'en', section: 'Clinical Trial',
                    group_id: 4, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 3, created_by: 'RAKE', updated_by: 'RAKE')
        puts "Creating Users 4 to 6 as KEY_ADMIN (3) role"
        User.create(name: 'Stat responsible', first_name: 'User4', is_admin: false, email: 'user4@nohoo.biz', user_name: 'User4', language: 'en', section: 'Sales Administration',
                    group_id: 2, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 4, created_by: 'RAKE', updated_by: 'RAKE')
        User.create(name: 'Stat responsible', first_name: 'User5', is_admin: false, email: 'user5@nohoo.biz', user_name: 'User5', language: 'en', section: 'Support Administration',
                    group_id: 3, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 4, created_by: 'RAKE', updated_by: 'RAKE')
        User.create(name: 'Stat responsible', first_name: 'User6', is_admin: false, email: 'user6@nohoo.biz', user_name: 'User6', language: 'en', section: 'Clinical Trial',
                    group_id: 4, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 4, created_by: 'RAKE', updated_by: 'RAKE')
        puts "Creating Users 7 to 9 as BUS_WORKER (4) role"
        User.create(name: 'Stat worker', first_name: 'User7', is_admin: false, email: 'user7@nohoo.biz', user_name: 'User7', language: 'en', section: 'Sales Administration',
                    group_id: 2, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 5, created_by: 'RAKE', updated_by: 'RAKE')
        User.create(name: 'Stat worker', first_name: 'User8', is_admin: false, email: 'user8@nohoo.biz', user_name: 'User8', language: 'en', section: 'Support Administration',
                    group_id: 3, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 5, created_by: 'RAKE', updated_by: 'RAKE')
        User.create(name: 'Stat worker', first_name: 'User9', is_admin: false, email: 'user9@nohoo.biz', user_name: 'User9', language: 'en', section: 'Clinical Trial',
                    group_id: 4, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 5, created_by: 'RAKE', updated_by: 'RAKE')
        puts "Creating User 10 as Keys administrator role"
        User.create(name: 'Officer', first_name: 'Data Protection', is_admin: false, email: 'user10@nohoo.biz', user_name: 'User10', language: 'en', section: 'Security office',
                    group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 2, created_by: 'RAKE', updated_by: 'RAKE')
      end
        
      if AuditTrail.count==1
        puts "Registering seed activity"
        AuditTrail.create( user_id: 1, action: "Initialize", object_id: 0, description: "Running demo users creation script", created_by: "RAKE")
      end
        
      puts "SQL Queries"
      ActiveRecord::Base.connection.execute("update users set confirmed_at = now()")
    end
  end

    