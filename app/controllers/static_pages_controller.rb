class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost = current_user.microposts.build if logged_in?
    followed_by_user = Relationship.followed_by_user(current_user.id)
    @feed_items = Micropost.feed_for(current_user.id, followed_by_user).order_post.paginate page: params[:page]
  end

  def help; end

  def about; end

  def contact; end
end
