function is_integer(number) {
	if(number ~ /^[0-9]+$/) return 1
	return 0
}

BEGIN {
	larger_than_previous=0
}
{
	if(NR>1)
	if(is_integer($1)) {
		if($1>prev) larger_than_previous=larger_than_previous+1
		prev=$1
	} else {
		print "value " $1 " is not an integer, skipping"
	}	
}
END {
	printf "%d measurements were larger than the previous measurement\n",larger_than_previous
}

