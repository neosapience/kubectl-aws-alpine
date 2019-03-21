FROM alpine

WORKDIR /usr/local/bin
RUN apk add --no-cach --update ca-certificates curl \
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && curl -LO "https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator" \
    && rm -rf /var/cache/apk/* \
    && chmod +x /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/aws-iam-authenticator

ENTRYPOINT [ "kubectl" ]
