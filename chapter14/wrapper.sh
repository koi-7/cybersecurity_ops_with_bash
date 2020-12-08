#!/usr/bin/env bash


encrypted='U2FsdGVkX19QL7neT23U80THFRChVlwkZwxJNJihcC7zJOlEzNcFKre9HgVv2ZRYXqoWV+5+8BxACYZ7awyfs92AT2pmdxDBppdSdW+FkJjFYPINKJr24Si1s++OZzRy'

read -s word

innerScript=$(echo "$encrypted" | openssl aes-256-cbc -base64 -d -pass pass:"$word")

eval "$innerScript"
