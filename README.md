<% if Like.find_by(user_id: current_user.id, item_id: @item.id) %>
  <%= link_to "/items/#{@item.id}/likes/#{@item.likes.ids}", method: :delete, class:"element", remote: true do %>
    <%= icon("fas", "heart", class: "like") %>
  <% end %>
<% else %>
  <%= link_to "/items/#{@item.id}/likes", method: :post, class:"element", remote: true do %>
    <%= icon("fas", "heart", class: "unlike") %>
  <% end %>
<% end %>
<div class="count">
  <%= @item.likes.length %>



  ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


  <% if Like.find_by(user_id: current_user.id, item_id: @item) %>
  <%= link_to "/items/#{@item}/likes/#{@item}", method: :delete, class:"element", remote: true do %>
    <%= icon("fas", "heart", class: "like") %>
  <% end %>
<% else %>
  <%= link_to "/items/#{@item}/likes", method: :post, class:"element", remote: true do %>
    <%= icon("fas", "heart", class: "unlike") %>
  <% end %>
<% end %>
<div class="count">


