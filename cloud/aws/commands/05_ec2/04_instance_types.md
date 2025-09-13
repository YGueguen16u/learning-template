# Instance types

## sh

1. Variables d’environnement AWS
```sh
# Définir vos identifiants AWS (évitez de les mettre en clair dans les fichiers !)
export AWS_ACCESS_KEY_ID="AKIA6JOU7AYXZ5YYI2WH"
export AWS_SECRET_ACCESS_KEY="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"
export AWS_DEFAULT_REGION="ca-central-1"

# Alternative (utile dans certains environnements type Gitpod) :
gp env AWS_ACCESS_KEY_ID="AKIA6JOU7AYXZ5YYI2WH"
gp env AWS_SECRET_ACCESS_KEY="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"
gp env AWS_DEFAULT_REGION="ca-central-1"
```

⚠️ Bonne pratique : utilisez plutôt AWS CLI aws configure
 pour stocker vos clés dans ~/.aws/credentials, plus sûr que les exporter en clair.

2. Connexion à une instance via EC2 Instance Connect

```sh
# Envoyer une clé publique temporaire à l’instance
aws ec2-instance-connect send-ssh-public-key \
  --instance-id i-033ee47a499a786a0 \
  --instance-os-user ec2-user \
  --availability-zone ca-central-1a \
  --ssh-public-key file://ec2connect.pub

# Se connecter à l’instance
ssh -i ec2connect ec2-user@3.99.178.17
```