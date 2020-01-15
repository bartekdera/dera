#!/bin/bash


#zmiana globalna
#ładnowanie danych z pliku

user_list=(`cat users.txt`)



function ShowUsers() {
    echo "loadUsers..."u
    echo"Lista:"
    for(( i=0; i<=${#user_list[@]}; i++ ))
    do
	echo " ${user_list[i]}"
    done
}




function addUsers() {
    echo "addUsers..."
    echo -n "Are you sure? [y/n]"
    read sure 
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}"
    do
	    echo "Add user: ${user}"
	    sudo useradd ${user} -s /sbin/nologin -g "users"
        done
    fi
}



function delUsers() {
    echo "delUsers..."
    echo "Are you sure? [y/n]"
    read sure 
    if [ ${sure} == "y" ]; then
	for user in "${user_list[@]}"
	do
	    echo "Remove user ${user} [OK]"
	sudo userdel -r ${user}
	done


    fi
}



function acceptRemoteLogin() {
    echo "acceptRemoteLogin..."
}



function deniedRemoteLogin() {
    echo "deniedRemoteLogin..."
}


function help() {
cat <<EndOfMessage
    Opis opcji skryptu:
    -------------------
    LU - Ładowanie użytkowników z pliku
    SU - listowanie załadowanych użytkowników
EndOfMessage
}

function quit {
    exit 0
}


#menu
select option in SU AU DU ARL DRL HELP quit
do
    case ${option} in
	 "SU" ) showUsers ;;
	 "AU" ) addUsers ;;
	 "DU" ) delUsers ;;
	 "ARL" ) acceptRemotedLogin ;;
	 "DRL" ) deniedRemotedLogin ;;
	 "HELP" ) help ;;
	 "quit" ) quit ;;
    *)help
    esac
done


