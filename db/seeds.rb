# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Group.count==0
Group.create(code: 'ADMIN', name: 'Administration', description: 'Administrators group')
end
if User.count==0
User.create(name: 'Administrator', first_name: 'Keyman', is_admin: true, email: 'fred@nohoo.biz', user_name: 'Admin', language: ':en',
            group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!', role_id: 0)
end
if Parameter.count==0
Parameter.create(id: 0, name: 'Undefined', description: 'Undefined value', code: 'UNDEF', value: 'UNDEF')
Parameter.create(id: 1, name: 'Administrator role', description: 'Application administator', code: '0', value: 'Administrator', list_name: 'Roles')
Parameter.create(id: 2, name: 'Statistical Sector Manager', description: 'Statistical Sector Manager', code: '1', value: 'StatAdmin', list_name: 'Roles')
Parameter.create(id: 3, name: 'Cryptographic Keys Administrator', description: 'Cryptographic Keys Administrator', code: '2', value: 'KeyAdmin', list_name: 'Roles')
Parameter.create(id: 4, name: 'Statistic data steward', description: 'Statistic data steward', code: '3', value: 'StatWorker', list_name: 'Roles')
Parameter.create(id: 5, name: 'Enforce role security', description: 'Strictly respect role segregation in managing and using Cryptographic Keys', code: 'TRUE', value: '1')
end
