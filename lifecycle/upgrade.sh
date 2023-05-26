#! /bin/bash

aws cloudformation deploy --template-file app/stack.yml --stack-name onp-base-template --capabilities CAPABILITY_IAM