# README -- Portfolio 5: Distributed and Cloud Databases

**Portfolio:** Advanced Database Systems -- Portfolio 5\
**Case study:** SwiftRide Nigeria\
**Cloud platform:** MongoDB Atlas\
**Cluster:** `SwiftRideCluster`\
**Database:** `SwiftRideCloud`\
**Collection:** `DriverLocations`

## 1. Project Overview

This portfolio explores distributed and cloud database technologies
using SwiftRide Nigeria, a simulated ride-hailing platform. The
practical work extended the earlier local MongoDB implementation by
deploying a MongoDB database to MongoDB Atlas.

The exercise covered cloud deployment, connection through Visual Studio
Code, document insertion and retrieval, majority write and read
concerns, and examination of replica-set architecture. Sharding was
evaluated as a future scalability strategy.

## 2. Case Study

SwiftRide manages passengers, drivers, vehicles, ride requests,
payments, ratings and driver locations. Microsoft SQL Server is used for
structured operational and transactional data. MongoDB is used for
flexible driver-location and availability documents.

The proposed hybrid architecture retains SQL Server for structured
transactions and uses MongoDB Atlas for driver-location and availability
information.

## 3. Objectives

- Deploy MongoDB in a cloud environment using MongoDB Atlas.
- Connect to the cloud deployment through Visual Studio Code.
- Create the `SwiftRideCloud` database and `DriverLocations`
  collection.
- Insert, retrieve and update cloud-based driver-location documents.
- Demonstrate majority write concern and majority read concern.
- Examine replication and high availability.
- Discuss sharding as a future scalability option.
- Compare local MongoDB with a managed cloud deployment.

## 4. Technologies Used

- MongoDB Atlas
- MongoDB for VS Code extension
- MongoDB Shell
- Visual Studio Code
- Microsoft SQL Server
- JavaScript-based MongoDB commands

## 5. Cloud Deployment

A MongoDB Atlas cluster named `SwiftRideCluster` was created. Within the
cluster, the `SwiftRideCloud` database and `DriverLocations` collection
were created.

The cloud connection was tested using:

```javascript
db.adminCommand({ ping: 1 });
```

The successful response `{ ok: 1 }` confirmed that the shell could
communicate with the deployment.

## 6. Cloud Document Operations

A test driver document was inserted into `DriverLocations`. It contained
a driver identifier, driver name, vehicle registration, geographic
coordinates, availability status and last-updated timestamp.

The document was retrieved using `find()` to verify that it had been
stored. The driver's availability was then updated from `Available` to
`On Trip`, and the updated document was retrieved.

## 7. Data Consistency

The update operation used:

```javascript
db.DriverLocations.updateOne(
  { driverId: 301 },
  {
    $set: {
      availability: "On Trip",
      lastUpdated: new Date(),
    },
  },
  {
    writeConcern: { w: "majority" },
  },
);
```

The write concern requests acknowledgement after the write has been
applied to a majority of the replica set's voting members.

The updated record was read using majority read concern:

```javascript
db.runCommand({
  find: "DriverLocations",
  filter: { driverId: 301 },
  readConcern: { level: "majority" },
});
```

The result showed the updated availability value, `On Trip`. This
demonstrated a majority-acknowledged write followed by a majority read.

## 8. Replication and High Availability

The Atlas cluster overview displayed a replica set consisting of **three
nodes**.

In a typical three-member replica set:

- The primary accepts writes.
- Secondary members replicate data from the primary.
- An election can select a new primary if the current primary becomes
  unavailable, subject to voting and availability conditions.

Replication is managed by MongoDB Atlas for this deployment. The
three-node replica-set configuration was confirmed in the Atlas
overview. A deliberate node failure and failover test were **not**
performed; failover is therefore discussed as a platform capability
rather than reported as a tested outcome.

## 9. Sharding and Scalability

Sharding distributes data across multiple database servers, or shards,
to support larger datasets and workloads.

As SwiftRide expands and driver-location updates increase, a future
sharded design could distribute location records across multiple shards.
A shard key must be selected based on query patterns, write
distribution, cardinality and hotspot risk. Driver ID may be one
candidate to evaluate, but it should not be selected without workload
analysis.

**Sharding was discussed but not configured in the current deployment.**

## 10. Local MongoDB vs MongoDB Atlas

---

Feature Local MongoDB MongoDB Atlas

---

Deployment Local computer Cloud infrastructure

Access Depends on local Remote access with
machine/network authorised credentials

Administration User manages local Many infrastructure
installation and tasks are managed by
service Atlas

Replication Requires configuration Managed replica-set
if needed deployment, depending
on tier/configuration

Scalability Requires local Managed scaling options
infrastructure changes are available

---

Local MongoDB provided a controlled environment for learning document
operations and geospatial queries. Atlas extended the work through
remote access and managed cloud infrastructure.

## 11. Proposed Hybrid Architecture

---

Component Database Purpose

---

Passenger records SQL Server Structured passenger
information

Driver records SQL Server Driver registration and
records

Ride transactions SQL Server Ride requests and
completion

Payments SQL Server Payment records and
financial transactions

Driver locations MongoDB Atlas Flexible location
documents

Driver availability MongoDB Atlas Availability
information

Future GPS history Distributed storage High-volume location
history

---

This hybrid approach uses relational technology for structured
transactions and document technology for flexible location information.
A production implementation would also require explicit designs for data
ownership, synchronisation, security, monitoring, backup and recovery.

## 12. Implementation Status

Component Status

---

MongoDB Atlas cluster Implemented
Cloud connection through VS Code Implemented
`SwiftRideCloud` database Implemented
`DriverLocations` collection Implemented
Cloud document insertion and retrieval Implemented
Driver availability update Implemented
Majority write concern Tested
Majority read concern Tested
Three-node replica set Confirmed
Automatic failover Discussed, not tested
Sharding Discussed, not implemented
Hybrid database architecture Proposed

## 14. Conclusion

This portfolio demonstrated the deployment and use of MongoDB Atlas as a
cloud-hosted document database for SwiftRide Nigeria. The practical
exercises covered cloud connectivity, database and collection creation,
document insertion and retrieval, availability updates, and majority
read and write concerns.

The three-node replica set was confirmed in the Atlas cluster overview,
providing a practical basis for discussing replication and high
availability. Sharding was evaluated as a future scalability option
rather than implemented.

The exercise illustrates how a hybrid architecture combining SQL Server
and MongoDB Atlas could support SwiftRide's structured transactions and
flexible driver-location workload.
