crumb :root do
  link "Top", root_path
end

crumb :items do
  link "探し物一覧", items_path
  parent :Top
end

crumb :user do |user|
  link user.name, user_path(user)
  parent :items
end

crumb :edit_user do |user|
  link "編集", edit_user_registration_path
  parent :user, user
end

crumb :item do |item|
  link item.name, item_path
  parent :items
end

crumb :edit_items do |item|
  link "編集", edit_item_path
  parent :item, item
