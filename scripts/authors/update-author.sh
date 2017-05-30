curl --include --request PATCH http://localhost:4741/authors/$ID \
  --header "Content-Type: application/json" \
  --data '{ 
	"author": {
		"family_name": "UPDATE"
	}
}'
