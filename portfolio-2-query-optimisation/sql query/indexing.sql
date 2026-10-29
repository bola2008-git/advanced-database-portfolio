USE swiftrideDB

GO
CREATE UNIQUE INDEX UX_Assignment_ActiveDriver
ON dbo.VEHICLE_ASSIGNMENT(DriverID)
WHERE AssignmentStatus = 'Active';
GO

CREATE UNIQUE INDEX UX_Assignment_ActiveVehicle
ON dbo.VEHICLE_ASSIGNMENT(VehicleID)
WHERE AssignmentStatus = 'Active';
GO

CREATE UNIQUE INDEX UX_Payment_OneSuccessfulPerRide
ON dbo.PAYMENT(RideID)
WHERE PaymentStatus = 'Successful';
GO