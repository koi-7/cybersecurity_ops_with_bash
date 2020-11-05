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

## 6.

## 7.

## 8.

## 9.

## 10.
