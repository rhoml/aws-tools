#!/bin/bash
#
# USAGE: launch_ami

NAME=instance01
ENVIRONMENT=production
AMI_ID=ami-ae62d7c6
KERNEL_ID=aki-919dcaf8
KEY_ID=key_id
INSTANCE_TYPE='m3.large'
EC2_RUN_INSTANCES=`which ec2-run-instances`
EC2_DESCRIBE_INSTANCES=`which ec2-describe-instances`
EC2_CREATE_TAGS=`which ec2-create-tags`
SEC_ID='sg'
AMAZON_AZ='us-east-1b'
USER_DATA='instance01-cloudinit.txt'

echo "Starting Instance..."
INSTANCE_DETAILS=`${EC2_RUN_INSTANCES} -k ${KEY_ID} -t ${INSTANCE_TYPE} -g ${SEC_ID} -z ${AMAZON_AZ} ${AMI_ID} --kernel ${KERNEL_ID} -f ${USER_DATA} --disable-api-termination`

AVAILABILITY_ZONE=`echo ${INSTANCE_DETAILS} | awk '{print $9}'`
INSTANCE_ID=`echo ${INSTANCE_DETAILS} | awk '{print $6}'`

# Set tags

echo "Creating tags"
${EC2_CREATE_TAGS} ${INSTANCE_ID} --tag "Name=${NAME}" --tag "Environment=${ENVIRONMENT}"

# wait for instance to be started
DNS_NAME=`${EC2_DESCRIBE_INSTANCES} --filter "tag-key=Name" --filter "tag-value=${NAME}" --filter "instance-state-name=running" | grep INSTANCE | awk '{print $4}'`

while [ -z "$DNS_NAME" ]
do
 echo "Waiting for instance to start...."
 sleep 5
 DNS_NAME=`${EC2_DESCRIBE_INSTANCES} --filter "tag-key=Name" --filter "tag-value=${NAME}" --filter "instance-state-name=running" | grep INSTANCE | awk '{print $4}'`
done

echo "Instance started"

echo "Instance ID  => ${INSTANCE_ID}"
echo "DNS          => ${DNS_NAME}"
echo "AVAILABILITY => ${AVAILABILITY_ZONE}"
