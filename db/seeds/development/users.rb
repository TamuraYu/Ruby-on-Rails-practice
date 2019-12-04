names = %w(yu1 yu2 yu3 yu4 yu5 yu6 yu7 yu8 yu9 yu10)

print("\e[33m create - Admin(yu1) !!!!! \e[0m \n")
User.create(
    user_name: "yu1",
    admin: 1,           # 条件式?a:b
    gender: 1, # 条件式?a:b
    mail: "yu1@phi.com",
    birthday: "1996-11-13",
    password: "passw0rd",
    password_confirmation: "passw0rd"
  )
  print("\e[33m create - Users(yu2~10) !!!!! \e[0m \n")
1.upto(9) do |idx|
  User.create(
    user_name: names[idx],
    admin: 0,           # 条件式?a:b
    gender: ((idx+1) % 2 == 0 ? 0 : 1), # 条件式?a:b
    mail: "#{names[idx]}@phi.com",
    birthday: "1996-11-#{idx+13}",
    password: "passw0rd",
    password_confirmation: "passw0rd"
  )
end
print("\e[33m create - User(yu11~30) !!!!! \e[0m \n")
10.upto(29) do |idx|
  User.create(
    user_name: "yu#{idx + 1}",
    admin: 0,
    gender: ((idx+1) % 2 == 0 ? 0 : 1),
    mail: "yu#{idx}@phi.com",
    birthday: "1996-11-#{idx}",
    password: "passw0rd",
    password_confirmation: "passw0rd"
  )
end