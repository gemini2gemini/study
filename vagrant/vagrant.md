
#Vagrant(ベイグラント)について

##仮想マシンを作るツール

+ 設定を一度行えば何度でも作成できる
+ http://www.vagrantup.com
+ rubyで書かれている

## VirtualBoxを使用する(VirtualBox.org)

##手順

1. virtulaboxをインストール
    + https://www.virtualbox.org/wiki/Downloads
    + http://fnya.cocolog-nifty.com/blog/2013/12/mac-virtualbox-.html
2. vagrantをインストール
    + http://www.vagrantup.com
3. インストール確認(ターミナルで、vagrant --version):バージョンが出れば成功
4. 仮想マシンの立ち上げ
5. Box（テンプレート）の取得 (Vagrantup.comにある)
    + http://docs.vagrantup.com/v2/getting-started/boxes.html
    + vagrant box add hashicorp/precise32 （公式サイトのbox追加)
    + boxがダウンロードされる
    + どのようなboxがあるかは、 vagrant box list　で確認可能
6. それ以外のBoxの追加も可能(www.vagrantbox.es)
    + vagrantbox.es から該当するboxのurlをコピー
    + vagrant box add [自由なbox名] url
7.  追加されたboxは、　ホームフォルダ内の .vagrant.d/boxes 内に格納される
8. テンプレートを元に、自分にあった設定に初期化
    + 一つのテンプレートから複数の仮想マシンを作成可能
    + 仮想マシンごとにディレクトリ作成必要
    + 仮想マシンを入れるフォルダ作成(mkdir　●●)
    + フォルダに移動
    + boxを初期化するコマンド入力 (vagrant init ●●(box名))
    + Vagrantfileが作成される (Rubyで記述された仮想マシンの設定ファイル)
9. 仮想マシンの立ち上げ
    + Vagrantfileがあるフォルダにて、 vagrant up コマンド入力
    + 自動的に、仮想マシンが作成される
    + 仮想マシンは、 virtualbox上に存在する
    + 別の仮想マシンを作る場合は、8と9の作業を繰り返せば良い
10.　仮想マシンの停止・再起動・削除
    + vagrant suspend ,up ,resume, reload
11. 仮想マシンへの接続
    + vagrant ssh 　SSH接続が行われる
    + vagrantユーザーとして CentOS（この設定では）に接続できる
    + /home/vagrant に入っている状態
    + vagrant@localhost
    + CentOSで使えるコマンドが利用できるようになる
    + webサーバーのインストール、webサーバーの立ち上げ、ファイアーウォールの停止など
12. webページの表示
    + centOSでは、vagrant@localhost $cd /var/www/html にファイルを作成する必要あり
    + index.htmlファイルの作成   sudo vi index.html
    + exit コマンドで 仮想マシンからログアウト
13.　ネットワークの設定
    + Vagrantfile の設定変更
    + config.vm.network "private_network", ip: "192.168.33.10" をコメントイン
    + 上記の作業により、 192.168.33.10でアクセスできるようになる
    + Vagrantfileの設定を変更したので、 vagrant reload　をして再起動する
    + 192.168.33.10　で ブラウザで表示ができるようになる
14. オプション(共有フォルダの利用)
    + Vagrant では、ホストOSから仮想マシンのファイルを編集することができる
    + ローカル環境の Vagrantfileがある場所は、仮想マシン vagrant ssh時の cd /vagrantと同じ場所になる
    + そのため、/vagrant の中にファイルを作成すると、ローカル環境のVagrantfile内にも同じファイルが作成される
    + webサーバーのドキュメントrootに、/vagrant を設定すればローカルでの編集が即座に仮想マシンに反映されるようになる
    + 以下の作業で設定が可能になる
        * 現在ある内容を削除   sudo rm -rf /var/www/html
        * シンボリックリンクの設定 sudo ln -fs /vagrant /var/www/html (ローカルの/vagrantにファイルを入れると、 /var/www/htmlに入る)
        * ホストOS側から仮想マシンのファイルの更新ができるようになる
15. オプション(Provisioning)
    +仮想マシンが立ち上がった後に実行される処理
    + Vagrantfile　を修正することで実現できる
    + shefなどの高度なツールを使う方法もあるが、シェルスクリプトでも代用できる
    + Vagrantfile内に、実行したい内容を記述する
        * config.vm.provision という記述から開始する
        * config.vm.provision :shell, :inline =>  "echo hello world"
    + vagrant up で、仮想マシンを立ち上げると provisioningを確認できる
    +但し、Vagrantfileにshellを大量に記述すると煩雑になるため、外部ファイルに記述して読み込む方式にする
        * config.vm.provision :shell, :path => "provision.sh"
    +shellファイル(ここでは、provision.sh)に、webサーバーのインストールや立ち上げなどの記述を行う
        * sudo yum -y install httpd など
    +provisonのみ実行   vagrant provision　コマンド
16. オプション(自分のBoxの作成)
    + 現在の仮想マシンの状態からBoxを作成していく方法
    + vagrant package コマンド
    + 現在の仮想マシンをシャットダウンして、boxを作成する
    + Vagrantfileと同じ階層に、 package.boxというファイルが作成される
    + このpackage.boxに名前をつけて、box listに追加することできる
        * vagrant box add ●●(好きな名前) package.box
        * boxに追加した後は、 package.boxは不要なので削除しても良い
    + box listにつけた名前で登録されたので、このboxを使って新しい仮想マシンを作成できる
        * vagrant init ●●
17. オプション(プラグイン)
    + プラグインの入れ方  vagrant plugin install ●●
    + saharaというプラグインの導入　vagrant plugin install sahara
18. オプション(プラグイン:saharaの使い方)
    + sandboxモードを有効にするプラグイン
    + sandboxモードになると　仮想マシン内に加えた修正をロールバックができるようになる
    + sandboxモードで修正が問題なければ、 vagrant sandbox commit コマンドで確定する
    + commit を行う場合は、仮想マシンが起動していると時間がかかるので、 vagrant suspendなどで一時的に停止する




## コマンドリスト

    vagrant --version    バージョンの確認
    vagrant box list     現在入っている boxの確認
    vagrant box add ●●   ●●というboxの追加
    vagrant box add hashicorp/precise32　公式サイトにあるboxの追加
    vagrant box add ●●● url(vagrantbox.esなどからのurl) 外部からのboxの追加
    vagrant box -h  vagrant box　と合わせて使えるコマンドの確認
    vagrant box remove ●●  ●●というboxの削除
    vagrant init ●●　　●●というboxを初期化する
    vagrant up    Vagrantfileがあるフォルダで行うと仮想マシンを立ち上げる
    vagrant provision  仮想マシンは立ち上がっていて、provisionのみ実行したい場合
    vagrant package   現在起動している仮想マシンの状態から Box用のpackage作成
    vagrant plugin install ●●　　　●●というプラグインをインストール
    vagrant plugin -h  vagrant plugin　と合わせて使えるコマンドの確認


## 仮想マシンの操作コマンド

    vagrant status  現在の仮想マシンの状態表示
    vagrant suspend 仮想マシンを一時停止
    vagrant resume  仮想マシンを一時停止からの復帰
    vagrant halt    シャットダウン
    vagrant up      再起動
    vagrant reload   Vagrantfileの再読み込み(一時シャットダウンが行われる)
    vagrant destroy  仮想マシンの削除
    vagrant ssh     localhostへのssh接続（これで仮想マシンに入る事ができる）

## CentOS内で使用できるコマンド

    sudo yum -y install httpd 　　webサーバーのインストール
    sudo service httpd start     webサーバーの立ち上げ
    sudo chkconfig httpd on 　再起動してもwebサーバーがonになるように
    sudo service iptables stop ファイアーウォールの停止(ローカル開発では問題ない)
    sudo chkconfig iptables off 再起動してもファイアーウォールが立ち上がらないようにする
    sudo service httpd status webサーバーの状況確認

## プラグイン saharaを入れる事で利用できるコマンド

    vagrant sandbox on  sandboxモード開始
    vagrant sandbox status 　sandboxモードの状況確認
    vagrant sandbox rollback sandboxの巻き戻し
    vagrant sandbox commit sandboxモードの作業の確定
    vagrant sandbox off  sandboxモード終了


## boxesの格納先

    cd ./.vagrant.d/boxes 　　このフォルダに格納される


## vagrantbox.es

+ 有志の人が作った vagrant のbox置き場
+ 利用は自己責任
+ 様々なboxがあるので、自分の環境にあったものを使用


## 補足

    vagrantのappache修正
    httpd.confの場所:  etc/httpd/conf/httpd.conf
    修正する場合  sudo vim httpd.conf　とsudoをつけて、 保存する際は、 :wq! とする
