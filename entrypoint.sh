#!/bin/sh
mkdir -p ~/.ssh && echo $SSH_KEY | base64 -d > ~/.ssh/id_rsa && chmod 700 ~/.ssh/id_rsa && ssh-keyscan $MANIFEST_HOST -p $SSH_PORT >> ~/.ssh/known_hosts
rm -rf $MANIFEST_REPO && git clone ssh://git@$MANIFEST_HOST:$SSH_PORT/$MANIFEST_USER/$MANIFEST_REPO.git

cd $MANIFEST_REPO/$KUSPATH

for IMAGE in $(echo $IMAGES | sed "s/,/ /g")
do
    kustomize edit set image $IMAGE:$IMAGE_TAG
done

git add . && git commit --allow-empty -m "🚀CI update to ${IMAGE_TAG}"
git push ssh://git@$MANIFEST_HOST:$SSH_PORT/$MANIFEST_USER/$MANIFEST_REPO.git