[![Build Status](https://travis-ci.org/mborges-pivotal/pcf-ers-demo1.svg?branch=master)](https://travis-ci.org/mborges-pivotal/pcf-ers-demo1)
[ ![Download](https://api.bintray.com/packages/mborges-pivotal/generic/pcf-ers-demo1/images/download.svg) ](https://bintray.com/mborges-pivotal/generic/pcf-ers-demo1/_latestVersion)

# PCF Concourse Base Demo
Base application to demonstrate Concourse And PCF


## Introduction
This base application is intended to demonstrate some of the basic functionality of Concoruse and PCF:


## Getting Started

**Prerequisites**
- [Cloud Foundry CLI](http://info.pivotal.io/p0R00I0eYJ011dAUCN06lR2)
- Concourse up and running locally. Please download this ( Vagrantfile) from http://www.Concourse.ci
- [Git Client](http://info.pivotal.io/i1RI0AUe6gN00C010l12J0R)
- An IDE, like [Spring Tool Suite](http://info.pivotal.io/f00RC0N0lh01eU21IAJ260R)
- [Java SE Development Kit](http://info.pivotal.io/n0I60i3021AN0JU0le10CRR)

**Building**
```
$ git clone [REPO]
$ cd [REPO]
$ ./mvnw clean install
``` 
## What it looks like on Concourse 

![alt tag] (https://github.com/reagul/pcf-ers-demo/blob/master/pcfers-demo.png)
### To run the application locally
The application is set to use an embedded H2 database in non-PaaS environments, and to take advantage of Pivotal CF's auto-configuration for services. To use a MySQL Dev service in PCF, simply create and bind a service to the app and restart the app. No additional configuration is necessary when running locally or in Pivotal CF.

In Pivotal CF, it is assumed that a Pivotal MySQL service will be used.

```
$ ./mvnw spring-boot:run
```

### Running on Cloud Foundry
Take a look at the manifest file for the recommended setting. Adjust them as per your environment.

## Demo Scripts summary
The application tries to be self-descriptive. You'll see when you access the application.

## Show PivotalTracker Commit. Create webhook integrtion first

[(Finishes|Fixes|Delivers) #TRACKER_STORY_ID]

## Using Tracker resource as part of Concourse.ci pipeline
[Finishes #134971619]

