CREATE TABLE owners
(   
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    name VARCHAR(50) NOT NULL,
    --relation many to many with stations
    CONSTRAINT owners_pk PRIMARY KEY (ID)
);
CREATE TABLE train_types
(   
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    name VARCHAR(25) NOT NULL,
    CONSTRAINT train_types_pk PRIMARY KEY (ID)
);
CREATE TABLE cities
(   
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    name VARCHAR(30) NOT NULL,
    CONSTRAINT cities_pk PRIMARY KEY (ID)
);
CREATE TABLE stations
(   
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    name VARCHAR(40) NOT NULL,
    --relations one to many with platforms
    city INTEGER REFERENCES cities(ID),
    CONSTRAINT stations_pk PRIMARY KEY (ID)
);
CREATE TABLE train_models
(   
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    name VARCHAR(50) NOT NULL,
    CONSTRAINT train_models_pk PRIMARY KEY (ID)
);
CREATE TABLE trains
(
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    name VARCHAR(25) UNIQUE  NOT NULL,
    "S\N" VARCHAR(50) UNIQUE  NOT NULL,
    model INTEGER REFERENCES train_models(ID),
    owner INTEGER REFERENCES owners(ID),
    train_type INTEGER REFERENCES train_types(ID),
    --domestic_station    INTEGER REFERENCES stations(station_id),
    --finish_station   INTEGER REFERENCES stations(station_id),
    number_of_compartments INTEGER,
    capasity   INTEGER,
    sleep_compartments  CHAR(1), 
    firts_class_compartmens   CHAR(1), 
    bike_compartments   CHAR(1),
    bike_capasity   INTEGER,
    CONSTRAINT trains_pk PRIMARY KEY (ID)
);
CREATE TABLE stops
(
    train_id INTEGER REFERENCES trains(ID),
    station_id INTEGER REFERENCES stations(ID),
    --arrival time when departure time is 00:00
    time_needed_for_arrival_in_minutes INTEGER,
    time_of_halt_in_minutes INTEGER,
    CONSTRAINT ID PRIMARY KEY (train_id, station_id)
);
ALTER TABLE stops ADD stop_number_from_begin_station INTEGER NOT NULL;
CREATE TABLE departures
(
    ID NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    train_id INTEGER REFERENCES trains(ID), 
    departure_time TIMESTAMP,
    CONSTRAINT departures_pk PRIMARY KEY (ID)
);

