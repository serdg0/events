class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper
  include SessionsHelper
  include AttendancesHelper
  default from: 'from@example.com'
  layout 'mailer'
end
