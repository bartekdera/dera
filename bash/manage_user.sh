#!/bin/bash



function loadUsers() {
    echo "loadUsers..."
}



function showUsers() {
    echo "showUsers..."
}



function addUsers() {
    echo "addUsers..."
}



function delUsers() {
    echo "delUsers..."
}



function acceptRemoteLogin() {
    echo "acceptRemoteLogin..."
}



function deniedRemoteLogin() {
    echo "deniedRemoteLogin..."
}


function quit() {
    exit 0 
}

function help() {
cat <<EndOfMessage
    Opis opcji skryptu:
    -------------------
    LU -> Ładowanie 
EndOfMessage
}


#menu
select option in LU SU AU DU ARL DRL HELP QUIT
do
    case ${option} in
	"LU") loadUsers ;;	"LU") LoadUsers ;;
	"LU") showUsers ;;	"LU") LoadUsers ;;
	"LU") addUsers ;;	"LU") LoadUsers ;;
	"LU") delUsers ;;	"LU") LoadUsers ;;
	"LU") acceptRemotedLogin ;;	"LU") LoadUsers ;;
	"LU") deniedRemotedLogin ;;	"LU") LoadUsers ;;
	"HELP") help ;;
	"quit") quit ;;
    *)help
    esac
done


