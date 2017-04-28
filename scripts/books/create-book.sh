# curl --include --request POST http://localhost:4741/books \
#   --header "Content-Type: application/json" \
#   --data '{
#     "book": {
#       "title": "Example Title",
#       "author": "Example Author"
#     }
#   }'

curl --include --request POST http://localhost:4741/authors \
  --header "Content-Type: application/json" \
  --data '{
    "author": {
      "given_name": "Sam",
      "family_name": "SuperDuper"
    }
  }'
