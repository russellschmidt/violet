module UsersHelper

  def any_posts?
    @user.posts.count == 0 ? false : true
  end

  def any_comments?
    @user.comments.count == 0 ? false : true
  end

  def any_posts_or_comments?
    if any_posts? || any_comments?
      true
    else
      false
    end
  end
end
