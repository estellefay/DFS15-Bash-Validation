choixBox=
choixLocal=
choixSync=
rouge="\033[1;31m"
close="\033[0m"
bleu="\033[0;34m"


                                #------------------#
                                #-----Function-----#
                                #------------------#
                               

# vagrant > dev/null



choixLocal()
{
    echo
    echo "----------Quel est le nom du dossier local que vous voulez créer ?---------- "
    read choixLocal
    echo -e "$bleu Le nom du dossier local est $rouge $choixLocal$close$close"
}

choixSync()
{
    echo
    echo "----------Quel est le nom du dossier sync que vous voulez créer ?----------"
    read choixSync
    echo -e "$bleu Le nom du dossier sync est $rouge $choixSync$close$close"
}

confirm()
{
    echo
    sleep 1
    echo -"Récapitulatif"
    sleep 1
    echo -e  "$bleu La box choisie est $rouge ubuntu/xenial64$close$close"
    echo -e  "$bleu Le nom de dossier local choisie est $rouge $choixLocal$close$close"
    echo -e  "$bleu Le nom de dossier sync choisie est $rouge $choixSync$close$close"
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
    echo "Nous allons recommencer la saisie"
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
    mkdir $choixLocal
    vagrant up 
    break;
}

verifVagrant()
{
    if [ vagrant > /dev/null ] 
    then
    echo -e "$rouge Vagrant is instaled$close"
    else 
    echo -e "$rouge Merci d'installer Vagrant $close"
    break;
    fi
}
verifVirtualBox()
{
    if [ virtualbox > /dev/null ] 
    then
    echo -e "$rouge VirtualBox is instaled$close"
        else 
    echo -e "$rouge Merci d'installer VirtualBox $close"
    break;
    fi
}

verif() 
{
    sleep 1
    echo -e "$bleu Nous allons vérifier si VIrtualBox et Vagrant sont installe$close"
    sleep 2
    verifVagrant;
    sleep 1
    verifVirtualBox;
}
createVagrant()
{
    echo -e "$rouge Bienvenue dans la creation d'une vagrant$close"
    verif;
    choixLocal;
    choixSync;
    confirm;
}

                #------------------#
                #-----Program------#
                #------------------#
createVagrant;
