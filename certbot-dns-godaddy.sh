#!/bin/bash
# certbot plugin script for manual-auth-hook
# the environment variable GODADDY_KEY and GODADDY_SECRET must have a value from the user
# the environment variable CERTBOT_VALIDATION and CERTBOT_DOMAIN are coming form certbot command as mention
# in https://certbot.eff.org/docs/using.html#hooks

POST_DATA="[{\"data\": \"$CERTBOT_VALIDATION\", \"name\": \"_acme-challenge.$CERTBOT_DOMAIN.\", \"port\": 1, \"priority\": 1, \"protocol\": \"string\", \"service\": \"string\", \"ttl\": 600, \"type\": \"TXT\", \"weight\": 1}]"

curl -X PATCH "https://api.godaddy.com/v1/domains/$CERTBOT_DOMAIN/records/" -H "Authorization: sso-key $GODADDY_KEY:$GODADDY_SECRET" -H "Content-Type: application/json" -H "Accept: application/json" -d "$POST_DATA"

sleep 35
