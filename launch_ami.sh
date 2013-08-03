#!/bin/bash
#
# USAGE: launch_ami

AMI_ID=ami-xxxx
KEY_ID=xxxxxx
INSTANCE_TYPE="t1.micro"
EC2_RUN_INSTANCES=`which ec2-run-instances`
EC2_DESCRIBE_INSTANCES=`which ec2-describe-instances`
SEC_ID="xxx-xxx"
AMAZON_AZ="eu-west-1a"
SIZE=10

echo "Starting Instance..."
INSTANCE_DETAILS=`${EC2_RUN_INSTANCES} -k ${KEY_ID} --block-device-mapping /dev/sda1=:${SIZE} -t ${INSTANCE_TYPE} -g ${SEC_ID} -z ${AMAZON_AZ} ${AMI_ID} --disable-api-termination`
echo ${INSTANCE_DETAILS}

AVAILABILITY_ZONE=`echo ${INSTANCE_DETAILS} | awk '{print $13}'`
INSTANCE_ID=`echo ${INSTANCE_DETAILS} | awk '{print $6}'`

echo "Availability Zone ${AVAILABILITY_ZONE}"
echo "Instance ID ${INSTANCE_ID}"

# wait for instance to be started
DNS_NAME=`${EC2_DESCRIBE_INSTANCES} --filter "image-id=$AMI_ID" --filter "instance-state-name=running" --filter "instance-id=${INSTANCE_ID}" | grep INSTANCE | awk '{print $4}'`

while [ -z "$DNS_NAME" ]
do
 echo "Waiting for instance to start...."
 sleep 5
 DNS_NAME=`${EC2_DESCRIBE_INSTANCES} --filter "image-id=$AMI_ID" --filter "instance-state-name=running" --filter "instance-id=${INSTANCE_ID}" | grep INSTANCE | awk '{print $4}'`
done

echo "Instance started"

echo "Instance ID = ${INSTANCE_ID}"
echo "DNS = ${DNS_NAME} in availability zone ${AVAILABILITY_ZONE}"
