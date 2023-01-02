aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com

docker buildx build --platform=linux/amd64 -t ${APLICATION_NAME} .

docker tag ${APLICATION_NAME}:latest ${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/${APLICATION_NAME}:latest

docker push ${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/${APLICATION_NAME}:latest