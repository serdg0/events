class ApplicationMailer < ActionMailer::Base
  include AttendancesHelper
  default from: 'from@example.com'
  layout 'mailer'
end
