class FavoriteMailer < ApplicationMailer
  default from: "mail@russellschmidt.net"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@russellschmidt.net>"
    headers["In-Reply-To"] = "<post/#{post.id}@russellschmidt.net>"
    headers["References"] = "<post/#{post.id}@russellschmidt.net>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")

  end
end
