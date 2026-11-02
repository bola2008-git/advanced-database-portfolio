use swiftrideDB

-- COMMIT — Saving a Successful Transaction
-- Scenario: A passenger completes a ride, and the system records the payment. 
-- Both operations should be saved together.


BEGIN TRY
    BEGIN TRANSACTION;

    -- Update the ride
    UPDATE dbo.RIDE
    SET RideStatus = 'Completed',
        StartDateTime = '2026-04-15T19:20:00',
        EndDateTime = '2026-04-15T19:50:00',
        FinalFare = 5000
    WHERE RideID = 17;

    -- Insert payment
    INSERT INTO dbo.PAYMENT
    (
        PaymentID,
        RideID,
        PaymentDateTime,
        Amount,
        PaymentMethod,
        PaymentStatus,
        TransactionReference
    )
    VALUES
    (
        45738,
        17,
        '2026-04-15T19:50:00',
        5000,
        'Card',
        'Successful',
        'SWIFT-TEST-45738'
    );

    COMMIT TRANSACTION;

    PRINT 'Transaction committed successfully.';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT ERROR_MESSAGE();
END CATCH;
GO

SELECT *
FROM dbo.RIDE
WHERE RideID = 17;

SELECT *
FROM dbo.PAYMENT
WHERE PaymentID = 45738;
GO

-- ROLLBACK Transaction
-- Scenario: SwiftRide mistakenly records an incorrect fare for Ride 17.
-- The system must reverse the change without permanently affecting the original record.


-- Check the original fare
SELECT RideID, FinalFare
FROM dbo.RIDE
WHERE RideID = 17;

BEGIN TRANSACTION;

-- Simulate an incorrect fare update
UPDATE dbo.RIDE
SET FinalFare = 999999
WHERE RideID = 17;

-- Display the temporary incorrect fare
SELECT RideID, FinalFare
FROM dbo.RIDE
WHERE RideID = 17;

-- Reverse the transaction
ROLLBACK TRANSACTION;

-- Confirm the original fare is restored
SELECT RideID, FinalFare
FROM dbo.RIDE
WHERE RideID = 17;
GO


-- Transaction Isolation – READ COMMITTED.
-- Scenario
-- SwiftRide needs to retrieve a passenger's payment information 
-- while ensuring that it does not read incomplete or uncommitted changes made by another process.


SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
GO

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
GO

-- Scenario

-- Imagine two SwiftRide administrators attempt to update the status of the same ride simultaneously. 
-- We need to prevent conflicting updates.

-- SQL Server provides locking mechanisms to coordinate access to shared records.\


GO

BEGIN TRANSACTION;

-- Request an update lock on Ride 17
SELECT
    RideID,
    RideStatus
FROM dbo.RIDE WITH (UPDLOCK)
WHERE RideID = 17;

-- Update the ride status
UPDATE dbo.RIDE
SET RideStatus = 'Completed'
WHERE RideID = 17;

-- Complete the transaction
COMMIT TRANSACTION;
GO