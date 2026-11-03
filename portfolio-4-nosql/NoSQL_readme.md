# SwiftRide Nigeria Database Project

## Portfolio 4: NoSQL and Advanced Data Models

### 1. Overview

This portfolio explores NoSQL database technologies and their suitability for the SwiftRide Nigeria ride-hailing platform. The practical implementation uses MongoDB to store and manage driver-location information, while the portfolio also examines key-value, column-family and graph database models.

The implementation was completed using **MongoDB** and **Visual Studio Code**.

### 2. Case Study

SwiftRide Nigeria is a simulated ride-hailing platform that connects passengers with drivers. The system manages passenger records, driver profiles, vehicle assignments, ride bookings, fares, payments, ratings and driver locations.

While Microsoft SQL Server is suitable for structured transactional data, SwiftRide may also require flexible data storage for operational information such as GPS coordinates, driver availability and location updates.

### 3. Objectives

The objectives of this portfolio are to:

* Explain the main NoSQL data models.
* Compare document, key-value, column-family and graph databases.
* Implement a document-based database using MongoDB.
* Insert, retrieve, filter and update driver-location documents.
* Demonstrate geospatial indexing and location-based queries.
* Evaluate the suitability of MongoDB within a hybrid database architecture.

### 4. Tools and Technologies

| Tool                | Purpose                               |
| ------------------- | ------------------------------------- |
| MongoDB             | Document-oriented NoSQL database      |
| MongoDB for VS Code | Database connection and interaction   |
| MongoDB Shell       | Executing MongoDB commands            |
| GeoJSON             | Representing geographical coordinates |
| `2dsphere` index    | Supporting geographical queries       |

### 5. Overview of NoSQL Data Models

| NoSQL model   | Example technology | SwiftRide application                                         |
| ------------- | ------------------ | ------------------------------------------------------------- |
| Document      | MongoDB            | Driver profiles, locations and availability                   |
| Key-value     | Redis              | Passenger sessions and temporary ride requests                |
| Column-family | Apache Cassandra   | Large volumes of GPS history and ride events                  |
| Graph         | Neo4j              | Relationships between passengers, drivers, rides and vehicles |

#### Document Model

MongoDB stores data in flexible, JSON-like documents. This model is suitable for driver information because documents can contain nested fields such as vehicle details, location coordinates and availability status.

#### Key-Value Model

Redis stores data as key-value pairs. SwiftRide could use it to manage active passenger sessions or temporary ride-request information.

#### Column-Family Model

Apache Cassandra is designed to manage large volumes of distributed data. It could support SwiftRide's historical GPS records and ride activity logs.

#### Graph Model

Neo4j represents entities and their relationships. It could help SwiftRide analyse passenger-driver relationships, ride patterns and vehicle assignments.

### 6. MongoDB Database Implementation

A database named `SwiftRideNoSQL` and a collection named `DriverLocations` were created.

Sample driver documents were inserted containing:

* Driver ID
* Driver name
* Vehicle registration
* Latitude and longitude
* Availability status
* Last updated timestamp

The following MongoDB operations were completed:

Activity	MongoDB operation	Result
Create database	use SwiftRideNoSQL	Successful
Create collection	createCollection()	Successful
Insert driver documents	insertMany()	Four documents inserted
Retrieve records	find()	Driver documents displayed
Filter available drivers	find() with a condition	Matching drivers retrieved
Update driver status	updateOne()	Availability updated
Verify update	findOne()	Updated record confirmed
7. Geospatial Indexing and Location-Based Queries

Driver coordinates were converted into GeoJSON Point objects using longitude and latitude.

A 2dsphere index was created on the geoLocation field:

db.DriverLocations.createIndex({
    geoLocation: "2dsphere"
})

A location-based query was then executed using the $near operator to retrieve drivers within a simulated 10-kilometre radius of a passenger's pickup location.

This demonstrated how MongoDB can support geographical searches in a ride-hailing application.

8. Suitability of MongoDB for SwiftRide

MongoDB is suitable for SwiftRide because its flexible document structure supports operational data such as driver profiles, GPS coordinates, vehicle information and availability status.

The ability to update individual documents allows the system to reflect changes in driver availability as rides are accepted or completed. Geospatial indexing also supports the retrieval of nearby drivers based on passenger pickup locations.

However, MongoDB does not need to replace Microsoft SQL Server. SQL Server remains appropriate for structured and transactional operations such as passenger registration, ride bookings, fare calculations and payment processing.

A hybrid architecture combining SQL Server and MongoDB would provide relational data integrity alongside flexible document storage.

9. Evidence to Include

The portfolio should include screenshots showing:

MongoDB connection in VS Code.
The SwiftRideNoSQL database and DriverLocations collection.
Successful insertion of four driver documents.
Output from the find() query.
Available drivers returned by the filter query.
Successful driver availability update.
Verification of the updated driver document.
Successful creation of the 2dsphere index.
Nearby-driver query results.
Geospatial index verification.
10. Conclusion

This portfolio demonstrated the practical use of MongoDB as a document-oriented NoSQL database for SwiftRide Nigeria. Driver records were inserted, retrieved, filtered and updated successfully. Geospatial indexing and location-based queries were also implemented to demonstrate how MongoDB can support nearby-driver searches.

The comparison of document, key-value, column-family and graph models highlighted how different NoSQL technologies could support different operational requirements. The exercise demonstrated that a hybrid architecture combining MongoDB and SQL Server could provide flexibility while preserving the integrity of core transactional data.

11. Project Environment
Case study: SwiftRide Nigeria
Relational database: Microsoft SQL Server
NoSQL database: MongoDB
Development environment: Visual Studio Code
Portfolio: NoSQL and Advanced Data Models