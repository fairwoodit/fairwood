class UserMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default from: "fairwoodit@gmail.com"

  # @param [Student] student
  def new_pledge_email(student)
    @student = student
    @pledges = student.walkathon_pledges
    parent_emails = student.family.parents.map(&:email)
    mail(to: parent_emails, subject: "#{student.first_name} has a new pledge!")
  end
end
