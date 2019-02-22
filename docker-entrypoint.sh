#!/bin/bash -xe

/mongodb-docker-entrypoint.sh $@ &
MONGO_PID=$!

TRAVELER_INFORMATION='db.'$TRAVELER_INFORMATION_COLLECTION_NAME
SESSION='db.'$SESSION_COLLECTION_INDEX
EXPIRATION_INDEX='{ "'$EXPIRATION_INDEX_FIELD'" : 1 }'
EXPIRATION_INDEX_OPTS='{ "expireAfterSeconds" : 0, "background" : true }'
SERVICE_REGION_INDEX='{ "'$SERVICE_REGION_INDEX_FIELD'" : "2dsphere", "'$CREATION_TIME_INDEX_FIELD'" : 1}'
SERVICE_REGION_INDEX_OPTS='{ "background" : true }'
REQUEST_ID_INDEX='{ "'$REQUEST_ID_INDEX_FIELD'" : 1, "'$CREATION_TIME_INDEX_FIELD'" : 1 }'
REQUEST_ID_INDEX_OPTS='{ "background" : true }'
CREATION_TIME_INDEX='{ "'$CREATION_TIME_INDEX_FIELD'" : 1 }'
CREATION_TIME_INDEX_OPTS='{ "background" : 1 }'


while ! mongo $MONGO_DATABASE_NAME --eval ';'; do
    echo 'Index creation is waiting for the mongo instance to be ready...'
    sleep 2;
done

echo 'Index creation starting...'

function create-collection() {
    echo 'db.createCollection("'$1'");'
}

function create-index() {
    echo $1'.createIndex('$2', '$3');'
}

MONGO_COMMAND=\
`create-collection "$TRAVELER_INFORMATION_COLLECTION_NAME"`\
`create-collection "$SESSION_COLLECTION_NAME"`\
`create-index "$TRAVELER_INFORMATION" "$EXPIRATION_INDEX" "$EXPIRATION_INDEX_OPTS"`\
`create-index "$TRAVELER_INFORMATION" "$SERVICE_REGION_INDEX" "$SERVICE_REGION_INDEX_OPTS"`\
`create-index "$TRAVELER_INFORMATION" "$REQUEST_ID_INDEX" "$REQUEST_ID_INDEX_OPTS"`\
`create-index "$TRAVELER_INFORMATION" "$CREATION_TIME_INDEX" "$CREATION_TIME_INDEX_OPTS"`

echo 'Executing command:'

echo "$MONGO_COMMAND"

mongo $MONGO_DATABASE_NAME --eval "$MONGO_COMMAND"

wait $MONGO_PID