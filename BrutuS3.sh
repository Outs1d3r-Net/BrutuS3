#!/bin/bash

list="$1"

if [[ "$list" == "" ]] ;then
    clear;
    printf "
\033[1;31mMMMMMMMWWN:......:NWWMMMMMMMMM
MMMMMMWd::,'''''''''dWMMMMMMMM
MMMMX0l''''',',,,''''l0XWMMMMM
MMMNl.',,,,,,,,,',,,,..lNWMWMM
MWXl''',,,,,,,,,,,,,,,''lXMMMM
MWx.',,'',,,,,,,,,',,,''.dNMMM
MXc',,,,'',,,',,,,:c,,,,',xWMM
Kc',',,l0k:'',,,':OKc,,,,.'KMM
k.',,'cKWWO:,,,':OWW0c,,,'.dNM
k.,,,,:0WWNk:,,:OWWW0:,,,,.:kW
,',,,,,:OWWWO::0WWWO:,,,,''.cN
.,,,,,,,:0WWWXXWWWO:,,,,,',.cN
.'',,,,,,:OWMMMWWO:,,,,,,,'.:d
.,,,,,',,,:KMMMM0:,,,,,,,,,.:l
.'',,,,,,,:XMMMMK:,,,,,,,,,.:l
.,,,,,,',cKWMMMWWKc,,,,,,,,.:l
.,,,,,,'cKWWN00WWW0:,,,,,,,.:l
:'',,,,c0WWWk,:ONWW0c,,,,'''cl
x.,,,,c0WWNk:,,:kWWW0c,,,'.:ll
k.,,,,cKWWk:,,,,:kWW0c,,,,.:lk
Xl.',,'c0x:,,,,',:x0:,,,'.,coN
MXl.,,,'::,,,,,',,::,,,'.,cloN
MWx.'',,,,,,,',,',,,,,,'.:ll0W
MWNd,'',,,,,,,,,,,,,,''':llKWM
MMMWd..',,,,,,,,,,,,,'.:lloXMM
MMMMWO:''''',,,,,'''':clldKWMM
WMMMMW0c'.'''''''...:lloxXMWMM
MMMMMMMW0o,'''''',lllldKMMMMMM
MMMMMMMMMKOOolllllldOOXMMMMMMM
MMMMMMMMMMMMdllllllkMMMMMMMMMM
\033[0mBy: Outs1d3r-Net\n\n"

    echo -e "The Brute force for public AWS S3 discovery !\n\n\n[+] Usage: $0 wordlist.txt\n\n"

exit 0
fi


clear;

#BANNER
printf "
[*] BRUTUS3 START...[*]\n
\033[1;31m
MMMMMMMWWN:......:NWWMMMMMMMMM
MMMMMMWd::,'''''''''dWMMMMMMMM
MMMMX0l''''',',,,''''l0XWMMMMM
MMMNl.',,,,,,,,,',,,,..lNWMWMM
MWXl''',,,,,,,,,,,,,,,''lXMMMM
MWx.',,'',,,,,,,,,',,,''.dNMMM
MXc',,,,'',,,',,,,:c,,,,',xWMM
Kc',',,l0k:'',,,':OKc,,,,.'KMM
k.',,'cKWWO:,,,':OWW0c,,,'.dNM
k.,,,,:0WWNk:,,:OWWW0:,,,,.:kW
,',,,,,:OWWWO::0WWWO:,,,,''.cN
.,,,,,,,:0WWWXXWWWO:,,,,,',.cN
.'',,,,,,:OWMMMWWO:,,,,,,,'.:d
.,,,,,',,,:KMMMM0:,,,,,,,,,.:l
.'',,,,,,,:XMMMMK:,,,,,,,,,.:l
.,,,,,,',cKWMMMWWKc,,,,,,,,.:l
.,,,,,,'cKWWN00WWW0:,,,,,,,.:l
:'',,,,c0WWWk,:ONWW0c,,,,'''cl
x.,,,,c0WWNk:,,:kWWW0c,,,'.:ll
k.,,,,cKWWk:,,,,:kWW0c,,,,.:lk
Xl.',,'c0x:,,,,',:x0:,,,'.,coN
MXl.,,,'::,,,,,',,::,,,'.,cloN
MWx.'',,,,,,,',,',,,,,,'.:ll0W
MWNd,'',,,,,,,,,,,,,,''':llKWM
MMMWd..',,,,,,,,,,,,,'.:lloXMM
MMMMWO:''''',,,,,'''':clldKWMM
WMMMMW0c'.'''''''...:lloxXMWMM
MMMMMMMW0o,'''''',lllldKMMMMMM
MMMMMMMMMKOOolllllldOOXMMMMMMM
MMMMMMMMMMMMdllllllkMMMMMMMMMM
\033[0m
\n\nBy: Outs1d3r-Net\n\n"

#SEARCH 0
echo -e "\n[*]===> SEARCH 0 <===[*]\n\n"
for i1 in $(cat $list);do
   aws s3 ls s3://"$i1" --no-sign-request;echo "[*] Bucket ===> $i1";
done

#SEARCH 1
echo -e "\n\n[*]===> SEARCH 1 <===[*]\n\n"
for i1 in $(cat $list);do
    for i2 in $(cat $list);do
        aws s3 ls s3://$i1"_"$i2 --no-sign-request; echo "[*] Bucket ===> "$i1"_"$i2;
    done;
done

#SEARCH 2
echo -e "\n\n[*]===> SEARCH 2 <===[*]\n\n"
for i1 in $(cat $list);do
    for i2 in $(cat $list);do
        aws s3 ls s3://"$i1.$i2" --no-sign-request; echo "[*] Bucket ===> $i1.$i2";
    done;
done

#SEARCH 3
echo -e "\n\n[*]===> SEARCH 3 <===[*]\n\n"
for i1 in $(cat $list);do
    for i2 in $(cat $list);do
        aws s3 ls s3://"$i1-$i2" --no-sign-request; echo "[*] Bucket ===> $i1-$i2";
    done;
done


#SEARCH 4
echo -e "\n\n[*]===> SEARCH 4 <===[*]\n\n"
for i1 in $(cat $list);do
    for i2 in $(cat $list);do
        for i3 in $(cat $list);do
            aws s3 ls s3://$i1"_"$i2"_"$i3 --no-sign-request; echo "[*] Bucket ===> "$i1"_"$i2"_"$i3;
        done;
    done;
done

#SEARCH 5
echo -e "\n\n[*]===> SEARCH 5 <===[*]\n\n"
for i1 in $(cat $list);do
    for i2 in $(cat $list);do
        for i3 in $(cat $list);do
            aws s3 ls s3://"$i1.$i2.$i3" --no-sign-request; echo "[*] Bucket ===> $i1.$i2.$i3";
        done;
    done;
done

#SEARCH 6
echo -e "\n\n[*]===> SEARCH 6 <===[*]\n\n"
for i1 in $(cat $list);do
    for i2 in $(cat $list);do
        for i3 in $(cat $list);do
            aws s3 ls s3://"$i1-$i2-$i3" --no-sign-request; echo "[*] Bucket ===> $i1-$i2-$i3";
        done;
    done;
done
