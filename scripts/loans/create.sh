#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/loans"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "loan": {
      "book_id": "'"${BOOK}"'",
      "borrower_id": "'"${BORROWER}"'",
      "due_on": "2020-02-14"
    }
  }'
  # \
  # --header "Authorization: Token token=$TOKEN"

echo
