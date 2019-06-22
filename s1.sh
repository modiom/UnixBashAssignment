#!/bin/bash
while IFS="," read -r f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10
do
    current=$(date +%Y%m)
    rec=${f7:3}${f7:0:2}
    path="Dir/"$f1"/"$f2
    mkdir -p "$path"
    if [ "$rec" -gt "$current" ];
        then
            path=$path"/"$f3".active.txt"
    else
        path=$path"/"$f3".expired.txt"
    fi           
    
    echo "Card Type Code: $f0" > "$path"
    echo "Card Type Full Name: $f1" >> "$path"
    echo "Issuing Bank: $f2" >> "$path"
    echo "Card Number: $f3" >> "$path"
    echo "Card Holder's Name: $f4" >> "$path"
    echo "CVV/CVV2: $f5" >> "$path"
    echo "Issue Date: $f6" >> "$path"
    echo "Expiry Date: $f7" >> "$path"
    echo "Billing Date: $f8" >> "$path"
    echo "Card PIN: $f9" >> "$path"
    echo "$f10" | awk '{ printf("Credit Limit: $%'"'"'d USD\n",$1); }' >> "$path"
    
    
done < <(tail -n +2 "100CCRecords.csv")