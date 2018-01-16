FROM library/mongo:3.4.0

ENV MONGO_DATABASE_NAME=cvdb
ENV TRAVELER_INFORMATION_COLLECTION_NAME=travelerInformation
ENV SESSION_COLLECTION_NAME=session
ENV EXPIRATION_INDEX_FIELD=expireAt
ENV CREATION_TIME_INDEX_FIELD=createdAt
ENV SERVICE_REGION_INDEX_FIELD=region
ENV REQUEST_ID_INDEX_FIELD=requestId

COPY traveler-information-db-docker-entrypoint.sh /traveler-information-db-docker-entrypoint.sh

RUN chmod +x /traveler-information-db-docker-entrypoint.sh

ENTRYPOINT ["/traveler-information-db-docker-entrypoint.sh"]
CMD ["mongod"]