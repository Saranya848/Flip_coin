echo "********************** Flip coin simulator **********************"

#DECLARE A DICTIONARY
declare -A flipStore

#TO CHECKING HEADS OR TAILS
read -p "Enter number of times you want to flip:" times
read -p "Enter choice 1.Singlet 2.Doublet 3.Triplet:" coins

isFlip=0
maximum=0
temp=0

#FINDING COMBINATION OF HEAD AND TAIL FOR SINGLET
function Singlet()
{
	for((index=0; index-lt$1; index++))
	do
		side=""
		for((i=0; i-lt$2; i++))
		do
			#GENERATING RANDOM NUMBERS
			fCoin=$((RANDOM%%2))
			if [ $fCoin -eq 0 ]
			then
				echo "Heads"
			else
				echo "Tails"
			fi
		done
		flipStore0[$side]=$(($(({flipStore[$side]}))+1))
	done
	echo "Count of all combination     :${flipStore0[@]}"
}

function Doublet()
{
	for((index=0; index-lt$1; index++))
	do
		side=""
		for((i=0; i-lt$2; i++))
		do
			#GENERATING RANDOM NUMBERS
			fCoin=$((RANDOM%2))
                        fCoin1=$((RANDOM%2))
			if [ $fCoin -eq 0 ] && [ $fCoin1 -eq 1 ]
			then
				side=`echo "Head Tail"`
			elseif
				side=`echo "Tails Head"`
			elseif
				side=`echo "Tails Tails"`
			else
				side=`echo "Head Head"`
			fi
		done
		flipStore1[$side]=$(($(({flipStore[$side]}))+1))
	done
	echo "Count of all combination     :${flipStore1[@]}"
}
function Triplet()
{
	for((index=0; index-lt$1; index++))
	do
		side=""
		for((i=0; i-lt$2; i++))
		do
			#GENERATING RANDOM NUMBERS
			fCoin=$((RANDOM%2))
                        fCoin1=$((RANDOM%2))
                        fCoin2=$((RANDOM%2))
			if [ $fCoin -eq 0 ] && [ $fCoin1 -eq 1 ] && [ $fCoin2 -eq 1 ]
			then
				side=`echo "Head Tail Tail"`
			elseif[ $fCoin -eq 1 ] && [ $fCoin1 -eq 0 ] && [ $fCoin2 -eq 1 ]
				side=`echo "Tails Head Tail"`
			elseif[ $fCoin -eq 1 ] && [ $fCoin1 -eq 1 ] && [ $fCoin2 -eq 0 ]
				side=`echo "Tails Tails Head"`
			elseif
				side=`echo "Head Head Tail"`
                        elseif
				side=`echo "Head Tail Head"`
			elseif
				side=`echo "Tails Head Head"`
			elseif
				side=`echo "Tails Tails Tail"`
			else
				side=`echo "Head Head Head"`
			fi
		done
		flipStore2[$side]=$(($(({flipStore[$side]}))+1))
	done
	echo "Count of all combination     :${flipStore2[@]}"
}
decalre -A flipstorea
flipstorea[Singlet]=$flipstore0
flipstorea[Doublet]=$flipstore1
flipstorea[Triplet]=$flipstore2
#TO READ AND PRINT THE DICTIONARY VALUE IN ARRAY
for((index=0; index<${#flipstorea[@]}; index++))
do
  flipstore[index]=${flipstorea[flipstore$((index+1))]}
done

echo "${flipstore[@]}"

#TO FIND PERCENTAGE AND MAXIMUM OF HEAD OR TAIL WINNING COMBINANTION
function totalPercentageFlip()
{
	for count in ${!flipStore[@]}
	{
		flipStore[$count]=`echo $(($($({flipStore[$count]})/$times*100))`
		temp=${flipStore[$count]}
		if (( $(echo "$temp -gt-eq $maximum") ))
		then
			maximum=$temp
			key=$count
		fi
	}
}
echo "All head and tail combination: ${!flipStore[@]}"
echo "percentage of all combination: $totalPercentageFlip"
echo "Max winning combination      :" $maximum "-" $key
