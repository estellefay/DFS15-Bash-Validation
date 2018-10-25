                #----------------------#
                #-----INteraction------#
                #----------------------#

rouge="\033[1;31m"
close="\033[0m"
bleu="\033[0;34m"


                #----------------------#
                #-----Fonction---------#
                #----------------------#
menu()
{
    echo -e "$rouge Bienvenue dans la gestion de vos vagrant, voulez-vous commencer ?$close"
    read -p "Confirm (y/n)?" choice
    case "$choice" in 
    y|Y ) echo "yes"; menu2; break;;
    n|N ) echo "good bye";;
    * ) menu;;
    esac
}

menu2()
{
    echo -e "$rouge Choisissez les différente options$close"
    select choixBox in "Afficher List" "Eteindre Box" "Alumer box" "List status" "Exit"
        do
        case $choixBox in
            "Afficher List" ) displayList;; 
            "Eteindre Box" ) eteindreBox;;
            "Alumer box" ) alumeBox;;
            "List status" ) statusVM;;
            "Exit" ) echo "good bye";;


            * ) choixBox; break;;
            
        esac
        done

}

displayList()
{
    echo -e "$rouge List de vos Vagrant$close"
    vagrant box list 
    echo
    menu2;
}


eteindreBox() 
{
    echo -e "$rouge Choisissez la box à eteindre parmis la liste$close"
    vagrant global-status
    read boxhalt
    vagrant halt $boxhalt
    echo -e "La Box $rouge $boxhalt$close est eteinte"
    menu2;
}

alumeBox() 
{
    echo -e "$rouge Choisissez la box à allumer parmis la liste$close"
    vagrant global-status
    read boxAlum
    vagrant up $boxAlum
    echo -e " La Box $rouge $boxAlum$close est alumé"
    menu2;
}

statusVM()
{
     echo -e "$rouge Status vos Vagrant$close"
     vagrant global-status
     menu2;

}


menu;
