# Metadata

## sh

```sh
# Récupérer les métadonnées de l’instance
curl http://169.254.169.254/latest/meta-data
curl http://169.254.169.254/latest/meta-data/public-ipv4

# Forcer l’utilisation des tokens pour l’IMDS
aws ec2 modify-instance-metadata-options \
  --instance-id i-09494c79e192f9d62 \
  --http-tokens required \
  --region ca-central-1

# Générer un token d’accès IMDS
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" \
  --silent)
```
