CREATE TABLE INCIDENT
(
  Incident_ID       char(13)  NOT NULL,
  Date              date      NULL,
  Quarter           char(50)  NULL,
  School            char(50)  NULL,
  City              char(100) NULL,
  State             char(2)   NULL,
  School_Level      char(50)  NOT NULL
);

CREATE TABLE SHOOTER
(
  incidentid        char(13) NOT NULL ,
  age               char(50) NULL ,
  gender            char(50) NULL ,
  race              char(50) NULL ,
  schoolaffilation  char(50) NULL,
  shooteroutcome    char(50) NULL,
  shooterdied       char(3)  NULL,
  injury            char(50) NULL,
  chargesfield      text     NULL,
  verdict           text     NULL
);

CREATE TABLE VICTIM
(
  incidentid        char(13) NOT NULL ,
  race              char(50) NULL ,
  injury            char(50) NULL ,
  gender            char(50) NULL ,
  schoolaffilation  char(50) NULL,
  age char(50) NULL
);

CREATE TABLE WEAPON
(
  incidentid        char(13) NOT NULL ,
  weaponcaliber     char(50) NULL ,
  weapondetails     text     NULL ,
  weapontype        char(50) NULL
);

ALTER TABLE INCIDENT ADD PRIMARY KEY (Incident_ID);
ALTER TABLE SHOOTER ADD CONSTRAINT shooter_incident FOREIGN KEY (incidentid) REFERENCES incident (Incident_ID);
ALTER TABLE VICTIM ADD CONSTRAINT victim_incident FOREIGN KEY (incidentid) REFERENCES incident (Incident_ID);
ALTER TABLE WEAPON ADD CONSTRAINT weapon_incident FOREIGN KEY (incidentid) REFERENCES incident (Incident_ID);