#! /bin/bash

aws cloudformation deploy --template-file app/stack.yml --stack-name onp-bucket --capabilities CAPABILITY_IAM