# 5章 練習問題

## 1.

```$ find /home -name 'dog.png'```

## 2.

```$ grep -r /home -e 'confidential'```

- ```-e``` オプションを付けないとエラーになる

## 3.

```$ find /home -type f -exec grep -e 'confidential' -e 'secret' '{}' \; -exec cp '{}' . \;```

- 'secret' を含むファイルが結構ある

## 4.

```$ ssh 192.168.10.32 ls -R / > filelist.txt```

- 未テスト

## 5.

ファイル: [05_getlocal.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter05/05_getlocal.sh)

- 最後の行にデータを転送するためのコマンドを記述する

## 6.

未完

## 7.

### a.

ファイル: [07-a_hashsearch.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter05/07-a_hashsearch.sh)

- パラメータの先頭が "./" かどうかチェックする文を追加する

### b.

ファイル: [07-b_hashsearch.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter05/07-b_hashsearch.sh)

- パラメータの先頭が "../" かどうかチェックする文を追加する
- 余分なディレクトリ名の削除には ```$(cd ..; pwd)``` を用いる

## 8.

Git Bash が必要なため略

## 9.

Git Bash が必要なため略

## 10.

Git Bash が必要なため略
