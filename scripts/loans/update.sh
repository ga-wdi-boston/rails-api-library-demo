#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/loans/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "loan": {
      "due_on": "'"${DUE}"'"
    }
  }'
  # \
  # --header "Authorization: Token token=$TOKEN"

echo
