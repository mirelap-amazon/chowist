#!/bin/bash

for i in {1..20}
do
  curl -v -o /dev/null http://127.0.0.1:8000/places/restaurants/$i/
  curl -v -o /dev/null http://127.0.0.1:8000/
  curl -v -o /dev/null http://127.0.0.1:8000/places/
  curl -v -o /dev/null http://127.0.0.1:8000/accounts/login/
done
