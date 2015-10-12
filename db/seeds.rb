# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Project.create(name: "First", status: true, description: "First Project")
Project.create(name: "Second", status: true, description: "Second Project")
Project.create(name: "Third", status: false, description: "Third Project")

Role.create(name: "admin")
Role.create(name: "user")

Report.create(comment: "1Best Project!!!", user_id: 1, project_id:1)
Report.create(comment: "2Best Project!!!", user_id: 1, project_id:2)
Report.create(comment: "3Best Project!!!", user_id: 2, project_id:1)
Report.create(comment: "4Best Project!!!", user_id: 2, project_id:2)