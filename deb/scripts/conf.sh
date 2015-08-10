#! /bin/bash
# Template exemple de configuration

# Informations concernant les paquets à générer (debian|rhel)
PACKAGES_type="debian"
#PACKAGES_type="rhel"

# Informations du serveur cible ou sera installe le repo
REPO_name="super-repo"
REPO_server_user="edenath"
REPO_server_domain="packages"
REPO_apache="/etc/apache2"
REPO_www="/var/www"
REPO_passphrase="mysupersecretpassword"

# Informations utilisées pour générer le fichier distributions
REPO_infos="Origin: nmarsan
Label: superpaquet
Suite: testing
Codename: squeeze
Version: 1.0
Architectures: i386 amd64 source
Components: main non-free contrib
Description: repository superpaquet nmarsan
SignWith: yes

Origin: nmarsan
Label: superpaquet
Suite: stable
Codename: wheezy
Version: 1.0
Architectures: i386 amd64 source
Components: main non-free contrib
Description: repository superpaquet nmarsan
SignWith: yes"

# liste des paquets a integrer dans le repos
LIST_packages="superpaquet-site superpaquet-vhost" 

