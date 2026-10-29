use swiftrideDB

CREATE INDEX IX_RIDE_Passenger_RequestDate
ON dbo.RIDE(PassengerID, RequestDateTime DESC);
GO

/* Driver ride history */
CREATE INDEX IX_RIDE_Driver_RequestDate
ON dbo.RIDE(DriverID, RequestDateTime DESC)
WHERE DriverID IS NOT NULL;
GO

/* Analyse completed rides */
CREATE INDEX IX_RIDE_Status_RequestDate
ON dbo.RIDE(RideStatus, RequestDateTime);
GO

/* Payment analysis by ride */
CREATE INDEX IX_PAYMENT_Ride_Status
ON dbo.PAYMENT(RideID, PaymentStatus);
GO

/* Retrieve a driver's latest locations */
CREATE INDEX IX_LOCATION_Driver_Time
ON dbo.DRIVER_LOCATION(DriverID, RecordedDateTime DESC);
GO

/* Vehicle assignment history */
CREATE INDEX IX_ASSIGNMENT_Driver_Start
ON dbo.VEHICLE_ASSIGNMENT(DriverID, StartDateTime DESC);
GO