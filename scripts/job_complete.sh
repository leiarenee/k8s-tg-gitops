#!/bin/bash
# Calculate progress
completed_module=$(echo $1 | sed s/$STACK_FOLDER\\\///g)
echo TERRAGRUNT-PROCESS-COMPLETE $completed_module
pwd
echo $completed_module >> $TG_PARRENT_DIR/completed_tasks.log
completed_tasks=($(cat $TG_PARRENT_DIR/completed_tasks.log))
module_count=${#completed_tasks[@]}
echo "Completed modules $module_count / $TG_MODULES_COUNT"
progress=$(($INITIAL_PROGRESS + ($module_count * ($MODULES_FINAL_PROGRESS - $INITIAL_PROGRESS) / $TG_MODULES_COUNT)))
if [ $progress -gt $MODULES_FINAL_PROGRESS ]
then
 progress=$MODULES_FINAL_PROGRESS
fi

echo "Progress: $progress %"

echo "Sending SQS Message to $SQS_QUEUE_URL with $SQS_AWS_PROFILE profile."

# send sqs message
aws --profile $SQS_AWS_PROFILE sqs send-message --queue-url "$SQS_QUEUE_URL" --message-group-id "$SQS_MESSAGE_GROUP_ID" \
  --message-body "{\"message\":{\"status\":\"Module completed '$completed_module'\",\"progress\":$progress,\"module\":\"$completed_module\"}}"