curl -v https://login.salesforce.com/services/oauth2/token -d "grant_type=password" -d "client_id=<client_id>" -d "client_secret=<client_secret>" -d "username=<user_id>" -d "password=<pwd>" -H "X-PrettyPrint:1"

curl https://yourInstance.my.salesforce.com/services/apexrest/Cases/<Record_ID> -H "Authorization: Bearer <your_session_id>" -H "X-PrettyPrint:1"