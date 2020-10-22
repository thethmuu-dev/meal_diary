class ArchivesController < ApplicationController
  def index
    @entries = Entry.order(created_at: :desc)
                    .where(user_id: current_user.id)
                    .group_by(&:day)
  end
end
