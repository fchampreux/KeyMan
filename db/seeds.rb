# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Parameter.count==0
puts "Creating parameters"
Parameter.create(id: 0, name: 'Undefined', description: 'Undefined value', code: 'UNDEF', value: 'UNDEF', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 1, name: 'Administrator role', description: 'Application administrator', code: '0', value: 'Administrator', list_name: 'Roles', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 2, name: 'Statistical Sector Manager', description: 'Statistical Sector Manager', code: '1', value: 'StatAdmin', list_name: 'Roles', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 3, name: 'Cryptographic Keys Administrator', description: 'Cryptographic Keys Administrator', code: '2', value: 'KeyAdmin', list_name: 'Roles', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 4, name: 'Statistic data steward', description: 'Statistic data steward', code: '3', value: 'StatWorker', list_name: 'Roles', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 5, name: 'Enforce role security', description: 'Strictly respect role segregation in managing and using Cryptographic Keys', code: 'TRUE', value: '1', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 6, name: 'Default Cryptographic Keys size', description: 'Defines the cipher size within 256, 512, 1024, 2048 at key creation', code: 'SIZE', value: '256', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 7, name: '256 bits', description: 'Key for AES256 crypting algorithm', code: 'AES256', value: '256', list_name: 'Key_Sizes', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 8, name: '512 bits', description: 'Key for AES512 crypting algorithm', code: 'AES512', value: '512', list_name: 'Key_Sizes', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
Parameter.create(id: 9, name: '1024 bits', description: 'Key for AES1024 crypting algorithm', code: 'AES1024', value: '1054', list_name: 'Key_Sizes', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 10, name: '2048 bits', description: 'Key for AES2048 crypting algorithm', code: 'AES2048', value: '2048', list_name: 'Key_Sizes', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
#Parameter.create(id: 11, name: '4096 bits', description: 'Key for AES4096 crypting algorithm', code: 'AES4096', value: '4096', list_name: 'Key_Sizes', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
end

if Group.count==0
puts "Creating administration group"
Group.create(code: 'ADMIN', name: 'Administration', description: 'Administrators group', created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
end

if User.count==0
puts "Creating administrator"
User.create(name: 'Administrator', first_name: 'Keyman', is_admin: true, email: 'fred@nohoo.biz', user_name: 'Admin', language: ':en',
            group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 0, created_at: Date.today, updated_at: Date.today, created_by: 'RAKE', updated_by: 'RAKE')
end


