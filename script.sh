#!/bin/sh

. /root/env.sh

queueCounts=$(/usr/local/bin/aws sqs get-queue-attributes \
--queue-url https://sqs.ap-northeast-1.amazonaws.com/<AWS_ACCOUNT_ID>/<QUEUE_NAME> \
--attribute-names ApproximateNumberOfMessages \
--query Attributes.ApproximateNumberOfMessages \
--output text)

/usr/local/bin/aws cloudwatch put-metric-data \
--metric-name FiveSecondsApproximateNumberOfMessages \
--namespace CustomSQS \
--dimensions QueueName=moqmoque \
--unit Count \
--value $queueCounts