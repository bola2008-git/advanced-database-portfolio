# SwiftRide Nigeria Database Project

## Portfolio 3: Transactions and Concurrency

### 1. Overview

This portfolio explores transaction management and concurrency control in the SwiftRide Nigeria ride-hailing database. The practical exercises demonstrate how SQL Server transactions help maintain data integrity when multiple database operations must be completed together.

The work was carried out using **Microsoft SQL Server** and **Visual Studio Code**.

### 2. Case Study

SwiftRide Nigeria is a simulated ride-hailing platform that connects passengers with drivers. Its database stores passenger details, driver information, ride bookings, vehicle assignments, fares, payments and ratings.

Ride completion and payment processing require related database operations to be handled reliably. Transaction management helps ensure that incomplete or invalid operations do not leave the database in an inconsistent state.

### 3. Objectives

The objectives of this portfolio are to:

* Demonstrate transaction processing using `BEGIN TRANSACTION`.
* Use `COMMIT` to save successful database changes.
* Use `ROLLBACK` to reverse uncommitted changes.
* Examine transaction isolation using `READ COMMITTED`.
* Explore concurrency control using SQL Server locking.
* Explain how transaction management supports database consistency and reliability.

### 4. Tools and Technologies

| Tool                             | Purpose                                     |
| -------------------------------- | ------------------------------------------- |
| Microsoft SQL Server             | Database management system                  |
| Visual Studio Code               | SQL development and execution               |
| SQL Server extension for VS Code | Database connection and query execution     |
| `BEGIN TRANSACTION`              | Starts a transaction                        |
| `COMMIT`                         | Permanently saves transaction changes       |
| `ROLLBACK`                       | Reverses uncommitted changes                |
| `READ COMMITTED`                 | Prevents dirty reads                        |
| `UPDLOCK`                        | Requests an update lock on selected records |

### 5. Transaction Commit

A simulated ride-completion transaction was designed to update a ride's status, start time, end time and final fare, and then insert a corresponding payment record.

The operations were grouped into a single transaction so that they could be committed together.

The transaction used:

```sql id="5y7n4k"
BEGIN TRANSACTION;

-- Update ride details
-- Insert corresponding payment

COMMIT TRANSACTION;
```

A successful commit makes the transaction's changes permanent. If an operation fails, the transaction should be rolled back to prevent partial changes.

**Evidence to include:** Screenshot of the transaction script and successful execution output. Confirm that the transaction actually completed successfully before describing it as committed.

### 6. Transaction Rollback

A rollback exercise was used to demonstrate how SQL Server reverses changes made within an uncommitted transaction.

The exercise temporarily changed a ride's final fare to an incorrect value and then rolled back the transaction.

```sql id="4x7gq1"
BEGIN TRANSACTION;

UPDATE dbo.RIDE
SET FinalFare = 999999
WHERE RideID = 17;

-- Inspect the temporary value
SELECT RideID, FinalFare
FROM dbo.RIDE
WHERE RideID = 17;

ROLLBACK TRANSACTION;

-- Verify the restored value
SELECT RideID, FinalFare
FROM dbo.RIDE
WHERE RideID = 17;
```

The expected outcome is that the temporary value is reversed and the original fare is restored.

**Evidence to include:** Screenshots showing the temporary value before rollback and the restored value after rollback.

7. Transaction Isolation: READ COMMITTED

The READ COMMITTED isolation level was used to examine how SQL Server controls access to data during transaction processing.

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

SELECT
    PaymentID,
    RideID,
    Amount,
    PaymentMethod,
    PaymentStatus
FROM dbo.PAYMENT
WHERE RideID = 17;

COMMIT TRANSACTION;

READ COMMITTED prevents a transaction from reading uncommitted changes made by another transaction. This helps prevent dirty reads when retrieving payment information.

Evidence to include: Screenshot of the isolation-level statement and query output.

8. Concurrency Control Using UPDLOCK

SQL Server's UPDLOCK hint was used to demonstrate how update locks can help coordinate concurrent access to a ride record.

BEGIN TRANSACTION;

SELECT RideID, RideStatus
FROM dbo.RIDE WITH (UPDLOCK)
WHERE RideID = 17;

-- Perform the required update
UPDATE dbo.RIDE
SET RideStatus = 'Completed'
WHERE RideID = 17;

COMMIT TRANSACTION;

The update lock helps reduce the risk of conflicting updates by other transactions while the transaction is in progress.

A full blocking demonstration requires two separate database sessions executing concurrently. The single-session exercise demonstrates the use of the lock hint but does not, by itself, prove that blocking occurred.

Evidence to include: Screenshot of the UPDLOCK query and its successful execution. If a two-session test was performed, include screenshots showing the blocking behaviour.

9. Summary of Practical Activities
Activity	SQL Server feature	Purpose
Save related ride and payment changes	COMMIT	Permanently save successful changes
Reverse an incorrect fare update	ROLLBACK	Restore the original database state
Retrieve payment information	READ COMMITTED	Prevent dirty reads
Coordinate access to a ride record	UPDLOCK	Help manage concurrent updates
10. Conclusion

This portfolio demonstrated the role of transaction management and concurrency control in maintaining database integrity within SwiftRide Nigeria.

The exercises explored how COMMIT saves successful changes, ROLLBACK reverses uncommitted changes, READ COMMITTED prevents dirty reads and UPDLOCK helps coordinate concurrent updates.

These mechanisms are important in a ride-hailing system because ride completion and payment processing involve related operations that must be handled consistently and reliably.

11. Project Environment
Case study: SwiftRide Nigeria
Database: Microsoft SQL Server
Development environment: Visual Studio Code
Portfolio: Transactions and Concurrency