### フォーム関連のビューヘルパー

form_tagメソッド: 汎用的なフォームを生成する

    前提となるモデルが存在しない汎用的なフォーム(検索フォームなど)の生成に利用
    form_tagメソッド配下では、モデルに関連づかないFormTagヘルパーを利用することが推奨される

    <%= form_tag(リンク先 [オプション]) do %>
    <% end %>


    <%= form_tag({controller: "keyword", action: "search"},{id: "fm", class: "search"}) do %>
    検索キーワード：
    <% end %>

    ↓↓↓↓↓↓↓↓↓↓↓↓

    <form accept-charset="UTF-8" action="/keyword/search" class="search" id="fm" method="post">
    <div style="margin:0;padding:0;display:inline">
    <input name="utf8" type="hidden" value="&#x2713;" />
    <input name="authenticity_token" type="hidden" value="ZZLtHSfm6GXgkTZADHC9R1rrd2EhBW/m3WueF0iPfpw=" />
    </div>
    検索キーワード：
    </form>


    form_tagメソッドで、モデルを編集するためのフォームを生成する場合、Formヘルパーを利用する


form_forメソッド: モデルを編集するためのフォームを生成する

    モデルを編集するためのフォームを生成する

    <%= form_for(model) do |f| %>
    <% end %>

    form_forメソッドとあわせて、form_for配下で利用できるf.Formヘルパーがある。
    f.label
    f.text_field
    f.date_select
    f.check_box
    f.submit

    例）
    <%= f.label :isbn %>
    <%= f.text_filed :isbn %>

    
    <%= form_for(@book) do |f| %>
      <div class="filed">
        <%= f.label :isbn %><br />
        <%= f.text_field :isbn, {size: 25} %>
      </div>
      <div class="actions">
        <%= f.submit %>
      </div>
    <% end %>

    ↓↓↓↓↓↓↓↓↓↓↓↓

    <form accept-charset="UTF-8" action="/books" class="new_book" id="new_book" method="post">
      <div style="margin:0;padding:0;display:inline">
      <input name="utf8" type="hidden" value="&#x2713;" />
      <input name="authenticity_token" type="hidden" value="ZZLtHSfm6GXgkTZADHC9R1rrd2EhBW/m3WueF0iPfpw=" />
    </div>
    <div class="filed">
      <label for="book_isbn">Isbn</label><br />
      <input id="book_isbn" name="book[isbn]" size="25" type="text" />
    </div>
    <div class="actions">
      <input name="commit" type="submit" value="Create Book" />
    </div>
    </form>


### 用語

    FormTagヘルパー
    label_tag, text_field_tag,text_area_tagのように、末尾に _tag付きのヘルパー

    Formヘルパー
    label, text_field, text_areaのように、末尾に _tagなしのヘルパー

    f.Formヘルパー
    f.label, f.text_fieldのように、「f.」で呼び出すヘルパー









    