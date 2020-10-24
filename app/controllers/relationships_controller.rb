class RelationshipsController < ApplicationController
  def create
    @followed_user = User.find(params[:relationship][:followed_id])
    @relationship = current_user.active_relationships.new(followed_id: @followed_user.id)

    @relationship.save
    RelationshipMailer.follow_mail(@followed_user).deliver!
    flash[:notice] = "You just followed #{@followed_user.username}"

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    return unless @relationship.follower == current_user

    @relationship.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = "You just unfollowed #{@relationship.followed.username}"
  end
end
