#!/bin/bash


#zmiana globalna
#ładnowanie danych z pliku

user_list=(`cat users.txt`)
status="FAIL"
RED=


function checkStatusCode () {
    if [ $? == 0 ]; then
	status="PASS"
    else
	status="fail"
    fi
}



function showUsers() {
    echo "loadUsers..."u
    echo "Lista: "
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
	    sudo useradd ${user} -m -s /sbin/nologin -g "users" 2> /dev/null
	    checkStatusCode
	    echo "add user:  ${user} [${status}]"
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
	    sudo userdel -r ${user} 2> /dev/null
	    checkStatusCode
	    echo "Remove user ${user} [${status}]"
	done
    fi
}





function acceptRemoteLogin() {
    echo "acceptRemoteLogin..."
	for user in "${user_list[@]}"
	do
	    sudo usermod -s /bin/bash ${user} 2> /dev/null
	    checkStatusCode
	    echo "Denied remote login for ${user} [${status}]"
    done
}



function deniedRemoteLogin() {
    echo "deniedRemoteLogin..."
    for user in "${user_list[@]}"
    do
	    sudo usermod -s /sbin/nologin ${user}
	    checkStatusCode
	    echo "Denied remote login for ${user} [${status}]"
    done
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


