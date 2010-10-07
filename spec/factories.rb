# By using the symbol :user, we get Factory Girl to simulate the user model.
Factory.define :user do |user|
  user.name         "Michael Bazzinotti"
  user.email        "bazz@bazz1.com"
  user.password     "foobar"
  user.password_confirmation  "foobar"
end