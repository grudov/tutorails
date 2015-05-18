Factory.define :user do |user|
  user.nom                    "Grudov"
  user.email                  "grudov@github.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end