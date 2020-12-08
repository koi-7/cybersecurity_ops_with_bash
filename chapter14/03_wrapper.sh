#!/usr/bin/env bash


encrypted='U2FsdGVkX1+O4SVj4VmiEKcOtjf2qJCV5WUMAvy9NxnoHtn6k7iEd9PdpDoMcmi/mEm7dvii6+ACySrs00+BbK4OQDnEl6Z+oKQySinnzxs='

read -s word

innerScript=$(echo "$encrypted" | openssl aes-256-cbc -base64 -d -pass pass:"$word")

eval "$innerScript"
