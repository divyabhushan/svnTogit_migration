#!/bin/sh

#Aim: Generate authors list in git style from a list of svn committers.

#----------------------------------------------------------------------
# USAGE() function
#----------------------------------------------------------------------
USAGE(){
if [ $# -ne 1 ];then
	echo "\nUSAGE: [$0] [ svnCommitters.txt ] \n"
	exit 1;
fi
}

#----------------------------------------------------------------------
# set_variables function
#----------------------------------------------------------------------
set_variables(){
SVNcommitterList=$1
DIR=`pwd`
        if [ ! -d $DIR/logs ];then
                mkdir $DIR/logs
        fi
        gitCommitterList="$DIR/logs/gitCommitterList.txt"
}

exit_status(){
if [ $? -ne 0 ];then
	echo "Failed!!!"
fi
}

########################################################################
# Main function
########################################################################

main(){
USAGE $@
set_variables $@

for name in `cat $SVNcommitterList`; do
	echo "Enter <firstName> <lastName> for $name:"
	read firstLast;

	echo "Enter the email address for $name:"
	read email;

	#git author name format: divya bhushan <divya_bhushan@hotmail.com>
	echo "$firstLast <$email>" >> $gitCommitterList
done;

echo "git style format author's list: $gitCommitterList"
exit 0;
}

main $@


