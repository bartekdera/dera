#!/bin/bash

#funkcje, podprogramy

#procedura
function Moja() {
    echo "Procedura"
}

#wywołanie procedury

Moja

#zad1 wywołaj procedure 10 razy metodą interakcyjna (while)

function Moja_10 () {
    echo "Moja"
}
i=1
    while [ ${i} -le 10 ]; do
    Moja
    i=$[i+1]

done

#wyrażenia arytmetyczne
echo $((2+2))

echo $[2+2]

x=5
y=2

let suma=x+y
echo ${suma}

#operatory arytmetyczne
# + :dodawanie
# - :odejmowanie
# * :mnożenie
# / :dzielenie
# % : reszta z dzielenia

echo $[x%y]