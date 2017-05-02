curl --include --request PATCH http://localhost:4741/loans/1 \
  --header "Content-Type: application/json" \
  --data '{
	"loan": {
		"borrower_id": "2"
	}
}'
