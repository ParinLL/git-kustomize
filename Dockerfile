FROM alpine:3.13
ENV KUSTOMIZE_VERSION=4.4.0
COPY entrypoint.sh /bin/
RUN apk update && apk add --no-cache git wget openssh
RUN wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz && tar xzf ./kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz  && cp ./kustomize /usr/local/bin/kustomize
RUN chmod +x /bin/entrypoint.sh

ENV SSH_KEY=
ENV IMAGES=
ENV IMAGE_TAG=
ENV MANIFEST_HOST=
ENV MANIFEST_USER=
ENV MANIFEST_REPO=
ENV MANIFEST_BRANCH=
ENV KUSTOMIZATION=

#ENTRYPOINT ["/bin/entrypoint.sh"]