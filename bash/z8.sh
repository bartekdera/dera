#!/bin/bash


#definicja funkcji f1

function f1() {
echo -n "Podaj nazwe użytkownika"

function f1() {
echo -n "Podaj nazwe użytkownika"

function f1() {
echo -n "Podaj nazwe użytkownika"



#menu skryptu
select opcja in f1 f2 f3  Quit
do
    case ${opcja} in
	"f1") echo "f1" ;;
	"f2") echo "f2" ;;
	"f3") echo "f3" ;;
	"Quit") echo exit 0 ;;
	*) echo "Podaj opcje z menu"
    esac
done
