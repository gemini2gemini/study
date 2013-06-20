# Octopressメモ

## 運用

### 記事を書く

    // 新しい記事の生成
    rake new_post["post_name"]
　　
    // 上記コマンドにより、_postディレクトリに年月日付きのページが生成される
    source/_posts/YYYY-mm-DD-post-name.markdown

    // 作成された YYYY-mm-DD-post-name.markdown　のtitle,categoriesを記載する

    ---
	layout: post
	title: "post title"
	date: YYYY-MM-DD hh:mm
	comments: true
	categories: [category1, ...]
	---

	// 記事をmarkdown記法で記述する
    ### タイトル
    あいうえお・・・

    // 記事を生成・デプロイする（これで記事が更新される）
    rake gen_deploy

    //githubに記事をcommitする
    git add .
    git commit -m "message"
    got push origin source