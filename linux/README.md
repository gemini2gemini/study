#Linuxサーバーについて

##Linuxを使用して実現可能なサーバー種類

+ Webサーバー:WEBサイトを管理、情報を提供：webサイトのデータをクライアント（ブラウザ）に提供する
+ FTPサーバー：ファイルのアップロード・ダウンロードなどのファイル転送サービスの提供
+ データーベースサーバー：データベースの管理サーバー
+ ファイルサーバー：ネットワーク経由でファイル共有
+ プリンターサーバー：ネットワーク経由でプリンター共有
+ メールサーバー：メールの送付・受信
+ DNSサーバー：IPアドレスとホスト名の変換
+ SSHサーバー：安全なリモートログインの実現
+ プロキシサーバー：代理接続によるセキュリティの向上、キャッシュ管理による接続速度の向上

##Linuxサーバーでの作業方法

### 一般ユーザーと管理者ユーザー（root）の違い

+ 一般ユーザーでログインすると、プロンプトが `[hoge@centos7 ~]$` と末尾が「$」となる
+ 管理者ユーザーでログインすると、プロンプトが `[root@centos7 ~]#` と末尾が「#」となる

管理者権限が必要な時だけ、rootユーザーに切り替え作業を行う。
rootユーザーヘの切り替えは、 `su-` コマンドを実行する。(パスワードを聞かれるので rootユーザーのパスワードを入力すること)
※vagrantを使用している場合は、初期設定では vagrant が ID/PASS となっている
rootユーザーから一般ユーザーに戻る場合は、 `exit`　コマンドを入力する


##Linuxサーバーの設定変(CentOS 7)

###ネットワーク設定

+ サーバーとして使用する場合、IPアドレスを固定として割り当てる
+ IPアドレスを固定で割り当てる場合は、以下のファイルを、修正・追記する
+ ファイルの書き換えは、 rootユーザー権限が必要となる
+ `/etc/sysconfig/network-scripts/ifcfg-enp0s3`
+ 修正・追記内容  
　　`BOOTPROTO=none`  
  `IPADDR="●●●.●●.●.●●"`　　←　●の部分に IPアドレス  
  `GATEWAY="●●●.●●.●.●●"`　　←　●の部分に IPアドレス  
  `DNS1="●●●.●●.●.●●"`　　←　●の部分に IPアドレス


### SELinuxの状態確認と設定（有効・無効）

SELinuxはシステムのセキュリティを高める仕組み　→　サーバー公開時には有効にする必要あり  
Defaultでは有効。但し、開発環境で有効の場合、トラブル発生時の切り分けが難しいためPermissiveに設定が推奨  

+ SELinuxの設定状態の確認コマンド `getenforce`  
  `Enforcing`と表示　→　有効  
  `Permissive` or `Disabled` →　無効
+ SELinuxの設定コマンド（一時的）  
  `setenforce`　に引数を付ける 0 がPermissiveに設定、 1 がEnforcingに設定  
  `setenforce 1` `setenforce 0`  
  ファイルの書き換えは、 rootユーザー権限が必要となる
+ 恒久的に設定変更を行う場合は、設定ファイルを変更する  
  `/etc/sysconfig/selinux` の記述の以下のように変更  
  `SELINUX=disabled`

### サービス管理の起動・停止・設定

サービスは、OS本体から切り離し可能なサブシステム。ネットワークサービスはネットワーク接続機能を提供、
ファイアウォールサービスはネットワークのセキュリティを高める機能を提供。  
サービスは、`systemd`という機能によって管理を行っており、サービスを管理するには、`systemctl`コマンドを使用  
`systemctl`コマンドの実行には、rootユーザー権限が必要

#### 主なサービスのリスト

+ `sshd.service` = SSHサーバー
+ `httpd.service` = Apache WEBサーバー
+ `vsftpd.service` = vsftpd FTPサーバー
+ `crond.service` = 定期的な処理を実行する cron
+ `firewalld.service` = ファイアウォール
+ `rsyslog.service` = システムログサービス
+ `cups.service` = 印刷サービス
+ `postfix.service` = postfixのメールサーバー

#### 各サービスが自動的に起動するか、起動しないかの確認リスト

+ `systemctl list-unit-files`
+ `enable` = 自動的に起動　`disable` = 自動的に起動しない

#### ファイアウォール機能の起動・停止

多くの場合、サービスの設定を変更した場合は、再起動が必要となる

+ 起動する場合： `systemctl start firewalld.service`
+ 再起動する場合： `systemctl restart firewalld.service`
+ 停止する場合： `systemctl stop firewalld.service`


### FTPサーバーのインストールと設定

#### インストール(vsftpd = very secure ftpd)

+ rootユーザーの権限で以下のコマンドでインストール  
  `yum -y install vsftpd`
+ 正しくインストールが出来たかどうかの確認には、以下のコマンドを入力  
  `rpm -q vsftpd`  
  成功した場合は、vsftpd のバージョン番号が表示される

#### 設定

+ rootユーザーの権限で設定する必要あり
+ 設定ファイルは `/etc/vsftpd/vsftpd.conf`
+ 設定変更箇所  
　　●匿名FTP機能を無効化  
  `L12` `anoymous_enable=YES` →　`anoymous_enable=NO`  
  ●ASCIIモードでのUPLOADを有効化  
  `L82` `#ascii_upload_enable=YES` →　`ascii_upload_enable=YES`  
  ●ASCIIモードでのDOWNLOADを有効化  
  `L83` `#ascii_download_enable=YES` →　`ascii_download_enable=YES`  
  ●vsftpd　をスタンドアロンで起動できるようにする  
  `L114` `listen=NO` →　`listen=YES`  
  ●IPv4ソケットの代わりにIPv6ソケットをlistenする listenオプションと同時に有効化できないため、listenを有効化すると、こちらは無効化必要  
  `L123` `listen_ipv6=YES` →　`listen_ipv6=NO`

#### 起動と起動確認

+ ●vsftpd の起動  
  `systemctl start vsftpd.service`
+ ●vsftpd の起動確認  
  `systemctl is-active vsftpd.service`　→ `active` と表示されたら起動成功

#### 自動起動の設定

+ `systemctl enable vsftpd.service`


#### FTPコマンドラインでのアクセス

##### lftpコマンドのインストール

+ `yum -y install lftp`

##### vsftpd の動作確認（lftpコマンド）

+ `lftp [ユーザー名@]ホスト名 or IPアドレス`  
  例： `lftp test@localhost
+ パスワード部分には、`password` と入力（テストのため）  
+ プロンプト部分が `lftp ●●●●@localhost` となり、FTPコマンドが使用可能となる

##### FTPクライアントで FTPサーバー接続テスト

+ IPアドレスの確認  
  `ip addr show` で IPアドレスを確認することができる
