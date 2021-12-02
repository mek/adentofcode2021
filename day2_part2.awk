function valid_direction(direction) {
	op = tolower(direction)
	if(op=="forward" || op=="up" || op=="down") return op
	print direction "is an invalid direction"
	return "invalid"
}

function is_integer(number) {
	if(number ~ /^[0-9]+$/) return 1
	return 0
}

BEGIN {
	horizontal=0
	depth=0
	aim=0
}

{
	direction=valid_direction($1)
	if(is_integer($2)){
		if(direction=="forward") {
			horizontal=horizontal+$2
			depth=depth+(aim*$2)
		}
		if(direction=="down") aim=aim+$2
		if(direction=="up")   aim=aim-$2
	} else {
		print "value for " $1 " is not an integer"
	}
}

END {
	print "Horizonal position: " horizontal
	print "Depth position    : " depth
	print "Aim               : " aim
	print "Vector            : " depth*horizontal
}
