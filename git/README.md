# Gitメモ

## 作成

### 既存のデータから作成

1. 既存のデータがあるフォルダに移動する
2. リポジトリを初期化する
3. `git init`
4. 既存のデータを addする
5. `git add .`

### 既存のリポジトリから作成

1. 既存のリポジトリの urlを取得
2. `git clone [url]`
3. 別の名前のディレクトリに作成したい場合
4. `git clone [url] othername`


## gitの基礎概念（ファイルの状態／ファイルが置かれている位置）

### untracked（追跡されてないファイル）

* 新しく作成されたファイルで、git addされていないファイル
* working directoryと呼ばれる作業ディレクトリ上にある状態

### unmodified - tracked（変更されていない/追跡されている）

* 一度、git addされたファイル
* その後、変更が特に行われていないファイル
* working directoryと呼ばれる作業ディレクトリ上にある状態

### modified - tracked（変更されている/追跡されている）

* 何らかの修正が加えられたが、修正後にgit addされていないファイル
* working directoryと呼ばれる作業ディレクトリ上にある状態

### staged - tracked（ステージされている/追跡されている）

* 何らかの修正が加えられ、修正後に、git addされたファイル
* staging areaと呼ばれるエリアにファイルがある状態

### commited - tracked（コミットされている/追跡されている）

* staging area上に存在した、git commitされたファイル
* staging areaにあるファイルが、永久不変に保持するスナップショットとして、git directory(repository)に格納されている状態


## gitの基礎概念（言葉）

### master

* デフォルトの開発ブランチ
* 最新のコミットのこと
* ローカルのリポジトリ

### origin

* デフォルトの上流リポジトリ
* リモート上のリポジトリ

### HEAD

* 現在のブランチの最新のコミットを指す
* ブランチを checkoutすると、HEADも移動する

### HEAD^ , HEAD^^ ...

* HEAD^ : 現在いる最新のブランチの最新コミットの一つ前のコミット
* HEAD^^ : 現在いる最新のブランチの最新コミットの二つ前のコミット



## 表示・確認

### untracked,trackedのファイルの状態を表示する

    git status

### trackedファイルに対する変更の内容表示

    作業ディレクトリの内容とステージングエリアの内容を比較し、まだステージされていない内容を知る事ができる
    git diff

    ステージされている変更と直近のコミットの内容を比較
    git diff --staged
    git diff --cached

    commit1とcommit2の差分を表示
    git diff commit1 commit2

    HEADとworking directoryとの差分を表示
    git diff HEAD
     
### コミットの履歴を表示する

    コミットされた履歴を表示する(日付・著者・タイトル・メッセージ）
    git log

    コミットされた履歴と変更点のパッチ形式の表示
    git log -p

    コミットされた履歴と変更の状態の表示（追加した変更と削除した変更の数表示）
    git log --stat

    コミットされた履歴を指定したn数だけ表示
    git log -n

    特定の範囲のコミット履歴を表示(commit1の次〜commit2まで表示)
    git log commit1..commit2

    特定ファイルのコミット履歴を表示（-n や --oneline は　ファイル名の前に記載)
    git log hoge.txt

    コミット履歴をグラフで表示(--onelineと組み合わせると見やすい)
    git log --graph

    コミット履歴を相対的な日時で表示
    git log --relative-date


### ファイルのどこを、誰が、いつ変更したか表示する

    変更点の表示
    git blame hoge.txt


### コミットID、ブランチ名、タグ名などのコミット内容を表示する

    コミット内容を表示
    git show $id

    あるファイルの特定の$idを表示
    git show $id:file.txt


### ブランチの作成・操作

    ブランチの作成
    git branch <branch name>

    ローカルブランチを見る
    git branch

    リモートブランチを見る
    git branch -r

    ローカル・リモートブランチ両方を見る
    git branch -a
    
    ブランチ名の変更
    git branch -m <oldbranch> <newbranch>

    ローカルブランチの削除
    git branch -d 削除するブランチ名
    例）git branch -d <branch name>

    リモートブランチの削除
    git push origin :<branch name>

    ブランチの統合（マージ）
    git merge <branch name> [opt]
    [opt]  --no-ff オプションを付けると、fast-forwardなマージであってもマージコミットを作成
    ブランチが存在したという情報を残したいときに有用なオプション
    
    1. ベースになるブランチに移動して（例: git checkout master）
    2. 統合したいブランチを指定（例: git merge <branch name>)


## 修正

### コミットを任意のバージョンに戻す(HEADの位置を変更する)
この説明がすごく分かりやすい[git resetについて](http://goo.gl/wyBNK)


    HEAD の位置を変更するコマンド
    git reset [opt] ●●●
    オプションによってインデックス、ワーキングツリーの内容も変更できる。
    
    ■ git reset のオプション
    HEADの位置のみ変更する。インデックス・ワーキングツリーに影響はなし
    --soft
    
    HEADの位置とインデックス変更する。ワーキングツリーに影響はなし
    --mixed(または、オプションなし)
    
    HEAD・インデックス・ワーキングツリーをすべて変更する
    --hard
    
修正コマンド例
    
    HEAD の位置をHEADに変更し、インデックス、ワーキングツリーはそのままにする。つまり何も変わらない。
    git reset --soft HEAD
    
    HEAD の位置がHEAD^ に移動するだけ。インデックス、ワーキングツリーはそのまま。
    git reset --soft HEAD^
    
    HEAD、インデックスを HEAD に変更する。ワーキングツリーはそのまま。git addを取り消す方法としてよく使える
    git reset HEAD
    
    ワーキングツリーの変更を残しつつ、HEAD、インデックスを HEAD^ に変更する。これも、変更前のインデックスのデータは消える
    git reset HEAD^
    
    HEAD、インデックス、ワーキングツリーすべてを HEAD に変更する。git add,ワーキングツリーの内容は完全に失われる
    git reset --head HEAD
    
    HEAD、インデックス、ワーキングツリーすべてを HEAD^ に変更する。git add,ワーキングツリーの内容は完全に失われる
    git reset --head HEAD^

    git resetコマンドは、実行前のHEADをORIG_HEADに保存するようになっている。間違ってgit resetコマンドを実行した場合には、このORIG_HEADを使えば戻せる。
    git reset --head ORIG_HEAD

### 直前にしたコミットをやり直す
    
    コミットをした後で、追加で少しだけ修正がしたくなった場合に、直前にしたコミットをやり直す方法
    git commit --amend
    1. git add 追加ファイル
    2. git commit --amend

## ファイルの削除、移動

### 削除

    gitの管理下に置かれたファイルを削除する
    git rm 削除するファイル名
    例）git rm hoge.txt

### 移動・名前変更

    gitの管理下に置かれたファイルの移動・名前変更
    git mv 移動元 移動先
    例）git mv log/hoge.txt tmp/hoge.txt


## gitの管理下から外す場合

### .gitignoreファイルの使い方

    .gitignoreファイルに、gitの管理下から外すファイルを記述する。
    .gitignoreファイルは、置かれているのと同じ階層及びその下位階層のみ有効に働く。
    例）.gitignore
    tmp/*
    log/*




## gitの設定変更メモ

### terminalの出力への色づけ方法
すべてをターミナルのデフォルト色設定にまかせる場合

    git config --global color.ui true