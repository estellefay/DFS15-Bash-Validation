                #----------------------#
                #-----INteraction------#
                #----------------------#

rouge="\033[1;31m"
close="\033[0m"
bleu="\033[0;34m"


                #----------------------#
                #-----Fonction---------#
                #----------------------#

                
displayList()
{
    echo -e "$rouge List de vos Vagrant$close"
    vagrant glolist   
}

eteindreBox() 
{
    vagrant halt
    echo -e "$rouge Box eteinte$close"
}

alumeBox() 
{
    vagrant up
    echo -e "$rouge Box alumé$close"
}

statusVM()
{
     echo -e "$rouge Status vos Vagrant$close"
     vagrant global-status
}

