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
## What it looks like on Concourse ..

![alt tag] (https://github.com/reagul/pcf-ers-demo/blob/master/pcfers-demo.png)
### To run the application locally
The application is set to use an embedded H2 database in non-PaaS environments, and to take advantage of Pivotal CF's auto-configuration for services. To use a MySQL Dev service in PCF, simply create and bind a service to the app and restart the app. No additional configuration is necessary when running locally or in Pivotal CF.

In Pivotal CF, it is assumed that a Pivotal MySQL service will be used.

```
$ ./mvnw spring-boot:run
```

### Running on Cloud Foundry
Take a look at the manifest file for the recommended setting. Adjust them as per your environment.


## PivotalTracker Integration. 
1> Create a Pivotal Tracker account. Under your profiles, copy the API token. This you will enter into the GitWebhooks form.
2> Create Git webhooks for Pivotal tracker.. see here (https://www.pivotaltracker.com/blog/guide-githubs-service-hook-tracker/)
3> Create a Concourse pipeline with Tracker resoruce. See the example Yml file under ci/Tracker.yml.
4> When tracker resource runs, it will Deliver the story 

### Tracker Worlflow 

Tracker resource in Concourse is  used to "DELIVER" the story once it has passed CI, so for example, when i make commits to github.com projects, we add status like this  [Finishes #123456] to commit message. This is picked up by the GitWebhook that runs once commit is detected for the given project and relayed to Tracker. When Tracker resource runs, it will complete the DELIVERY of the fixes by updating the status of the story / epic / bug in Tracker to "DELIVERED". The following is typical Developer / Product manager workflow.

- The git hook finishes the story/epic in Tracker
- Our pipeline triggers on that commit
- Once the pipeline passes the tracker-resource Delivers / Completes the story. Your PM will see a Accept / Reject status next to the Epic now.

Note: The commit status has the status with the ID of the Epic in our example above its #123456.

[(Finishes|Fixes|Delivers) #TRACKER_STORY_ID]

## Sample of Tracker Resource

(Defining)

- name: tracker-output
  type: tracker
  source:
    token: {{tracker-token}}
    project_id: "1859335"
    tracker_url: https://www.pivotaltracker.com
 
(Using)
- put: tracker-output
    params:
      repos:
    - pcf-ers-demo
