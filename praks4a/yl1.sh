#!/bin/bash
# Skript küsib kasutaja nime ja sünniaastat ning arvutab kasutaja vanuse.

echo -n "Sisesta oma nimi: "
read nimi

echo "Tere tulemast, $nimi!"

echo -n "Sisesta oma sünniaasta: "
read synniaasta

# Arvutame vanuse (eeldusega, et käesolev aasta on 2019, kuna näites on 20 aastat kui sünniaasta 1999)
# Tegelikult arvutame praeguse aasta põhjal

# Võtame praeguse aasta
current_year=$(date +%Y)

vanus=$((current_year - synniaasta))

echo "$nimi, sina oled $vanus aasta vana."
