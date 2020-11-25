# 6章 練習問題

## 1.

- cut コマンドの -f オプションで複数列を指定したい場合は数字をカンマで区切る

```
$ cut -d';' -f1,2,5 tasks.txt
Image Name;PID;Mem Usage
System Idle Process;0;4 K
System;4;2,140 K
smss.exe;340;1,060 K
csrss.exe;528;4,756 K
```

## 2.

- -t オプションの後のセミコロンは '' で囲む

```
$ join -1 2 -2 2 -t';' tasks.txt procowner.txt
PID;Image Name;Session Name;Session#;Mem Usage;Process Owner;
0;System Idle Process;Services;0;4 K;jdoe
4;System;Services;0;2,140 K;tjones
340;smss.exe;Services;0;1,060 K;jsmith
528;csrss.exe;Services;0;4,756 K;msmith
```

## 3.

- タブ文字は \t で表現する

```
$ tr ';' '\t' < tasks.txt
Image Name      PID     Session Name    Session#        Mem Usage
System Idle Process     0       Services        0       4 K
System  4       Services        0       2,140 K
smss.exe        340     Services        0       1,060 K
csrss.exe       528     Services        0       4,756 K
```


## 4.

- grep の OR 検索では -e オプションを2回使う

```
$ grep -o -e '"firstName": ".*"' -e '"lastName": ".*"' book.json | cut -d " " -f2 | tr -d '"'
Paul
Troncone
Carl
ALbing
```
