class UserMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default from: "fairwoodit@gmail.com"

  # @param [Student] student
  def new_pledge_email(student)
    @student = student
    @pledges = student.walkathon_pledges
    parent_emails = student.emails.split(',').map(&:strip)
    mail(to: parent_emails, subject: "#{student.first_name} has a new pledge!")
  end
end
