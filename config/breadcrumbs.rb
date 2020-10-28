crumb :root do
  link "Top", root_path
end

crumb :items do
  link "探し物一覧", items_path
  parent :root
end

crumb :user do |user|
  link "#{user.name}", user_path(user)
  parent :items
end

crumb :edit_user do |user|
  link "編集", edit_user_registration_path
  parent :user, user
end

crumb :item do |item|
  link "#{item.name}", item_path
  parent :items
end

crumb :edit_item do |item|
  link "編集", edit_item_path
  parent :item, item
end

crumb :create_item do |item|
  link "新規作成", new_item_path
  parent :items
end

crumb :notification do |notification|
  link "通知", notifications_url
  parent :items
end
