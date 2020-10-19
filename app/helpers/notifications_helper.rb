module NotificationsHelper
#
#   def get_notifications
#     @notifications = current_user.passive_notifications
#     @notifications.where(checked: false).each do |notification|
#       notification.update_attributes(checked: true)
#     end
#   end
#
#   def notification_form(notification)
#     @visitor = notification.visitor
#     @comment = nil
#     your_item = link_to 'あなたの投稿', users_item_path(notification), style:"font-weight: bold;"
#     @visitor_comment = notification.comment_id
#     #notification.actionがfollowかlikeかcommentか
#     case notification.action
#       when "like" then
#         tag.a(notification.visitor.name, href:users_user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"にいいねしました"
#       when "comment" then
#         @comment = Comment.find_by(id: @visitor_comment).content
#         tag.a(@visitor.name, href:users_user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"にコメントしました"
#     end
#   end
#
#   def unchecked_notifications
#     @notifications = current_user.passive_notifications.where(checked: false)
#   end
end
