class RelationshipMailer < ApplicationMailer
  def follow_mail(followed)
    @followed = followed
    mail(to: 'admin@mealldiary.com', subject: 'Follow Notificataion')
  end
end
