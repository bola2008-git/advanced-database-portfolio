# SwiftRide Nigeria – Advanced Database Systems Project

## Advanced Database Systems | Masters of Information Technology.

**Project:** Design, Implementation and Evaluation of a Hybrid Database System for a Simulated Ride-Hailing Company
**Organisation:** SwiftRide Nigeria (Simulated Case Study)
**Author:** Bolarinwa Falomo
**Programme:** Masters of Information Technology 
**Student Email:** b.falomo0402@miva.edu.ng
**Student ID:** 301910402
**GitHub Repository:** [https://github.com/bola2008-git/advanced-database-portfolio]

---

# 1. Project Overview

This project demonstrates the design, implementation, optimisation and evaluation of database technologies for a simulated Nigerian ride-hailing company, **SwiftRide Nigeria**.

The project explores how modern database systems can support the operational and analytical requirements of a ride-hailing business. These include passenger and driver management, ride bookings, vehicle assignments, payment processing, driver location tracking and operational reporting.

A combination of relational and NoSQL database technologies was explored to demonstrate how different database models can support different application requirements.

The project is structured into five practical portfolios:

1. Relational Database Design and Implementation
2. Query Processing and Optimisation
3. Transactions and Concurrency Control
4. NoSQL and Advanced Data Models
5. Distributed and Cloud Databases

The overall objective was to develop a practical understanding of database architecture, performance, consistency, scalability and the suitability of different database technologies for real-world applications.

---

# 2. Case Study: SwiftRide Nigeria

SwiftRide Nigeria is a simulated ride-hailing organisation operating within the Nigerian transport sector.

The organisation requires a database solution capable of managing its core business operations.

### Business requirements

The proposed system must support:

- Passenger registration and management.
- Driver registration and management.
- Vehicle information and driver assignments.
- Ride requests and booking records.
- Fare calculation and ride completion.
- Payment processing and transaction records.
- Passenger ratings and feedback.
- Real-time driver location tracking.
- Operational reporting and performance analysis.

### Database architecture

The project adopts a hybrid database approach.

| Database technology  | Intended purpose                                          |
| -------------------- | --------------------------------------------------------- |
| Microsoft SQL Server | Core transactional and relational data                    |
| MongoDB              | Flexible driver-location documents and geospatial queries |
| MongoDB Atlas        | Managed cloud database deployment                         |

**Implementation note:** SQL Server and MongoDB were used for practical implementation. MongoDB Atlas was also configured and tested.

---

# 3. Technologies and Tools Used

| Technology             | Application                                              |
| ---------------------- | -------------------------------------------------------- |
| Microsoft SQL Server   | Relational database implementation                       |
| SQL                    | Database creation, queries, constraints and transactions |
| Visual Studio Code     | Development environment                                  |
| Python                 | Synthetic data generation and preparation                |
| MongoDB                | NoSQL database implementation                            |
| MongoDB Atlas          | Cloud database deployment                                |
| MongoDB Query Language | CRUD operations and geospatial queries                   |
| GitHub                 | Project version control and documentation                |
| Markdown               | Technical documentation                                  |

---

# 4. Project Structure

The repository is organised into folders corresponding to the five practical portfolios.

```text
SwiftRide-Advanced-Database-Systems/
│
├── README.md
│
├── Portfolio_1_Relational_Database_Design/
│   ├── SQL_Scripts
│   ├── ER_Diagrams
│   ├── Data
│   ├── Screenshots
│   └── README.md
│
├── Portfolio_2_Query_Processing_Optimisation/
│   ├── SQL_Scripts
│   ├── Execution_Plans
│   ├── Performance_Results
│   ├── Screenshots
│   └── README.md
│
├── Portfolio_3_Transactions_Concurrency/
│   ├── SQL_Scripts
│   ├── Transaction_Tests
│   ├── Screenshots
│   └── README.md
│
├── Portfolio_4_NoSQL_Advanced_Models/
│   ├── MongoDB_Queries
│   ├── Screenshots
│   └── README.md
│
├── Portfolio_5_Distributed_Cloud_Databases/
│   ├── Atlas_Configuration
│   ├── Cloud_Queries
│   ├── Screenshots
│   └── README.md
│
└── Final_Report/
    ├── Project_Summary.docx
    └── Project_Summary.pdf

```

_The structure above is the recommended repository layout. Folder and file names should be aligned with the actual files uploaded to GitHub._

---

# 5. How to Navigate the Project

This section explains how to explore the repository and understand the practical work completed.

## Step 1: Start with the Main README

Open the root `README.md` file.

It provides:

- An introduction to the project.
- The simulated organisation and its business requirements.
- The technologies used.
- The five portfolio components.
- Instructions for navigating the repository.

## Step 2: Explore Portfolio 1 – Relational Database Design

Navigate to:

`Portfolio_1_Relational_Database_Design/`

This section demonstrates the design and implementation of the core SwiftRide relational database using Microsoft SQL Server.

Key areas to examine:

- Entity–Relationship Diagram (ERD).
- Relational database schema.
- Primary and foreign keys.
- Data integrity constraints.
- Normalisation.
- SQL table creation scripts.
- Synthetic data.

The database includes entities such as PASSENGER, DRIVER, VEHICLE, RIDE, PAYMENT and RATING.

**What this demonstrates:** The ability to translate business requirements into a structured relational database while maintaining data integrity and reducing unnecessary duplication.

## Step 3: Explore Portfolio 2 – Query Processing and Optimisation

Navigate to:

`Portfolio_2_Query_Processing_Optimisation/`

This section investigates SQL query performance and the role of indexes in improving database retrieval.

Key evidence includes:

- SQL query scripts.
- Index definitions.
- Execution plans.
- Logical reads.
- CPU execution time.
- Elapsed execution time.

### Recorded performance results

| Performance metric | Initial result | Later result |
| ------------------ | -------------: | -----------: |
| Logical reads      |             14 |            3 |
| CPU time           |          32 ms |        15 ms |
| Elapsed time       |          52 ms |        15 ms |

These measurements were recorded during query testing. Because the indexes already existed before the measurements, the results should be interpreted as observed performance differences rather than a controlled measurement of the effect of creating an index.

**What this demonstrates:** Understanding of indexing, execution plans and the use of performance measurements to evaluate SQL queries.

## Step 4: Explore Portfolio 3 – Transactions and Concurrency

Navigate to:

`Portfolio_3_Transactions_Concurrency/`

This section explores how SQL Server handles database transactions and protects data integrity.

Topics covered include:

- Transaction management.
- COMMIT and ROLLBACK.
- ACID properties.
- Constraints and transaction validation.
- Isolation levels.
- Locking mechanisms.
- Concurrency considerations.

The practical work includes transaction tests involving ride completion and payment records.

**What this demonstrates:** Understanding of how transactional operations maintain consistency when multiple database operations must succeed or fail together.

## Step 5: Explore Portfolio 4 – NoSQL and Advanced Data Models

Navigate to:

`Portfolio_4_NoSQL_Advanced_Models/`

This section demonstrates the use of MongoDB for flexible and location-based data.

The practical implementation includes:

- MongoDB database creation.
- Document and collection creation.
- CRUD operations.
- GeoJSON location documents.
- 2dsphere indexing.
- Geospatial queries using `$near`.

The `DriverLocations` collection stores driver information, vehicle registration details, availability and geographical coordinates.

The portfolio also discusses the suitability of different NoSQL models, including:

- Document databases.
- Key-value databases.
- Column-family databases.
- Graph databases.

**What this demonstrates:** The ability to identify situations where flexible document structures and geospatial capabilities offer advantages over a purely relational approach.

## Step 6: Explore Portfolio 5 – Distributed and Cloud Databases

Navigate to:

`Portfolio_5_Distributed_Cloud_Databases/`

This section explores the deployment and management of database services in a cloud environment.

MongoDB Atlas was used to create the `SwiftRideCluster` deployment.

The practical work includes:

- Creating a MongoDB Atlas cluster.
- Connecting Visual Studio Code to the cloud database.
- Creating the `SwiftRideCloud` database.
- Creating the `DriverLocations` collection.
- Inserting and retrieving cloud documents.
- Updating records.
- Testing majority write concern.
- Testing majority read concern.
- Examining the replica-set architecture.

The Atlas cluster overview showed a three-node replica set.

Sharding and automatic failover were discussed conceptually but were not implemented or independently tested as part of this project.

**What this demonstrates:** Understanding of cloud database deployment, replication architecture, consistency settings and distributed database concepts.

## Step 7: Review the Final Report

Navigate to:

`Final_Report/`

This folder contains the consolidated project summary and individual reflection.

It brings together the five portfolios, the key findings, technical evidence, limitations and lessons learned.

## Step 8: Review the References

Navigate to:

`References/`

This folder contains the academic and technical sources used to support the database design decisions, implementation methods and theoretical discussions.

---

# 6. Implementation Summary

| Portfolio             | Main activity                                 | Technology            | Status      |
| --------------------- | --------------------------------------------- | --------------------- | ----------- |
| Portfolio 1           | Relational database design and implementation | SQL Server            | Implemented |
| Portfolio 2           | Query processing and optimisation             | SQL Server            | Implemented |
| Portfolio 3           | Transactions and concurrency testing          | SQL Server            | Implemented |
| Portfolio 4           | NoSQL document storage and geospatial queries | MongoDB               | Implemented |
| Portfolio 5           | Cloud deployment and consistency testing      | MongoDB Atlas         | Implemented |
| Extended architecture | Redis, Cassandra and Neo4j                    | Conceptual evaluation | Discussed   |

---

# 7. How to Reproduce the Project

The following steps provide a general guide for reproducing the practical work.

### Requirements

Install or obtain access to:

1. Microsoft SQL Server.
2. Visual Studio Code.
3. An SQL Server extension for Visual Studio Code.
4. Python 3.
5. MongoDB or MongoDB Atlas.
6. The MongoDB extension for Visual Studio Code.

### Relational database setup

1. Open the SQL Server connection in Visual Studio Code.
2. Open the SQL scripts in Portfolio 1.
3. Execute the database creation and table scripts.
4. Import or generate the synthetic data.
5. Verify the tables and relationships.
6. Proceed to the query and transaction scripts in Portfolios 2 and 3.

### MongoDB local setup

1. Open the MongoDB connection in Visual Studio Code.
2. Create the `SwiftRideNoSQL` database.
3. Create the `DriverLocations` collection.
4. Insert the sample driver-location documents.
5. Execute the CRUD and geospatial queries.

### MongoDB Atlas setup

1. Sign in to MongoDB Atlas.
2. Open the `SwiftRideCluster` deployment.
3. Confirm the database user and network access configuration.
4. Connect through the MongoDB connection string.
5. Open the `SwiftRideCloud` database.
6. Inspect the `DriverLocations` collection.
7. Execute the cloud read and write tests.

**Important:** Database credentials and connection strings containing passwords must not be uploaded to GitHub. Use environment variables or a locally stored configuration file excluded through `.gitignore`.

---

# 8. Key Learning Outcomes

The project provided practical experience in:

- Designing relational database structures.
- Applying normalisation principles.
- Implementing primary and foreign key relationships.
- Using SQL queries to retrieve and manipulate data.
- Evaluating query performance.
- Understanding database indexes and execution plans.
- Applying transaction management and concurrency concepts.
- Working with NoSQL document databases.
- Implementing geospatial data structures and queries.
- Deploying a database to a managed cloud platform.
- Exploring replication and consistency in distributed databases.
- Evaluating different database models against business requirements.

---

# 9. Project Limitations and Future Improvements

Although the project demonstrates several database technologies, some areas could be developed further.

Potential improvements include:

1. Implementing Redis for session management and temporary application data.
2. Implementing Cassandra for large-scale driver GPS history.
3. Developing a Neo4j graph model for passenger, driver and trip relationships.
4. Configuring and testing MongoDB sharding.
5. Conducting a controlled database failover test.
6. Comparing SQL Server and MongoDB performance using larger datasets.
7. Developing an application interface connected to the databases.
8. Implementing automated backups, monitoring and recovery procedures.
9. Introducing role-based access control and more comprehensive security testing.

These improvements would move the project closer to a production-ready ride-hailing database architecture.

---

# 10. Individual Reflection

Working on the SwiftRide Nigeria database project strengthened my understanding of how database technologies are selected, designed and implemented to solve practical business problems.

One of the most valuable aspects of the project was moving beyond theoretical database concepts into practical implementation. Building the relational database helped me understand how business requirements translate into entities, relationships, constraints and structured data.

The query optimisation exercise also demonstrated the importance of evaluating database performance rather than assuming that a query is efficient simply because it executes successfully.

Working with transactions highlighted the importance of data integrity, particularly where ride completion and payment processing are concerned. The NoSQL portfolio introduced me to the flexibility of document-based storage and the usefulness of geospatial queries for applications involving real-time location information.

Finally, deploying MongoDB through Atlas provided practical exposure to cloud database environments, replica-set architecture and consistency settings.

Overall, the project improved my confidence in working across relational, NoSQL and cloud database technologies. It also reinforced the importance of selecting database solutions based on the nature of the data, application requirements and expected workload.

---

# 11. References

Bernstein, P. A., Hadzilacos, V., & Goodman, N. (1987). _Concurrency control and recovery in database systems_. Addison-Wesley.

Brewer, E. A. (2012). CAP twelve years later: How the “rules” have changed. _Computer, 45_(2), 23–29. https://doi.org/10.1109/MC.2012.37

Elmasri, R., & Navathe, S. B. (2016). _Fundamentals of database systems_ (7th ed.). Pearson.

Gray, J., & Reuter, A. (1993). _Transaction processing: Concepts and techniques_. Morgan Kaufmann.

Kleppmann, M. (2017). _Designing data-intensive applications: The big ideas behind reliable, scalable, and maintainable systems_. O'Reilly Media.

Microsoft. (n.d.). _SQL Server index architecture and design guide_. Microsoft Learn.

Microsoft. (n.d.). _Display and save execution plans_. Microsoft Learn.

Microsoft. (n.d.). _Transaction locking and row versioning guide_. Microsoft Learn.

MongoDB. (n.d.). _MongoDB manual: Data modeling_. MongoDB Documentation.

MongoDB. (n.d.). _Geospatial queries_. MongoDB Documentation.

MongoDB. (n.d.). _Replication_. MongoDB Documentation.

MongoDB. (n.d.). _Read concern_. MongoDB Documentation.

MongoDB. (n.d.). _Write concern_. MongoDB Documentation.

MongoDB. (n.d.). _Sharding_. MongoDB Documentation.

MongoDB. (n.d.). _MongoDB Atlas documentation_. MongoDB Documentation.

Sadalage, P. J., & Fowler, M. (2013). _NoSQL distilled: A brief guide to the emerging world of polyglot persistence_. Addison-Wesley.

Silberschatz, A., Korth, H. F., & Sudarshan, S. (2019). _Database system concepts_ (7th ed.). McGraw-Hill.

---

# 12. AI Use Declaration

Generative AI tools were used as supplementary support during the development of this project. Their assistance included explaining database concepts, troubleshooting technical errors, supporting SQL and MongoDB query development, improving technical documentation and refining the project presentation.

The practical database implementation, execution of queries, testing, interpretation of results and final review of the submitted work were undertaken by the student.

AI-generated suggestions were reviewed and adapted to reflect the actual implementation and evidence produced during the project.

---

# 13. Conclusion

The SwiftRide Nigeria project demonstrates how relational, NoSQL and cloud database technologies can be combined to support the operational requirements of a simulated ride-hailing organisation.

Through five practical portfolios, the project explored database design, query optimisation, transaction management, advanced data models and distributed cloud database concepts.

The outcome is a documented hybrid database solution that demonstrates both theoretical understanding and practical application of Advanced Database Systems.

**End of Project Documentation**
