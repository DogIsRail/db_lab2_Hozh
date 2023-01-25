INSERT INTO INCIDENT(incident_id, date, quarter, school, city, state, school_level)
VALUES
    ('20220601CAULL', DATE('2022/6/1'), 'Summer', 'Ulysses S. Grant Senior High School', 'Los Angeles', 'CA', 'High'),
    ('20220531LAMON', DATE('2022/5/31'),'Spring','Morris Jeff High School','New Orleans','LA', 'High'),
    ('20220530CAHEL', DATE('2022/5/30'),'Spring','Helix High School','La Mesa','CA', 'High'),
    ('20220529ILDAC', DATE('2022/5/29'),'Spring','Daniel Webster Public School','Chicago','IL', 'Elementary'),
    ('20220526SCMEG', DATE('2022/5/26'),'Spring','Mevers School of Excellence','Goose Creek','SC', 'K8'),
    ('20220526TXDUA', DATE('2022/5/26'),'Spring','Duff Elementary School','Arlington','TX', 'Elementary');

INSERT INTO shooter(incidentid, age, gender, race, schoolaffilation, shooteroutcome, shooterdied, injury, chargesfield, verdict)
VALUES
    ('20220601CAULL', null, 'Male', null, null, 'Fled/Escaped', 'No', 'None', null, null),
    ('20220531LAMON', null, null, null, null, 'Fled/Escaped', 'No', 'None', null, null),
    ('20220530CAHEL', 'Adult', 'Male', null, 'No Relation', 'Fled/Escaped', 'No', 'None', null, null),
    ('20220529ILDAC', null, null, null, null, 'Fled/Escaped', 'No', 'None', null, null),
    ('20220529ILDAC', null, null, null, null, 'Fled/Escaped', 'No', 'None', null, null),
    ('20220529ILDAC', null, null, null, null, 'Fled/Escaped', 'No', 'None', null, null),
    ('20220526SCMEG', null, null, null, null, 'Fled/Escaped', 'No', 'None', null, null),
    ('20220526TXDUA', 55, 'Male', 'White', 'Relative', 'Surrendered', 'No', 'Wounded', 'Carrying weapon in prohibited place', null);

INSERT INTO victim(incidentid, race, injury, gender, schoolaffilation, age)
VALUES
    ('20220601CAULL', null, 'Wounded', 'Male', 'Student', 16),
    ('20220531LAMON', 'Black', 'Fatal', 'Female', 'Relative', 80),
    ('20220531LAMON', null, 'Wounded', 'Male', 'Relative', 'Adult'),
    ('20220531LAMON', null, 'Wounded', 'Male', 'Relative', 'Adult'),
    ('20220530CAHEL', null, 'Wounded', 'Male', 'No Relation', 20),
    ('20220529ILDAC', null, 'Wounded', 'Female', null, 16),
    ('20220529ILDAC', null, 'Wounded', 'Male', null, 33),
    ('20220529ILDAC', null, 'Wounded', 'Male', null, 21),
    ('20220529ILDAC', null, 'Wounded', 'Male', null, 21),
    ('20220529ILDAC', null, 'Wounded', 'Female', null, 21),
    ('20220526SCMEG', null, 'Fatal', 'Male', 'No Relation', 31);

INSERT INTO weapon(incidentid, weaponcaliber, weapondetails, weapontype)
VALUES
    ('20220601CAULL', null, null, 'Handgun'),
    ('20220531LAMON', null, null, 'Handgun'),
    ('20220530CAHEL', null, null, 'Handgun'),
    ('20220529ILDAC', null, null, 'Rifle'),
    ('20220529ILDAC', null, null, 'Handgun'),
    ('20220526SCMEG', null, null, null),
    ('20220526TXDUA', null, null, 'Handgun');
