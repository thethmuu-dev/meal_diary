class Entry < ApplicationRecord
  belongs_to :user

  def day
    self.created_at.strftime('%b %e, %Y')
  end
end
