CREATE DATABASE swiftrideDB

use swiftrideDB

GO 
CREATE TABLE dbo.PASSENGER 
( PassengerID INT NOT NULL, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
Email VARCHAR(150) NOT NULL, 
PhoneNumber VARCHAR(25) NOT NULL, 
RegistrationDate DATETIME2(0) NOT NULL, 
AccountStatus VARCHAR(20) NOT NULL, 
CONSTRAINT PK_PASSENGER PRIMARY KEY (PassengerID), 
CONSTRAINT UQ_PASSENGER_Email UNIQUE (Email), 
CONSTRAINT UQ_PASSENGER_Phone UNIQUE (PhoneNumber), 
CONSTRAINT CK_PASSENGER_Status
CHECK (AccountStatus IN ('Active', 'Suspended', 'Inactive')) ); 
GO

CREATE TABLE dbo.DRIVER
(
    DriverID         INT           NOT NULL,
    FirstName        VARCHAR(50)   NOT NULL,
    LastName         VARCHAR(50)   NOT NULL,
    Email            VARCHAR(150)  NOT NULL,
    PhoneNumber      VARCHAR(25)   NOT NULL,
    LicenceNumber    VARCHAR(30)   NOT NULL,
    RegistrationDate DATETIME2(0)  NOT NULL,
    DriverStatus     VARCHAR(20)   NOT NULL,

    CONSTRAINT PK_DRIVER
        PRIMARY KEY (DriverID),

    CONSTRAINT UQ_DRIVER_Email
        UNIQUE (Email),

    CONSTRAINT UQ_DRIVER_Phone
        UNIQUE (PhoneNumber),

    CONSTRAINT UQ_DRIVER_Licence
        UNIQUE (LicenceNumber),

    CONSTRAINT CK_DRIVER_Status
        CHECK (DriverStatus IN
        ('Available', 'Busy', 'Offline', 'Suspended'))
);
GO

CREATE TABLE dbo.VEHICLE
(
    VehicleID         INT          NOT NULL,
    RegistrationNumber VARCHAR(30) NOT NULL,
    Make              VARCHAR(50) NOT NULL,
    Model             VARCHAR(50) NOT NULL,
    ModelYear         SMALLINT     NOT NULL,
    Colour            VARCHAR(30) NOT NULL,
    VehicleStatus     VARCHAR(20) NOT NULL,

    CONSTRAINT PK_VEHICLE
        PRIMARY KEY (VehicleID),

    CONSTRAINT UQ_VEHICLE_Registration
        UNIQUE (RegistrationNumber),

    CONSTRAINT CK_VEHICLE_Year
        CHECK (ModelYear BETWEEN 1990 AND 2035),

    CONSTRAINT CK_VEHICLE_Status
        CHECK (VehicleStatus IN
        ('Active', 'Maintenance', 'Inactive'))
);
GO


CREATE TABLE dbo.VEHICLE_ASSIGNMENT
(
    AssignmentID     INT          NOT NULL,
    DriverID         INT          NOT NULL,
    VehicleID        INT          NOT NULL,
    StartDateTime    DATETIME2(0) NOT NULL,
    EndDateTime      DATETIME2(0) NULL,
    AssignmentStatus VARCHAR(20)  NOT NULL,

    CONSTRAINT PK_VEHICLE_ASSIGNMENT
        PRIMARY KEY (AssignmentID),

    CONSTRAINT FK_ASSIGNMENT_DRIVER
        FOREIGN KEY (DriverID)
        REFERENCES dbo.DRIVER(DriverID),

    CONSTRAINT FK_ASSIGNMENT_VEHICLE
        FOREIGN KEY (VehicleID)
        REFERENCES dbo.VEHICLE(VehicleID),

    CONSTRAINT CK_ASSIGNMENT_Dates
        CHECK
        (
            EndDateTime IS NULL
            OR EndDateTime >= StartDateTime
        ),

    CONSTRAINT CK_ASSIGNMENT_Status
        CHECK (AssignmentStatus IN
        ('Active', 'Ended', 'Cancelled'))
);
GO

CREATE TABLE dbo.FARE_RULE
(
    FareRuleID        INT            NOT NULL,
    RuleName          VARCHAR(100)   NOT NULL,
    BaseFare          DECIMAL(12,2)  NOT NULL,
    RatePerKilometre  DECIMAL(12,2)  NOT NULL,
    MinimumFare       DECIMAL(12,2)  NOT NULL,
    EffectiveFrom     DATETIME2(0)   NOT NULL,
    EffectiveTo       DATETIME2(0)   NULL,
    RuleStatus        VARCHAR(20)    NOT NULL,

    CONSTRAINT PK_FARE_RULE
        PRIMARY KEY (FareRuleID),

    CONSTRAINT CK_FARE_RULE_BaseFare
        CHECK (BaseFare >= 0),

    CONSTRAINT CK_FARE_RULE_Rate
        CHECK (RatePerKilometre >= 0),

    CONSTRAINT CK_FARE_RULE_MinimumFare
        CHECK (MinimumFare >= 0),

    CONSTRAINT CK_FARE_RULE_Dates
        CHECK
        (
            EffectiveTo IS NULL
            OR EffectiveTo > EffectiveFrom
        ),

    CONSTRAINT CK_FARE_RULE_Status
        CHECK (RuleStatus IN
        ('Active', 'Historical', 'Inactive'))
);
GO

CREATE TABLE dbo.RIDE
(
    RideID              INT            NOT NULL,
    PassengerID         INT            NOT NULL,
    DriverID            INT            NULL,
    FareRuleID          INT            NOT NULL,
    RequestDateTime     DATETIME2(0)   NOT NULL,
    PickupLocation      VARCHAR(200)   NOT NULL,
    Destination         VARCHAR(200)   NOT NULL,
    DistanceKilometres  DECIMAL(10,2)  NOT NULL,
    EstimatedFare       DECIMAL(12,2)  NOT NULL,
    FinalFare           DECIMAL(12,2)  NULL,
    RideStatus          VARCHAR(20)    NOT NULL,
    StartDateTime       DATETIME2(0)   NULL,
    EndDateTime         DATETIME2(0)   NULL,

    CONSTRAINT PK_RIDE
        PRIMARY KEY (RideID),

    CONSTRAINT FK_RIDE_PASSENGER
        FOREIGN KEY (PassengerID)
        REFERENCES dbo.PASSENGER(PassengerID),

    CONSTRAINT FK_RIDE_DRIVER
        FOREIGN KEY (DriverID)
        REFERENCES dbo.DRIVER(DriverID),

    CONSTRAINT FK_RIDE_FARE_RULE
        FOREIGN KEY (FareRuleID)
        REFERENCES dbo.FARE_RULE(FareRuleID),

    CONSTRAINT CK_RIDE_Distance
        CHECK (DistanceKilometres > 0),

    CONSTRAINT CK_RIDE_EstimatedFare
        CHECK (EstimatedFare >= 0),

    CONSTRAINT CK_RIDE_FinalFare
        CHECK (FinalFare IS NULL OR FinalFare >= 0),

    CONSTRAINT CK_RIDE_Status
        CHECK (RideStatus IN
        ('Requested', 'Assigned', 'In Progress',
         'Completed', 'Cancelled')),

    CONSTRAINT CK_RIDE_Timestamps
        CHECK
        (
            (StartDateTime IS NULL OR
             StartDateTime >= RequestDateTime)
            AND
            (EndDateTime IS NULL OR
             (
                 StartDateTime IS NOT NULL
                 AND EndDateTime >= StartDateTime
             ))
        ),

    CONSTRAINT CK_RIDE_Completion
        CHECK
        (
            RideStatus <> 'Completed'
            OR
            (
                DriverID IS NOT NULL
                AND StartDateTime IS NOT NULL
                AND EndDateTime IS NOT NULL
                AND FinalFare IS NOT NULL
            )
        )
);
GO


CREATE TABLE dbo.PAYMENT
(
    PaymentID            INT            NOT NULL,
    RideID               INT            NOT NULL,
    PaymentDateTime      DATETIME2(0)   NOT NULL,
    Amount               DECIMAL(12,2)  NOT NULL,
    PaymentMethod        VARCHAR(20)    NOT NULL,
    PaymentStatus        VARCHAR(20)    NOT NULL,
    TransactionReference VARCHAR(50)    NOT NULL,

    CONSTRAINT PK_PAYMENT
        PRIMARY KEY (PaymentID),

    CONSTRAINT FK_PAYMENT_RIDE
        FOREIGN KEY (RideID)
        REFERENCES dbo.RIDE(RideID),

    CONSTRAINT UQ_PAYMENT_TransactionReference
        UNIQUE (TransactionReference),

    CONSTRAINT CK_PAYMENT_Amount
        CHECK (Amount >= 0),

    CONSTRAINT CK_PAYMENT_Method
        CHECK (PaymentMethod IN
        ('Card', 'Transfer', 'Wallet', 'Cash')),

    CONSTRAINT CK_PAYMENT_Status
        CHECK (PaymentStatus IN
        ('Successful', 'Failed', 'Pending', 'Refunded'))
);
GO


CREATE TABLE dbo.RATING
(
    RatingID       INT           NOT NULL,
    RideID         INT           NOT NULL,
    RatingScore    TINYINT       NOT NULL,
    Comments       VARCHAR(500)  NULL,
    RatingDateTime DATETIME2(0)  NOT NULL,

    CONSTRAINT PK_RATING
        PRIMARY KEY (RatingID),

    CONSTRAINT FK_RATING_RIDE
        FOREIGN KEY (RideID)
        REFERENCES dbo.RIDE(RideID),

    CONSTRAINT UQ_RATING_Ride
        UNIQUE (RideID),

    CONSTRAINT CK_RATING_Score
        CHECK (RatingScore BETWEEN 1 AND 5)
);
GO


CREATE TABLE dbo.DRIVER_LOCATION
(
    LocationID       INT           NOT NULL,
    DriverID         INT           NOT NULL,
    Latitude         DECIMAL(10,7) NOT NULL,
    Longitude        DECIMAL(10,7) NOT NULL,
    RecordedDateTime DATETIME2(0)  NOT NULL,

    CONSTRAINT PK_DRIVER_LOCATION
        PRIMARY KEY (LocationID),

    CONSTRAINT FK_LOCATION_DRIVER
        FOREIGN KEY (DriverID)
        REFERENCES dbo.DRIVER(DriverID),

    CONSTRAINT CK_LOCATION_Latitude
        CHECK (Latitude BETWEEN -90 AND 90),

    CONSTRAINT CK_LOCATION_Longitude
        CHECK (Longitude BETWEEN -180 AND 180)
);
GO