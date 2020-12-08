# 14章 練習問題

## 1.

## 2.

ファイル: [02_args.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter14/02_args.sh)

- 問題で用いられるのスクリプトを [args.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter14/args.sh) とした
- 問題のスクリプトを1行で表現した（難読化したかと言われると…）

## 3.

ファイル: [03_wrapper.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter14/03_wrapper.sh)

- OpenSSL で [args.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter14/args.sh) を暗号化した

  ```
  $ openssl aes-256-cbc -base64 -in args.sh -out args.enc -pass pass:args
  ```

- 実行時は 03_wrapper.sh に引数を与えればよい

  ```
  $ ./03_wrapper.sh aaa bbb ccc
  *** WARNING : deprecated key derivation used.
  Using -iter or -pbkdf2 would be better.
  aaa
  bbb
  ccc
  ```

## 4.
