curl --include --request POST http://localhost:4741/borrowers \
  --header "Content-Type: application/json" \
  --data '{
    "borrower": {
      "family_name": "Payne",
      "given_name": "Chris"
    }
  }'

curl --include --request POST http://localhost:4741/borrowers \
  --header "Content-Type: application/json" \
  --data '{
    "borrower": {
      "family_name": "Rogers",
      "given_name": "Mister"
    }
  }'
