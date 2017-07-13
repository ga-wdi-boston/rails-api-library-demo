curl --include --request PATCH http://localhost:4741/borrowers/$ID \
  --header "Content-Type: application/json" \
  --data '{
  	"borrower": {
  		"given_name": "Fred"
  	}
  }'
