# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def account_activation
    user = User.new(name: 'Joe Smith', email: 'inesherald@gmail.com')

    UserMailer.with(user: user).account_activation
  end

  def invitation
    user = User.new(name: 'MephistoDevelop', email: 'inesherald@gmail.com')
    event = Event.new(title: 'Rails Project', content: 'Simple Rails Project', start: '2019-10-18 09:09:00',
                      end: '2019-07-06 03:33:00', location: 'Lagos de Moreno, Jalisco', creator_id: 6)
    UserMailer.with(user: user, event: event).invitation
  end
end
