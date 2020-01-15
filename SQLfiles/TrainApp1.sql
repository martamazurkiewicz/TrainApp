CREATE TABLE owners
(   
    ownerID INTEGER PRIMARY KEY NOT NULL,
    name    VARCHAR(50) NOT NULL
    --relation many to many with stations
);
CREATE TABLE trainTypes
(   
    trainTypeID INTEGER PRIMARY KEY NOT NULL,
    name    VARCHAR(25) NOT NULL
);
CREATE TABLE stations
(   
    stationID   INTEGER PRIMARY KEY NOT NULL,
    name    VARCHAR(40) NOT NULL,
    --relations one to many with platforms
    city INTEGER REFERENCES cities(cityID)
);
CREATE TABLE cities
(   
    cityID  INTEGER PRIMARY KEY NOT NULL,
    name    VARCHAR(30) NOT NULL
);
CREATE TABLE models
(   
    modelID INTEGER PRIMARY KEY NOT NULL,
    name    VARCHAR(50) NOT NULL
);
CREATE TABLE trains
(
    trainID INTEGER PRIMARY KEY NOT NULL,
    name    VARCHAR(25) UNIQUE  NOT NULL,
    "S\N"   VARCHAR(50) UNIQUE  NOT NULL,
    model   INTEGER REFERENCES models(modelID),
    owner INTEGER REFERENCES owners(ownerID),
    trainType   INTEGER REFERENCES trainTypes(trainTypeID),
    domesticStation    INTEGER REFERENCES stations(stationID),
    finishStation   INTEGER REFERENCES stations(stationID),
    numberOfCompartments INTEGER,
    capasity   INTEGER,
    sleepCompartments  CHAR(1), 
    firtsClassDCompartmens   CHAR(1), 
    bikeCompartment   CHAR(1),
    bikeCapasity   INTEGER
);
CREATE TABLE ownersstations
(   
    ownerID INTEGER REFERENCES owners(ownerID),
    stationID INTEGER REFERENCES stations(stationID),
    PRIMARY KEY (ownerID, stationID)
);