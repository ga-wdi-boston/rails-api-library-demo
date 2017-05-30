curl --include --request POST http://localhost:4741/authors \
  --header "Content-Type: application/json" \
  --data '{
    "author": {
      "family_name": "Example Title",
      "given_name": "Example Author"
    }
  }'
