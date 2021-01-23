BUCKET_NAME=<bucket_name>
STACK_NAME=<stack_name>
PROFILE=pessoal

simpl_deploy:
	sam build -u \
	&& sam deploy --guided --profile ${PROFILE}

pack_deploy:
	sam build -u \
	&& sam package --s3-bucket ${BUCKET_NAME}  --output-template-file packaged.yaml --profile ${PROFILE} \
	&& sam deploy -t packaged.yaml --stack-name ${STACK_NAME} --s3-bucket ${BUCKET_NAME} --capabilities CAPABILITY_IAM --profile ${PROFILE}

build:
	sam build -u --debug
