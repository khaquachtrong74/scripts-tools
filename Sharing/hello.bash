#!bin/bash

echo -n "Xin chao: "
read name
thungay=$(date +%A)
echo "$USER  wow, ban dep trai phet day"
echo -n "Hom nay la $thungay "
echo ""
echo "Chuc ban ngay cang dz"
function check_even_odd(){
	read val
	if[ $(( $val % 2 )) -eq 0 ]; then
		echo "$val la so chan"
	else
		echo "$val la so le"
	fi
}
check_even_odd();
