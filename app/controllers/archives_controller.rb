class ArchivesController < ApplicationController
  def index
    @entries = Entry.where(user_id: current_user.id)
                    .group_by(&:day)
  end
end
