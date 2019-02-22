FROM library/mongo:3.4.0

ENV MONGO_DATABASE_NAME=cvdb
ENV TRAVELER_INFORMATION_COLLECTION_NAME=travelerInformation
ENV SESSION_COLLECTION_NAME=session
ENV EXPIRATION_INDEX_FIELD=expireAt
ENV CREATION_TIME_INDEX_FIELD=createdAt
ENV SERVICE_REGION_INDEX_FIELD=region
ENV REQUEST_ID_INDEX_FIELD=requestId

RUN mv /entrypoint.sh /mongodb-docker-entrypoint.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mongod"]