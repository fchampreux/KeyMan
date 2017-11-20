# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Parameter.count==0
puts "Creating parameters"
Parameter.create(id: 0, name: 'Undefined', description: 'Undefined value', code: 'UNDEF', value: 'UNDEF', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1, name: 'Administrator role', description: 'Application administrator', code: '0', value: 'Administrator', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 2, name: 'Statistical Sector Manager', description: 'Statistical Sector Manager', code: '1', value: 'StatAdmin', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 3, name: 'Cryptographic Keys Administrator', description: 'Cryptographic Keys Administrator', code: '2', value: 'KeyAdmin', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 4, name: 'Statistic data steward', description: 'Statistic data steward', code: '3', value: 'StatWorker', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 5, name: 'Enforce role security', description: 'Strictly respect role segregation in managing and using Cryptographic Keys', code: 'TRUE', value: '1', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 6, name: 'Default Cryptographic Keys size', description: 'Defines the cipher size within 256, 512, 1024, 2048 at key creation', code: 'SIZE', value: '256', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 7, name: '256 bits', description: 'Key for AES256 crypting algorithm', code: 'AES256', value: '256', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 8, name: '512 bits', description: 'Key for AES512 crypting algorithm', code: 'AES512', value: '512', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 9, name: '1024 bits', description: 'Key for AES1024 crypting algorithm', code: 'AES1024', value: '1054', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 10, name: '2048 bits', description: 'Key for AES2048 crypting algorithm', code: 'AES2048', value: '2048', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 11, name: '4096 bits', description: 'Key for AES4096 crypting algorithm', code: 'AES4096', value: '4096', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 20, name: 'Token default count', description: 'Default value for API token count-down', code: 'TOKEN', value: '10', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 999, name: '(none)', description: 'These parameters do not belong with a list', code: 'NONE', value: 'NONE', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1000, name: 'Roles list', description: 'Lists the Roles in the application for security purposes', code: 'ROLES', value: 'Roles', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1001, name: 'Key Sizes list', description: 'Lists the available sizes for cryptographic keys', code: 'KEY_SIZES', value: 'Key Sizes', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1002, name: 'Sections list', description: 'Lists the sections users belong to', code: 'SECTIONS', value: 'Sections', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 100, name: 'Démographie et migration', description: 'Statistiques liées à la démographie et aux migrations', code: 'BB/DEM', value: 'BB/DEM', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 101, name: 'Population', description: 'Statistiques liées à la population', code: 'BB/POP', value: 'BB/POP', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 100, name: 'Sales & Marketing', description: 'Supports processes related to Customers sales and promotion', code: 'SALES', value: 'SALES', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 101, name: 'Customer Support', description: 'Supports the customer helpdesk', code: 'HELPDESK', value: 'HELPDESK', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 102, name: 'Customer Services', description: 'Supports the services to customer projects', code: 'SERVICES', value: 'SERVICES', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 200, name: 'Information technologies', description: 'Processes related to Information Technologies in Ressources division', code: 'R/IT', value: 'R/IT', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
end

if Group.count==0
puts "Creating administration group"
Group.create(code: 'ADMIN', name: 'Administration', description: 'Administrators group', created_by: 'RAKE', updated_by: 'RAKE')
puts "Creating business groups"
Group.create(code: 'SALES', name: 'Sales Administration', description: 'Sales department group', created_by: 'RAKE', updated_by: 'RAKE')
Group.create(code: 'SUPPORT', name: 'Support Administration', description: 'Cusomer services group', created_by: 'RAKE', updated_by: 'RAKE')
Group.create(code: 'CLINICAL', name: 'Clinical Trial', description: 'Clinical trials group', created_by: 'RAKE', updated_by: 'RAKE')
end

if User.count==0
puts "Creating administrator"
User.create(name: 'Administrator', first_name: 'Keyman', is_admin: true, email: 'fred@nohoo.biz', user_name: 'Admin', language: ':en',
            group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 0, created_by: 'RAKE', updated_by: 'RAKE')
puts "Creating Users 1 to 3 as BUS_ADMIN (2) role"
User.create(name: 'Business admin', first_name: 'User1', is_admin: true, email: 'user1@nohoo.biz', user_name: 'User1', language: ':en',
            group_id: 2, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 2, created_by: 'RAKE', updated_by: 'RAKE')
User.create(name: 'Business admin', first_name: 'User2', is_admin: true, email: 'user2@nohoo.biz', user_name: 'User2', language: ':en',
            group_id: 3, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 2, created_by: 'RAKE', updated_by: 'RAKE')
User.create(name: 'Business admin', first_name: 'User3', is_admin: true, email: 'user3@nohoo.biz', user_name: 'User3', language: ':en',
            group_id: 4, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 2, created_by: 'RAKE', updated_by: 'RAKE')
puts "Creating Users 4 to 6 as KEY_ADMIN (3) role"
User.create(name: 'Key admin', first_name: 'User4', is_admin: true, email: 'user4@nohoo.biz', user_name: 'User4', language: ':en',
            group_id: 2, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 3, created_by: 'RAKE', updated_by: 'RAKE')
User.create(name: 'Key admin', first_name: 'User5', is_admin: true, email: 'user5@nohoo.biz', user_name: 'User5', language: ':en',
            group_id: 3, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 3, created_by: 'RAKE', updated_by: 'RAKE')
User.create(name: 'Key admin', first_name: 'User6', is_admin: true, email: 'user6@nohoo.biz', user_name: 'User6', language: ':en',
            group_id: 4, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 3, created_by: 'RAKE', updated_by: 'RAKE')
puts "Creating Users 7 to 9 as BUS_WORKER (4) role"
User.create(name: 'Business worker', first_name: 'User7', is_admin: true, email: 'user7@nohoo.biz', user_name: 'User7', language: ':en',
            group_id: 2, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 4, created_by: 'RAKE', updated_by: 'RAKE')
User.create(name: 'Business worker', first_name: 'User8', is_admin: true, email: 'user8@nohoo.biz', user_name: 'User8', language: ':en',
            group_id: 3, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 4, created_by: 'RAKE', updated_by: 'RAKE')
User.create(name: 'Business worker', first_name: 'User9', is_admin: true, email: 'user9@nohoo.biz', user_name: 'User9', language: ':en',
            group_id: 4, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 4, created_by: 'RAKE', updated_by: 'RAKE')
end

=begin
if Group.count==0
puts "Creating administration group"
Group.create(code: 'ADMIN', name: 'Administration', description: 'Administrators group', created_by: 'RAKE', updated_by: 'RAKE')
end

if User.count==0
puts "Creating administrator"
User.create(name: 'Administrator', first_name: 'Keyman', is_admin: true, email: 'fred@nohoo.biz', user_name: 'Admin', language: ':en',
            group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 0, created_by: 'RAKE', updated_by: 'RAKE')
end
=end

