#! /bin/bash
#
# Description                   :	Charge les méthodes et les variables génériques
#
# Auteurs                       :	edena, mok
#
###########################################################################################

### VARIABLES
# BASE doit etre initialisee
if [ -z "${BASE}" ]
then
    echo "La variable BASE doit être initialisée"
    exit 1
fi

# Repertoire de travail : ces variables ne changeront jamais on peut les mettre dans common
#HOME2="/home/nmarsan/PACK/deb" home2 n'est plus utile car detecté automatiquement dans BASE
DIR_packages="$BASE/packages"
DIR_incomming="$BASE/repository/incoming"
DIR_repository="$BASE/repository"


### METHODES

# Sortie standard d'un message
print_trace() {
    echo "$(date +%y-%m-%dT%H:%M:%S)> $1"
}

# Sortie standard d'une erreur
print_error_and_exit() {
   script_name=`basename "$0"`
   print_trace " [ERREUR] Vérifier les messages suivants :"
   echo "$1"
   exit 1
}

# Vérifie si une commande est disponible
check_if_commands_exists() {
    for cmd in $1
    do
        command -v "${cmd}" >/dev/null 2>&1 || print_error_and_exit "La commande ${cmd} n'est pas disponible, il est nécessaire d'installer le paquet correspondant." 
    done
}

# Vérifie si les variables en paramètres sont vides
check_if_values_are_empty() {
    for param in $1
    do
        if [ -z "${!param}" ]
        then            
            print_error_and_exit "${param} n'est pas déclaré dans le fichier de configuration." 
        # debug
        #else
           # print_trace "${param} = ${!param}"
        fi
    done
}
