curl --include --request PATCH http://localhost:4741/loans/$ID \
  --header "Content-Type: application/json" \
  --data '{
  	"loan": {
  		"borrower_id": "7"
  	}
  }'
