# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def account_activation
    user = User.new(name: "Joe Smith", email: "inesherald@gmail.com")

    UserMailer.with(user: user).account_activation
  end
end
