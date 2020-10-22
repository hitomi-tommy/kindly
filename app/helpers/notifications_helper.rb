module NotificationsHelper
  def notification_form(notification)
    #通知を送ってきたユーザーを取得
    @visitor = notification.visitor
    @visited = notification.visited
    #コメントの内容を通知に表示する
    @comment = nil
    @visitor_comment = notification.comment_id
    # notification.actionがfollowかlikeかcommentかで処理を変える
    case notification.action
    when 'like'
      tag.a(notification.visitor.name, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: item_path(notification.item_id)) + 'にいいねしました'

    when 'comment' then
      #コメントの内容と投稿のタイトルを取得　
      @comment = Comment.find_by(id: @visitor_comment)
      @comment_content =@comment.content
      @item_description =@comment.item.description
      tag.a(@visitor.name, href: user_path(@visitor)) + 'が' + tag.a("#{@item_description}", href: item_path(notification.item_id)) + 'にコメントしました'
    end
  end
end
