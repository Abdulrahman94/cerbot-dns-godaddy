# certbot-dns-godaddy
cerbot plugin for dns challenge with godaddy

## How to use
the script `certbot-dns-godaddy.sh` should be used with option `--manual-auth-hook`    
the script `certbot-dns-godaddy-clean.sh` should be used with option `--manual-cleanup-hook`

### Example
`certbot certonly --manual --manual-auth-hook certbot-dns-godaddy.sh --manual-cleanup-hook certonly-dns-godaddy-clean.sh -d example.com`

## Environment variables
`GODADDY_KEY`: godaddy user api key    
`GODADDY_SECRET`: godaddy user api secret    

both `CERTBOT_DOMAIN` and `CERTBOT_VALIDATION` are coming from cerbot command as mention in [official documentation](https://certbot.eff.org/docs/using.html#hooks)

## Note
because dns challenge used for wildcard, the domain should only be the top level part    
for example:    
- `example.com`
- `test.com`    

domain like this:
- `*.example.com`
- `www.example.com`
will make the script behave wrongly
