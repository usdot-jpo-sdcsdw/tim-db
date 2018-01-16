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

</a>