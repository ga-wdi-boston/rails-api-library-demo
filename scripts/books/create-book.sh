curl --include --request POST http://localhost:4741/books \
  --header "Content-Type: application/json" \
  --data '{
    "book": {
      "title": "Example Title",
      "author": "Example Author"
    }
  }'


  curl --include --request POST http://localhost:4741/authors \
    --header "Content-Type: application/json" \
    --data '{
      "authors": {
        "given_name": "Patrick",
        "family_name": "Butcher"
      }
    }'
