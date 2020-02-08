INSERT INTO owners(name) VALUES ('INTERCITY');
INSERT INTO owners(name) VALUES ('REGIONAL'); 

INSERT INTO train_types(name) VALUES ('passenger'); 
INSERT INTO train_types(name) VALUES ('cargo'); 

INSERT INTO cities(name) VALUES ('Warsaw'); 
INSERT INTO cities(name) VALUES ('Leba');
INSERT INTO cities(name) VALUES ('KOLOBRZEG');

INSERT INTO stations(name,city) VALUES ('Warszawa Gdanska',1);
INSERT INTO stations(name,city) VALUES ('Warszawa Centralna',1); 
INSERT INTO stations(name,city) VALUES ('Leba',2);
INSERT INTO stations(name,city) VALUES ('Kolobrzeg',3);

INSERT INTO train_models(name) VALUES ('IC InterCity');
INSERT INTO train_models(name) VALUES ('Express InterCity');
INSERT INTO train_models(name) VALUES ('Regio');
INSERT INTO train_models(name) VALUES ('TLK');

INSERT INTO trains(name,"S\N",model,owner,train_type,number_of_compartments,capasity,
    sleep_compartments,FIRTS_CLASS_COMPARTMENS,bike_compartments,bike_capasity) 
    VALUES ('Delfin','982nr56e/n',1,1,1,43,344,0,0,1,3); 
    
INSERT INTO trains(name,"S\N",model,owner,train_type,number_of_compartments,capasity,
    sleep_compartments,FIRTS_CLASS_COMPARTMENS,bike_compartments,bike_capasity) 
    VALUES ('Fregata','027nr85e/k',3,1,1,60,500,0,1,1,6); 

INSERT INTO stops VALUES (21,5,0,5,0);
INSERT INTO stops VALUES (21,6,12,3,1);
INSERT INTO stops VALUES (21,7,660,5,2);

INSERT INTO departures(train_id,departure_time) VALUES (21,CURRENT_TIMESTAMP);