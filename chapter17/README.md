# 17章 練習問題

## 1.

- useradd コマンドでユーザを作成し、passwd コマンドでパスワードを設定する

```
$ sudo useradd -m mwilson
$ sudo passwd mwilson  # この後にパスワード magic を入力
```

## 2.

- groupadd コマンドを用いる

```
$ sudo groupadd marketing
```

## 3.

chown コマンドでグループを変更し、chmod コマンドでパーミッションを付与する

```
$ sudo chown :marketing poster.jpg
$ sudo chmod g=rw poster.jpg
```

## 4.

net コマンドを用いる

```
$ net user frogers //add         # ユーザの作成
$ net user frogers neighborhood  # パスワードの設定
```

## 5.

icasls コマンドを用いる

```
$ icacls lyrics.txt //grant tjones:f
```

## 6.
