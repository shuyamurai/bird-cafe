<div class="new">
  <div class="posts_top">
    <p>投稿する</p>
  </div>

  <% @item.errors.full_messages.each do |message| %>
      <div class="form-error">
        <%= message %>
      </div>
  <% end %>
            
  <div class="new_container">
    <%= form_tag("/item/create") do %>

    <p class="midashi">商品名</p>
    <input type="text" class="form-control" name="name" value="<%= @item.name %>">

    <p class="midashi">AmazonのURL</p>
    <input type="text" class="form-control" name="url" value="<%= @item.url %>">

    <p class="midashi">ISBN/ASINコード</p>
    <input type="text" class="form-control" name="code" value="<%= @item.code %>">

    <div class="hosoku">
      <p>※Amazonページの下部の登録情報に記載されているコードを入力して下さい。書籍はISBNコード、書籍以外はASINコードです。</p>
    </div>

    <p class="midashi">コメント</p>
      <textarea class="form-control" rows="5" name="description"><%= @item.description %></textarea>

      <button type="submit" class="btn btn-primary submit_btn">投稿</button>
      <% end %>
  </div>

  <div class="return-top">
    <%= link_to("トップに戻る","/items/index") %>
  </div>
</div>



------------------------------------------------------

.new {
  max-width: 600px;
  margin: 0 auto;
  border: 1px solid gray;
}

.posts_top {
  background-color: #343A40;
  text-align: center;
  color: white;
  padding: 6px;
}

p {
  margin-top: 0;
  margin-bottom: 1rem;
}

.new_container {
  padding: 20px;
}

.midashi {
  padding: 0.25em 0.5em;
  margin-top: 20px;
  color: #494949;
  background: transparent;
  border-left: solid 5px #7db4e6;
}

.form-control {
  display: block;
  width: 100%;
  height: calc(2.25rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.hosoku {
  margin: 10px 0;
}


textarea.form-control {
  height: auto;
}

.btn:not(:disabled):not(.disabled) {
  cursor: pointer;
}

.btn-primary {
  margin-top: 20px;
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
}

.btn {
  width: 560px;
  display: inline-block;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  user-select: none;
  border: 1px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}




.return-top{
  text-decoration: none;
  width: 560px;
  margin-top: 20px;
  color: #fff;
  background-color: #007bff;
  border-color: #007bff;
  display: inline-block;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  user-select: none;
  border: 1px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}




---------------------------------------------------------------------

<div class="top-image">
  <img src="top-image.jpg" class="book-image">
</div>

<div class="top-comment">
  <div class="ribbon6">
    <h3>あなたのオススメの本をシェアしよう</h3>
  </div>

  <div class="box16">
    <p>プログラミング学習で役に立った教科書<br>心が震えた自己啓発本<br>トリックに驚愕したミステリー小説等<br>なんでもOK！</p>
  </div>

  <div class="new-post">
    <%= link_to("オススメの一冊を投稿","/items/new") %>
  </div>
</div>

<div class="container">
  <div class="row">
    <% @items.each do |item| %>
      <div class="col-md-4 col-sm-6 col-xs-12">
          <%= link_to("/items/#{item.id}") do %>
          <div class="main-contents">
            <div class="main-image">
                <img src="">
            </div>
            <div class="content-wrapper">
              <div class="book-title">
                <p><%= link_to(item.name,"/items/#{item.id}") %></p>
              </div>
              <div class="main-message">
                  <%= item[:book_message] %>
              </div>

              <div class="left-container">
                  <%= link_to("/items/#{item.id}") do %>
                      <span class="fa fa-heart like_button"></span>：
                      <% if item.like_count == nil %>
                          0
                      <% else %>
                          <%= item.like_count %>
                      <% end %>
                  <% end %>
              </div>
              <div class="right-container">
                  <img src="
                  <% if item.user.twitter_image != nil %>
                      <%= "#{item.user.twitter_image}" %>
                  <% else %>
                      <%= "/user_images/#{item.user.image_name}" %>
                  <% end %>
                  " class="user_image3">
                                    
                  <div class="main-user"><%= item.user.name %></div>
              </div>
            </div>
          </div>
          <% end %>
      </div>
      <% end %>
  </div>
</div>