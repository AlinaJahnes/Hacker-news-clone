# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
USER = [["monkey","banana"],["apple","bee"],["grape",'fruit']]
ARTICLES = [["The 3 Percent – Why Tech Has A Diversity Problem","It’s no secret that tech has a diversity problem. Women are largely underrepresented, and Blacks and Latinos are almost invisible."],
            ["Google Signs On As OpenStack Sponsor, Will Contribute Container Tech","Google is joining the OpenStack Foundation as the open source project’s newest corporate sponsor, the two organizations announced today. Google, which has informally collaborated with OpenStack on a number of projects like the Murano application catalog and in the Magnum container orchestration service in the past, will contribute engineering resources to the project."],
            ["Hello world", "Everybody come and learn coding!"],
            ["What does the fox say?", "Ding ding ding ding ding"],
            ["What does cartman say?", "Screw you guys! I'm going home!"]
            ]

COMMENTS = ["I want ice cream.", "This is so cool!", "This is great.", "I want to go surfing"]

USER.each do |user|
  User.create(username: user[0], password: user[1])
end

ARTICLES.each do |a|
  Article.create(title: a[0], body: a[1], user_id: (1..3).to_a.sample)
end

COMMENTS.each do |c|
  Comment.create(content: c, article_id: (1..5).to_a.sample, user_id: (1..3).to_a.sample)
end


