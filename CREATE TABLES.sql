CREATE TABLE property_owner (
    OnwerId INT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE,
    Firstname VARCHAR(50),
    Lastname VARCHAR(50),
    City VARCHAR(50),
    PropertyAddress VARCHAR(50),
    PhoneNumber VARCHAR(16) UNIQUE);

CREATE TABLE tenant (
    TenantId INT PRIMARY KEY,
    Email VARCHAR(254) UNIQUE,
    Firstname VARCHAR(100),
    Lastname VARCHAR(100),
    City VARCHAR(50),
    TenantAddress VARCHAR(256),
    PhoneNumber VARCHAR(16) UNIQUE);
    
CREATE TABLE property (
    PropertyId INT PRIMARY KEY,
    OnwerId INT,
    RoomCount INT,
    FloorNumber INT,
    HasWifi VARCHAR(1),
    HasGarden VARCHAR(1),
    HasBalcony VARCHAR(1),
    FOREIGN KEY(OnwerId) REFERENCES property_owner(OnwerId) ON DELETE CASCADE);

CREATE TABLE lease_agreement (
    leaseId INT PRIMARY KEY,
    OnwerId INT,
    TenantId INT,
    PropertyId INT,
    Description VARCHAR(1024),
    Price INT,
    AgreementStartDate DATE,
    AgreementStopDate DATE,
    FOREIGN KEY(OnwerId) REFERENCES property_owner(OnwerId) ON DELETE CASCADE,
    FOREIGN KEY(TenantId) REFERENCES tenant(TenantId) ON DELETE CASCADE,
    FOREIGN KEY(PropertyId) REFERENCES property(PropertyId) ON DELETE CASCADE);

CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY,
    Amount INT,
    OnwerId INT,
    TenantId INT,
    TransactionDate DATE,
    TransactionNumber VARCHAR(50),
    FOREIGN KEY(OnwerId) REFERENCES property_owner(OnwerId) ON DELETE CASCADE,
    FOREIGN KEY(TenantId) REFERENCES tenant(TenantId) ON DELETE CASCADE);