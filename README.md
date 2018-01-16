# Connected Vehicles Traveler Information Database

The Connected Vehicles Traveler Information Database project contains a docker image which 
runs a Mongo database, but also will create the collections and indices for running the
necessary queries.

<a name="toc"/>

## Table of Contents

[I. Release Notes](#release-notes)

[II. Documentation](#documentation)

[III. Getting Started](#getting-started)

[IV. Running the Application](#running)

---

<a name="release-notes" id="release-notes"/>

## [I. Release Notes](ReleaseNotes.md)

<a name="documentation"/>

## II. Documentation

This repository produces a Docker image which, when run, will create the necessary
collections and indices in, and then expose, a mongo database.

For information on configuring the Mongo database itself, see the [documentation for the underlying image](https://hub.docker.com/_/mongo/)

The database contains two collections:

* Traveler Information: Contains deposited traveler information
* Sessions: Used to maintain sessions statelessly

<a name="getting-started"/>

## III. Getting Started

The following instructions describe the procedure to fetch, build, and run the application

### Prerequisites
* Git: https://git-scm.com/
* Docker: https://docs.docker.com/engine/installation/

---
### Obtain the Source Code

#### Step 1 - Clone public repository

Clone the source code from the GitHub repository using Git command:

```bash
git clone TBD
```

<a name="running"/>

## IV. Running the application

---
### Build and Deploy the Application

**Step 1**: Build Docker Image

```bash
docker build -t dotcv/traveler-information-db .
```

**Step 2**: Run Docker Container

The following variables can be used to configure the database:

* MONGO_DATABASE_NAME - Name of the database to store all relevant information in. Defaults to "cvdb".
* TRAVELER_INFORMATION_COLLECTION_NAME - Name of the collection to store traveler information in. Defaults to "travelerInformation".
* SESSION_COLLECTION_NAME - Name of the collection to store session information in. Defaults to "session".
* EXPIRATION_INDEX_FIELD - Name of the JSON field which contains the expiration date of traveler information. Defaults to "expireAt".
* CREATION_TIME_INDEX_FIELD - Name of the JSON field which contains the creation date of traveler information. Defaults to "createdAt".
* SERVICE_REGION_INDEX_FIELD - Name of the JSON field which contains the service region of traveler information. Defaults to "region".
* REQUEST_ID_INDEX_FIELD - Name of the JSON field which contains the request ID of traveler information. Defaults to "requestId".

```bash
docker run \
    -e MONGO_DATABASE_NAME=... \
    -e TRAVELER_INFORMATION_COLLECTION_NAME=... \
    -e SESSION_COLLECTION_NAME=... \
    -e EXPIRATION_INDEX_FIELD=... \
    -e CREATION_TIME_INDEX_FIELD=... \
    -e SERVICE_REGION_INDEX_FIELD=... \
    -e REQUEST_ID_INDEX_FIELD=... \
    dotcv/traveler-information-db
```

</a>