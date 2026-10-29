USE SwiftRideDB;
GO

BULK INSERT dbo.PASSENGER
FROM 'dataset\passenger.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.DRIVER
FROM 'dataset\driver.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.VEHICLE_ASSIGNMENT
FROM 'dataset\vehicle_assignment.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.VEHICLE
FROM 'dataset\vehicle.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.FARE_RULE
FROM 'dataset\fare_rule.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.RIDE
FROM 'dataset\ride.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.PAYMENT
FROM 'dataset\payment.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO

GO

BULK INSERT dbo.DRIVER_LOCATION
FROM 'dataset\driver_location.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO