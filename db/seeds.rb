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
Parameter.create(id: 2, name: 'Keys administrator role', description: 'The DPO manages the keys organisation wide (aka Data Protection Officer)', code: '1', value: 'Administrator', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 3, name: 'Stat admin', description: 'Statistical Sector Manager (aka Business Manager)', code: '2', value: 'StatAdmin', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 4, name: 'Stat responsible', description: 'Owner and responsible for several statistics (aka Data Owner)', code: '3', value: 'KeyAdmin', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 5, name: 'Stat worker', description: 'Statistic data steward (aka Data Steward)', code: '4', value: 'StatWorker', list_name: 'Roles', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 6, name: 'Enforce role security', description: 'Strictly respect role segregation in managing and using Cryptographic Keys', code: 'TRUE', value: '1', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 7, name: 'Default Cryptographic Keys size', description: 'Defines the cipher size within 256, 512, 1024, 2048 at key creation', code: 'SIZE', value: '256', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 8, name: '128 bits', description: 'Key for AES128 crypting algorithm', code: 'AES128', value: '128', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 9, name: '256 bits', description: 'Key for AES256 crypting algorithm', code: 'AES256', value: '256', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 10, name: '512 bits', description: 'Key for AES512 crypting algorithm', code: 'AES512', value: '512', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 11, name: '2048 bits', description: 'Key for AES2048 crypting algorithm', code: 'AES2048', value: '2048', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 12, name: '4096 bits', description: 'Key for AES4096 crypting algorithm', code: 'AES4096', value: '4096', list_name: 'Key Sizes', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 20, name: 'Token default count', description: 'Default value for API token count-down', code: 'TOKEN_COUNT', value: '10', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 21, name: 'Token default lifetime', description: 'Default value for API token validity as days from now', code: 'TOKEN_DAYS', value: '10', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 999, name: '(none)', description: 'These parameters do not belong with a list', code: 'NONE', value: 'NONE', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1000, name: 'Roles list', description: 'Lists the Roles in the application for security purposes', code: 'ROLES', value: 'Roles', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1001, name: 'Key Sizes list', description: 'Lists the available sizes for cryptographic keys', code: 'KEY_SIZES', value: 'Key Sizes', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1002, name: 'Sections list', description: 'Lists the sections users belong to', code: 'SECTIONS', value: 'Sections', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1003, name: 'Servers list', description: 'Lists the servers allowed to access cryptographic keys', code: 'SERVERS', value: 'Servers', list_name: 'All lists', created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 100, name: 'Information technologies', description: 'Resources related to Information Technologies', code: 'R/IT', value: 'R/IT', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 101, name: 'Population', description: 'Statistiques liées à la population', code: 'BB/POP', value: 'BB/POP', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 102, name: 'Démographie et migration', description: 'Statistiques liées à la démographie et aux migrations', code: 'BB/DEM', value: 'BB/DEM', list_name: 'Sections', created_by: 'RAKE', updated_by: 'RAKE')

ActiveRecord::Base.connection.execute("ALTER SEQUENCE parameters_id_seq INCREMENT BY 1 RESTART WITH 10000")
end

if Group.count==0
puts "Creating administration group"
Group.create(code: 'ADMIN', name: 'Administration', description: 'Administrators group', created_by: 'RAKE', updated_by: 'RAKE')
end

# Should define id here because not all db start with 0 or 1 
if User.count==0
puts "Creating administrator"
User.create(name: 'Administrator', first_name: 'GDPR', is_admin: true, email: 'fred@nohoo.biz', user_name: 'Admin', language: ':en', section: 'R/IT',
            group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 1, created_by: 'RAKE', updated_by: 'RAKE')
end

if AuditTrail.count==0
puts "Registering seed activity"
AuditTrail.create( user_id: 1, action: "Initialize", object_id: 0, description: "Running initialization script", created_by: "RAKE")
end

puts "SQL Queries"
ActiveRecord::Base.connection.execute("update users set confirmed_at = now()")

