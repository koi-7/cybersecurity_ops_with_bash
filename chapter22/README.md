# 22章 練習問題

## 1.

ファイル: [01_checkpass.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter22/01_checkpass.sh)

- ハッシュを生成する際は echo コマンドに -n オプションを付ける

```
$ echo -n "password" | sha1sum
5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8  -
$ ./01_checkpass.sh 5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8
Password is Pwned 3861493 Times!
```

## 2.

ファイル: [02_checkpass.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter22/02_checkpass.sh)

- [emailbatch.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter22/emailbatch.sh) を書き換える
- ファイルからハッシュ値を読み取り、[01_checkpass.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter22/01_checkpass.sh) に渡す

## 3.

API が現在使用不能のため略
