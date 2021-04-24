#!/bin/bash
# certbot plugin script for manual-cleanup-hook
# the environment variable GODADDY_KEY and GODADDY_SECRET must have a value from the user
# the environment variable CERTBOT_DOMAIN are coming form certbot command as mention
# in https://certbot.eff.org/docs/using.html#hooks

curl -X DELETE "https://api.godaddy.com/v1/domains/$CERTBOT_DOMAIN/records/TXT/_acme-challenge/" -H "Authorization: sso-key $GODADDY_KEY:$GODADDY_SECRET" -H "Content-Type: application/json" -H "Accept: application/json" 
