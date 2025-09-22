#!/bin/bash
# Skript küsib kasutajalt kataloogi nime ja teeb sellest backup-i, 
# salvestades faili nimega katalooginimi.backup.tar.gz kataloogi ./backup.

echo -n "Sisesta kataloogi nimi, mida soovid varundada: "
read kataloog

# Kontrollime, kas kataloog eksisteerib
if [ ! -d "$kataloog" ]; then
    echo "Kataloogi '$kataloog' ei leitud. Palun proovi uuesti."
    exit 1
fi

# Loo backup kataloog, kui seda veel ei ole
mkdir -p backup

# Võtame kataloogi nime viimase osa failinime jaoks
backupfail=$(basename "$kataloog").backup.tar.gz

echo "Varundame kataloogi: $kataloog"
echo "Backup fail pannakse kataloogi: ./backup/$backupfail"

# Teeme backupi
tar -czf backup/"$backupfail" "$kataloog"

# Kontrollime, kas backup on edukalt loodud
if [ -f backup/"$backupfail" ]; then
    echo "Varukoopia edukalt loodud: backup/$backupfail"
else
    echo "Varukoopia loomine ebaõnnestus."
fi
