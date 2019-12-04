body = 
"これは特別研究で使用するウェブサイトです．"

print("\e[33m create - no_login !!!!! \e[0m \n")
Article.create(
  title: "サイト作成",
  body: "このお知らせは未ログイン状態でも見ることができるお知らせです．" + body,
  released_at: 0.days.ago,
  expired_at: nil,
  user_only: false
)

print("\e[33m create - login !!!!! \e[0m \n")
Article.create(
  title: "サイト作成[ユーザー限定]",
  body: "これはログイン後にのみ見ることができます．" + body,
  released_at: 0.days.ago,
  expired_at: nil,
  user_only: 1
)