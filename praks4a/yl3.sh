#!/bin/bash
# Skript teeb kataloogi ./test varukoopia, pakkides selle tar.gz faili ja paigutades selle ./backup kataloogi.

# Loo kataloogid ja failid
mkdir -p test
mkdir -p backup

# Loo failid test kataloogi, need ei tohi olla tühjad
echo "See on fail 1" > test/fail1.txt
echo "See on fail 2" > test/fail2.txt
echo "See on fail 3" > test/fail3.txt
echo "See on fail 4" > test/fail4.txt

# Loo 2 mitte-tühja kataloogi koos failidega
mkdir -p test/kataloog1
echo "Fail kataloog1 sees" > test/kataloog1/fail_in_kataloog1.txt

mkdir -p test/kataloog2
echo "Fail kataloog2 sees" > test/kataloog2/fail_in_kataloog2.txt

# Selgitav väljund enne pakkimist
echo "Varundame kataloogi ./test"
echo "Backup fail pannakse kataloogi ./backup"

# Tee varukoopia (pakime ja tihendame)
tar -czf backup/test.backup.tar.gz test

# Kontrollime, kas fail on loodud
if [ -f backup/test.backup.tar.gz ]; then
    echo "Varukoopia edukalt loodud: backup/test.backup.tar.gz"
else
    echo "Varukoopia loomine ebaõnnestus."
fi
