# rails のビューヘルパー

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


f.Formヘルパー

    <%= f.label prop %>                                    :ラベル生成
    <%= f.text_field prop[,opts] %>                :テキストボックスを生成
    <%= f.password_field prop[,opts] %>        :パスワード入力ボックスを生成
    <%= f.file_field prop[,opts] %>                 :ファイル選択ボックスを生成
    <%= f.hidden_field prop[,opts] %>           :隠しフィールドを生成
    <%= f.email_field prop[,opts] %>             :メールドレス入力ボックスを生成
    <%= f.number_field prop[,opts] %>          :数値入力ボックスを生成
    <%= f.range_field prop[,opts] %>             :範囲バーを生成
    <%= f.search_field prop[,opts] %>            :検索ボックスを生成
    <%= f.telephone_field prop[,opts] %>       :電話番号入力ボックスを生成
    <%= f.url_field prop[,opts] %>                   :URL入力ボックスを生成
    <%= f.text_area prop[,opts] %>                   :テキストエリアを生成
    <%= f.radio_button prop, value[,opts] %>         :ラジオボタンを生成
    <%= f.check_box prop, [,opts[,checked= "1" [,unchecked = "0"]]] %>:チェックボックスを生成
    <%= f.select prop, choice[,opts[,html_opts]] %>         :選択ボックスを生成


Formヘルパー

    <%= label obj, prop[,body[,opts]] %>                  :ラベル生成
    <%= text_field name [,value[,opts]] %>                :テキストボックスを生成
    <%= password_field obj, prop[,opts] %>        :パスワード入力ボックスを生成
    <%= file_field obj, prop[,opts] %>                 :ファイル選択ボックスを生成
    <%= hidden_field obj, prop[,opts] %>           :隠しフィールドを生成
    <%= email_field obj, prop[,opts] %>             :メールドレス入力ボックスを生成
    <%= number_field obj, prop[,opts] %>          :数値入力ボックスを生成
    <%= range_field obj, prop[,opts] %>             :範囲バーを生成
    <%= search_field obj, prop[,opts] %>            :検索ボックスを生成
    <%= telephone_field obj, prop[,opts] %>       :電話番号入力ボックスを生成
    <%= url_field obj, prop[,opts] %>                   :URL入力ボックスを生成
    <%= text_area obj, prop[,opts] %>                   :テキストエリアを生成
    <%= radio_button obj, prop, value[,opts] %>         :ラジオボタンを生成
    <%= check_box obj, prop, [,opts[,checked= "1" [,unchecked = "0"]]] %>:チェックボックスを生成
    <%= select obj, prop, choice[,opts[,html_opts]] %>         :選択ボックスを生成
　　　

FormTagヘルパー

    <%= label_tag obj, prop %>                               :ラベル生成
    <%= text_field_tag name[,value[,opts]] %>                :テキストボックスを生成
    <%= password_field_tag name[,value[,opts]] %>        :パスワード入力ボックスを生成
    <%= file_field_tag name[,value[,opts]] %>                 :ファイル選択ボックスを生成
    <%= hidden_field_tag name[,value[,opts]] %>           :隠しフィールドを生成
    <%= email_field_tag name[,value[,opts]] %>             :メールドレス入力ボックスを生成
    <%= number_field_tag name[,value[,opts]] %>          :数値入力ボックスを生成
    <%= range_field_tag name[,value[,opts]] %>             :範囲バーを生成
    <%= search_field_tag name[,value[,opts]] %>            :検索ボックスを生成
    <%= telephone_field_tag name[,value[,opts]] %>       :電話番号入力ボックスを生成
    <%= url_field_tag name[,value[,opts]] %>                   :URL入力ボックスを生成
    <%= text_area_tag name[,content[,opts]] %>              :テキストエリアを生成
    <%= radio_button_tag name, value[,[checked = false [,opts]] %>         :ラジオボタンを生成
    <%= check_box_tag name, [,value = "1" [,checked = false [,opts]]] %>:チェックボックスを生成




### 用語

    FormTagヘルパー
    label_tag, text_field_tag,text_area_tagのように、末尾に _tag付きのヘルパー

    Formヘルパー
    label, text_field, text_areaのように、末尾に _tagなしのヘルパー

    f.Formヘルパー
    f.label, f.text_fieldのように、「f.」で呼び出すヘルパー









