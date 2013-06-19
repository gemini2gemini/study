# MySQLメモ

## MAMPでインストールしたMySQLに直接接続する方法

    1. MAMPから、MySQLサーバーを起動

    2. MAMPのbinディレクトリに移動
    cd /Applications/MAMP/Library/bin

    3. MySQLに接続
    ./mysql -u root -p

    4. mysqlユーザーのパスワードを入力(変更していなければ、root)

## MAMPでインストールしたMySQLを切断する方法

    1. exit コマンドを入力
    exit

    2. MAMPから、MySQLサーバーを停止


## databaseを確認

    show databases;

## 使用するdatabaseを選択

    use ●●●●●[database name];

## tableを確認

    show tables;

## あるtableのカラムを確認

    show columns from ●●●[table name];
    describe ●●●[table name];

