#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/authors/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "author": {
      "given_name": "'"${GIVEN_NAME}"'"
    }
  }'
  # \
  # --header "Authorization: Token token=$TOKEN"

echo
