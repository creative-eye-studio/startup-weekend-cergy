# Startup Weekend Impact - Cergy

Bienvenue dans le référentiel du site Startup Weekend Impact. Ce projet est conçu pour présenter l'évènement.


## Prérequis

Assurez-vous d'avoir installé les éléments suivants avant de commencer :

- [Symfony](https://symfony.com/download)
- [PHP](https://www.php.net/)
- [Composer](https://getcomposer.org/)
- [Base de données (MySQL)](https://www.symfony.com/doc/current/doctrine.html#installing-doctrine)


## Installation

1. Clonez ce dépôt sur votre machine locale en utilisant la commande suivante :
    git clone https://github.com/creative-eye-studio/startup-weekend-cergy.git startup-weekend-cergy

2. Accédez au répertoire du projet
    cd startup-weekend-cergy

3. Installez les dépendances
    composer install --no-dev
    yarn install
    npm install

4. Configurez le CSS et le JS
    yarn encore prod

5. Configurez l'accès à la base de données dans le fichier .env
    DATABASE_URL="mysql://username:password@server:port/database?serverVersion=5.7&charset=utf8mb4"
    symfony console doctrine:database:create
    symfony console doctrine:migrations:migrate

6. Lancez le serveur de développement Symfony
    symfony server:start


## Licence
Ce projet a été développé avec le CMS Dream Site de Creative Eye Studio
En cas de difficultés, n'hésitez pas à nous faire part de vos demandes à creative.eye.fr@gmail.com
