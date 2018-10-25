choixBox=
choixLocal=
choixSync=
rouge="\033[1;31m"
close="\033[0m"
bleu="\033[0;34m"
vagrant=

                                #------------------#
                                #-----Function-----#
                                #------------------#
                               

# choixBox()
# {
#     echo "Quel type de box voulez-vous"
#       select choixBox in "ubuntu/xenial64" "bis ubuntu/xenial64" 
# do
# case $choixBox in
# 	"ubuntu/xenial64" ) choixBox=ubuntu/xenial64; break;; 
# 	"bis ubuntu/xenial64" ) choixBox=ubuntu/xenial64;  break;;
#     * ) choixBox; break;;
    
# esac
# done
# }

choixLocal()
{
    echo
    echo "quel est le nom du dossier local que vous voulez créer ? "
    read choixLocal
    echo -e "$bleu Le nom du dossier local est $rouge $choixLocal$close$close"
}

choixSync()
{
    echo
    echo "quel est le nom du dossier sync que vous voulez créer ? "
    read choixSync
    echo -e "$bleu Le nom du dossier sync est $rouge $choixSync$close$close"
}

confirm()
{
    echo
    sleep 1
    echo -"Récapitulatif"
    sleep 1
    echo -e  "$bleu la box choisie est $rouge ubuntu/xenial64$close$close"
    echo -e  "$bleu la nom de dossier local choisie est $rouge $choixLocal$close$close"
    echo -e  "$bleu la nom de dossier sync choisie est $rouge $choixSync$close$close"
    read -p "Confirm (y/n)?" choice
    case "$choice" in 
    y|Y ) echo "yes"; yes;;
    n|N ) echo "no"; no;;
    * ) confirm;;
    esac
}

no()
{
    echo
    echo "Nous allons recomencer la saisie"
    createVagrant;

}

yes() 
{
    echo
    rm Vagrantfile
    vagrant init
    sudo sed -i 's|config.vm.box = "base"|config.vm.box = "ubuntu/xenial64"|g' Vagrantfile
    sudo sed -i 's|# config.vm.network "private_network", ip: "192.168.33.10"|config.vm.network "private_network", ip: "192.168.33.10"|g' Vagrantfile
    sudo sed -i 's|# config.vm.synced_folder "../data", "/vagrant_data"|config.vm.synced_folder "./'$choixLocal'", "/var/www/'$choixSync'"|g' Vagrantfile
    echo "youpi"
    mkdir $choixLocal
    vagrant up 
}

isinstall()
{
    echo "coucou"
    # vagrant version
    # if [$vagrant != null] 
    # then
    echo "good"
    # fi
}

createVagrant()
{
    echo -e "$rouge Bienvenue dans la creation d'une vagrant$close"
    isinstall;
    # choixBox;
    choixLocal;
    choixSync;
    confirm;
}

                #------------------#
                #-----Program------#
                #------------------#
createVagrant;
