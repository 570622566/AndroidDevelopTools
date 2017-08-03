oldActivity=""
displayName=""
currentActivity=`adb shell dumpsys activity | grep mFocusedActivity`
while true
do
	if [[ $oldActivity != $currentActivity && $currentActivity != *"=null"* ]]; then
		displayName=${currentActivity% *}
		displayName=${displayName##* }
		echo $displayName
		oldActivity=$currentActivity
	fi
	currentActivity=`adb shell dumpsys activity | grep mFocusedActivity`
done 

# shell:/ $ dumpsys activity | grep mFocusedActivity
# mFocusedActivity: ActivityRecord{426c48d0 u0 io.micro.adt/.ui.MainActivity t29}