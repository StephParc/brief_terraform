
# Prérequis

* Installer Terraform en téléchargeant la version adéquate à l'adresse suivante:
[https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)
Il est possible qu'il faille ajouter Terraform dans les variables d'environnement

* Disposer d'un compte Azure

* Installer Azure CLI

* Disposer d'une bonne voire très bonne connexion internet. Si par manque de débit le déploiement est trop long, il peut échouer avec un message comme quoi l'hôte a fermé la connexion.


# Exécution

Faire un git clone du projet.  
Compléter le fichier terraform_tfvars_fake avec vos propres données (attention aux caractères acceptés, différents selon les ressources). Le renommer en terraform.tfvars.  
Se placer au niveau de la racine du projet (même niveau que provider.tf ou que le main.tf principal) et exécuter dans un bash les commandes suivantes:

* az login  
Il se peut que vous rencontriez des difficultés à cette étape. Il faut suivre les recommandations et recommencer avec les nouvelles commandes proposées.

Viennent ensuite les commandes Terraform à suivre dans l'ordre. La commande destroy étant, comme son nom l'indique, pour supprimer les ressources quand vous n'en avez plus besoin.

* terraform init

* terraform plan -var-file="terraform.tfvars"

* terraform apply -var-file="terraform.tfvars"

A chaque étape, suivre les indications et corriger les erreurs

* terraform destroy


