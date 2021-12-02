function is_integer(number) {
	if(number ~ /^[0-9]+$/) return 1
	return 0
}

function array_sum(arr) {
	total=0
	for(i in arr) total=total+arr[i]
	return total
}

function array_prt(arr) {
	for(i in arr) printf "%d ",arr[i]
	print ""
}

BEGIN {
	window=3
	larger_than_previous=0
}

{
	if(is_integer($1)) {
		if(NR<window+1) {
			a[NR]=$1
		} else {
			prev = array_sum(a)
			for(i=1;i<window;i++) a[i] = a[i+1]
			a[window]=$1
			sum = array_sum(a)
			if(sum>prev) larger_than_previous=larger_than_previous+1
		}
	} else {
		print "value " $1 " is not an integer, skipping"
	}	
}

END {
	printf "%d measurements were larger than the previous measurement\n",larger_than_previous
}

