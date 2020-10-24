class HomeController < ApplicationController
  def index
    @pagy, @followed_users = pagy(current_user.followed_users, items: 5)
  end
end
