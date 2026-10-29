select * from PASSENGER
select * from DRIVER
select * from VEHICLE
select * from VEHICLE_ASSIGNMENT
select * from FARE_RULE
select * from RIDE
select * from PAYMENT
select * from RATING
select * from DRIVER_LOCATION

GO

SELECT 'PASSENGER' AS TableName, COUNT_BIG(*) AS TotalRecords
FROM dbo.PASSENGER

UNION ALL

SELECT 'DRIVER', COUNT_BIG(*)
FROM dbo.DRIVER

UNION ALL

SELECT 'VEHICLE', COUNT_BIG(*)
FROM dbo.VEHICLE

UNION ALL

SELECT 'VEHICLE_ASSIGNMENT', COUNT_BIG(*)
FROM dbo.VEHICLE_ASSIGNMENT

UNION ALL

SELECT 'FARE_RULE', COUNT_BIG(*)
FROM dbo.FARE_RULE

UNION ALL

SELECT 'RIDE', COUNT_BIG(*)
FROM dbo.RIDE

UNION ALL

SELECT 'PAYMENT', COUNT_BIG(*)
FROM dbo.PAYMENT

UNION ALL

SELECT 'RATING', COUNT_BIG(*)
FROM dbo.RATING

UNION ALL

SELECT 'DRIVER_LOCATION', COUNT_BIG(*)
FROM dbo.DRIVER_LOCATION;
GO

USE swiftrideDB;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT
    RideID,
    PassengerID,
    DriverID,
    RequestDateTime,
    DistanceKilometres,
    FinalFare,
    RideStatus
FROM dbo.RIDE
WHERE PassengerID = 1
  AND RideStatus = 'Completed'
  AND RequestDateTime >= '2026-01-01'
  AND RequestDateTime < '2026-04-01'
ORDER BY RequestDateTime DESC;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

EXEC sys.sp_helpindex 'dbo.RIDE'


GO

CREATE NONCLUSTERED INDEX IX_RIDE_Passenger_Status_RequestDate
ON dbo.RIDE
(
    PassengerID,
    RideStatus,
    RequestDateTime DESC
)
INCLUDE
(
    DriverID,
    DistanceKilometres,
    FinalFare
);
GO