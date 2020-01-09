!/bin/bash
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
    for user in "${user_list[@]}"
    do
	echo ${user}
    done
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
	 "SU") ShowUsers ;;
	 "AU") AddUsers ;;
	 "DU") DelUsers ;;
	 "ARL") AcceptRemotedLogin ;;
	 "DRL") DeniedRemotedLogin ;;
	 "HELP") help ;;
	 "quit") quit ;;
    *)help
    esac
done


