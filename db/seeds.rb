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
            group_id: 1, password: '@KeyAdmin15!', password_confirmation: '@KeyAdmin15!')
end
if Parameter.count==0
Parameter.create(name: 'Undefined', description: 'Undefined value', code: 'UNDEF', value: 'UNDEF')
end
