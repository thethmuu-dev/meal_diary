class RelationshipsController < ApplicationController
  def index
    @active_relationships = current_user.active_relationships
    @passive_relationships = current_user.passive_relationships
  end

  def create
    @followed_user = User.find(params[:relationship][:followed_id])
    @relationship = current_user.active_relationships.new(followed_id: @followed_user.id)
    if @relationship.save
      flash[:notice] = "Followed #{@followed_user.username}"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    return unless @relationship.follower == current_user

    @relationship.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = "Unfollowed #{@relationship.followed.username}"
  end
end
