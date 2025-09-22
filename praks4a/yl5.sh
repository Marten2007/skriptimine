#!/bin/bash
# Skript küsib kasutajalt kataloogi nime ja teeb sellest backup-i, 
# lisades faili nimele jooksva kuupäeva kujul päevkuuuaasta (nt 18sept2025).
# Backup fail salvestatakse kataloogi ./backup.

echo -n "Sisesta kataloogi nimi, mida soovid varundada: "
read kataloog

# Kontrollime, kas kataloog eksisteerib
if [ ! -d "$kataloog" ]; then
    echo "Kataloogi '$kataloog' ei leitud. Palun proovi uuesti."
    exit 1
fi

# Loo backup kataloog, kui seda veel ei ole
mkdir -p backup

# Võta kataloogi nimi (basename)
katalooginimi=$(basename "$kataloog")

# Võta jooksva kuupäeva formaadis päevkuuuaasta (näiteks 18sept2025)
kuupaev=$(date +"%d%b%Y" | tr '[:upper:]' '[:lower:]')

# Koosta backup failinimi
backupfail="${katalooginimi}.backup.${kuupaev}.tar.gz"

echo "Varundame kataloogi: $kataloog"
echo "Backup fail pannakse kataloogi: ./backup/$backupfail"

# Tee varukoopia
tar -czf backup/"$backupfail" "$kataloog"

# Kontrollime, kas backup on edukalt loodud
if [ -f backup/"$backupfail" ]; then
    echo "Varukoopia edukalt loodud: backup/$backupfail"
else
    echo "Varukoopia loomine ebaõnnestus."
fi
