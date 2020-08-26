<div class="show">

  <div class="show-image">
    <img src="http://images-jp.amazon.com/images/P/<%= @item.code %>.09.LZZZZZZZ">
  </div>
  <div class="book-title-show">
    <p><%= @item.name %></p>
  </div>
  <div class="buy">
    <a href="<%= @item.url %>" class="btn-stitch" target=”_blank”>購入ページへ</a>
  </div>
  <div class="post-user flex space">
    <p class="bold"><%= @item.name %></p>
    <p class="post-time"><%= @item.created_at.strftime("%Y-%m-%d %H:%M") %></p>
  </div>
  <div class="post-message">
    <p><%= @item.description %></p>
  </div>

            

  <div class="twitter-link">
    <%= link_to("#{@item.name}","/users/#{@item.id}/show") %>さんの投稿一覧を見る
  </div>


  <% if user_signed_in? && current_user.id == @item.user_id %>
    <%= link_to '商品の編集',  class: "item-red-btn" %>
    <p class='or-text'>or</p>
    <%= link_to '削除', item_path(@item.id), method: :delete, class:'item-destroy' %>
  <% else @items_id.present?%>
    <%= link_to '購入画面に進む',  item_orders_path(@item), method: :get ,class:"item-red-btn"%>
  <% end %>
            



            
  <div class="return-top">
    <%= link_to("トップに戻る","/item/index") %>
  </div>


</div>