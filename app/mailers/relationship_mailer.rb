class RelationshipMailer < ApplicationMailer
  def follow_mail(followed)
    @followed = followed
    mail(to: "user@gmail.com", subject: 'Follow Notification')
  end
end
