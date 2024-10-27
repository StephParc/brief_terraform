
# Structure du projet:

```  
.  
├── docs/  
|    ├── A_vous_de_jouer.md  
|    ├── index.md  
|    └── Projet.md  
├── VersionAvancee/  
|    └── modules/  
|        ├── nets/
|            ├── main.tf  
|            ├── outputs.tf  
|            └── variables.tf     
|        ├── resource_group/  
|            ├── main.tf  
|            ├── outputs.tf  
|            └── variables.tf  
|        ├── storage/  
|            ├── main.tf  
|            ├── outputs.tf  
|            └── variables.tf  
|        ├── vm/  
|            ├── main.tf  
|            ├── outputs.tf  
|            └──variables.tf  
|        └── web_app/  
|            ├── main.tf  
|            ├── outputs.tf  
|            └── variables.tf  
|    ├── main.tf  
|    ├── provider.tf  
|    ├── terraform.tfvars  
|    └── variables.tf  
.gitignore  
mkdocs.yml  


```

***

# Description:

## Les modules

Le projet est structuré avec des modules correspondant aux ressources à créer.  
Chaque module comprend 3 fichiers .tf :

- *main.tf* le corps de code. C'est ici que les ressources sont définies. De la manière suivante:  
```
resource "type de ressource" "nom de la ressource"{
    propriété = "paramètre"
    propriété = "paramètre"
    ...  
}
```  
On peut faire référence aux objets à l'intérieur du module ainsi: type_de_ressource.nom_de_la_ressource ou type_de_resource.nom_de_la_ressource.propriété.  
*Exemple:*  
```
resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location  
}
```  
On pourra appeler azurerm_resource_group.rg.name ailleurs dans le module.  
Pour faire y faire référence en dehors du module, il faut le déclarer en output.  

- *outputs.tf*. Le fichier outputs permet de centraliser les outputs du module.  De la manière suivante:  
```
output "nom par lequel l'objet sera appelé"{
    value = référence de l'objet
}
```  
*Exemple:*  
```
output "resource_group_name" {
    value = azurerm_resource_group.rg
}
```  

- *variables.tf*. Le fichier variables.tf permet de centraliser les variables du module. De la manière suivante:  
```
variable "nom par lequel la variable sera appelée dans le module" {
    description = "texte qui sera affiché pour renseigner la valeur"
    type        = le type de la variable
    default     = "la valeur par défaut"
}
```  
Si la valeur par défaut est renseignée, le prompt n'affiche pas la description.  
La variable est appelée dans le module à l'aide de *var.<nom de la variable\>*  
*Exemple:*  
```
variable "resource_group_name" {
    description = "Le nom du groupe de ressources"
    type        = string
    default     = "rg"
}
```

## Le fichier *main.tf* principal

C'est le corps du projet. Tous les modules sont appelés à cet endroit.  
De la manière suivante:    
```
module "nom du module"{  
    source      = "chemin du module"    
    propriété= "paramètre"   
    propriété= "paramètre"    
    ...    
}
```  
Toutes les propriétés de toutes les ressources du module doivent être reprises en utilisant les désignations des outputs.  
Les variables du *main.tf* principal proviennent du *variables.tf* principal. Ce qui signifie qu'il faut redéclarer toutes les variables des modules appelés dans ce fichier.  
Des désignations différentes auraient permis une meilleure compréhension d'un point de vue didactique mais j'ai préféré garder les désignations utilisées dans les modules.  
Il est à noter qu'il est possible de créer de nouvelles ressources dans ce *main*.  

## Le fichier *provider.tf*

Plusieurs possibilités s'offrent à nous pour appeler le provider.

* Au niveau de la racine du projet, le provider sera le même pour l'ensemble du projet. 
* A l'intérieur de chaque module, il sera ainsi possible d'avoir des providers différents selon les modules

## Le fichier *variables.tf* principal

Ce fichier permet de centraliser toutes les variables appelées dans le *main.tf* principal.

## Le fichier *terraform.tfvars*

Ce fichier est ignoré par git. Il est donc intéressant d'y mettre toutes les valeurs des variables sensibles. Il permet également de les centraliser et d'avoir un seul endroit pour les modifier.Les noms sont les désignations du fichier *variables.tf* principal.  
Le fichier *terraform_tfvars_fake* ne sert qu'à montrer à quoi ressemble le fichier *terraform.tfvars*.  
Pour résumer:

- Si la variable est dans *terraform.tfvars*, c'est cette valeur qui est prise. Sinon, c'est la valeur par défaut de *variables.tf* principal.
- S'il n'y a pas de valeur par défaut dans *variables.tf* principal, c'est la valeur par défaut de *variables.tf* du module qui est prise.
- S'il n'y a pas de valeur par défaut dans *variables.tf* du module, le prompt affichera la description de la variable pour en saisir la valeur. 