# 7章 練習問題

## 1.

```$ awk '{print $1 " " $10}' access.log | bash summer.sh | sort -k 2.1 -rn```

- 両方のやり方で同じ結果が得られた
  - （わざわざ問題文に書いてあるくらいなので何か違いがあるのかもしれない）

```
$ cut -d' ' -f1,10 access.log | bash summer.sh | sort -k 2.1 -rn
192.168.0.36     4371198
192.168.0.14     2876088
192.168.0.37     2575030
192.168.0.11     2537662
192.168.0.26      665693
```

```
$ awk '{print $1 " " $10}' access.log | bash summer.sh | sort -k 2.1 -rn
192.168.0.36     4371198
192.168.0.14     2876088
192.168.0.37     2575030
192.168.0.11     2537662
192.168.0.26      665693
```

## 2.

ファイル: [02_histogram.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter07/02_histogram.sh)

- pr_bar 関数に ```printf ' %d' "$raw"``` を挿入する

```
$ cut -d' ' -f1,10 access.log | bash summer.sh | bash 02_histogram.sh
192.168.0.14          ################################ 2876088
192.168.0.11          ############################# 2537662
192.168.0.37          ############################# 2575030
192.168.0.36          ################################################## 4371198
192.168.0.26          ####### 665693
```

## 3.

ファイル: [03_histogram.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter07/03_histogram.sh)

- getopts を使ってオプションを追加する

デフォルト

```
$ cut -d' ' -f1,10 access.log | bash summer.sh | bash 03_histogram.sh
192.168.0.14          ################################
192.168.0.11          #############################
192.168.0.37          #############################
192.168.0.36          ##################################################
192.168.0.26          #######
```

オプション付き

```
cut -d' ' -f1,10 access.log | bash summer.sh | bash 03_histogram.sh -s 25
192.168.0.14          ################
192.168.0.11          ##############
192.168.0.37          ##############
192.168.0.36          #########################
192.168.0.26          ###
```

## 4.

### a.

ファイル: [04-a_histogram.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter07/04-a_histogram.sh)

- 引数の数で場合分けを行う

### b.

ファイル: [04-b_histogram.sh](https://github.com/koi-7/cybersecurity_ops_with_bash/blob/master/chapter07/04-b_histogram.sh)

- getopts を使ってオプションを追加し、適当な変数にファイル名を代入し、後の awk にそのファイル名を渡す

## 5.

未完
