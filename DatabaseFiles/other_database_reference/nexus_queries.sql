
DROP DATABASE IF EXISTS nexusDatabase;
CREATE DATABASE IF NOT EXISTS nexusDatabase;

use nexusDatabase;

CREATE TABLE Employee(

    EmployeeID       bigint         NOT NULL    AUTO_INCREMENT,
    FName            varchar(20)    NOT NULL,
    LName            varchar(20)    NOT NULL,
    HireDate         Date           NOT NULL,
    BirthDate        Date           NOT NULL,
    SSN              varchar(9)     NOT NULL,

    Primary Key(EmployeeID)
);

CREATE TABLE ZipCode (

    ZIP             int            	NOT NULL,
    CityName        varchar(20)    	NOT NULL,
    StateName       varchar(2)     	NOT NULL,

    Primary Key (ZIP)

);

CREATE TABLE Client(

    ClientID        bigint          NOT NULL    AUTO_INCREMENT,
    FName           varchar(20)     NOT NULL,
    LName           varchar(20)     NOT NULL,
    BillingAddress  varchar(40)     NOT NULL,
    ZIP             int             NOT NULL,

    Primary Key(ClientID),
    Foreign Key(ZIP) References ZipCode(ZIP)
);

CREATE TABLE Milestone(

    MilestoneName           varchar(20)     NOT NULL,
    MilestoneDescription    varchar(40)     NULL,

    Primary Key(MilestoneName)
);


CREATE TABLE PositionDescription(

    PositionTitleID  bigint          NOT NULL    AUTO_INCREMENT,
    PositionTitle    varchar(15)     NOT NULL,
    BaseSalary       int             NULL,
    BaseWage         decimal         NULL,
    Description      varchar(40)     NOT NULL,

    Primary Key (PositionTitleID)
);


CREATE TABLE Paycheck(

    PaycheckID        bigint          NOT NULL    AUTO_INCREMENT,
    PayPeriodStart    Date            NOT NULL,
    PayPeriodEnd      Date            NULL,
    CheckDate         Date            NULL,
    Hours             smallint        NULL,
    Taxes             smallint        NULL,
    EmployeeID        bigint          NOT NULL,

    Primary Key (PaycheckID),
    Foreign Key (EmployeeID) References Employee(EmployeeID)
);




CREATE TABLE Project(

    ProjectID       bigint          NOT NULL    AUTO_INCREMENT,
    ProjectName     varchar(30)     NOT NULL,
    TotalHours      smallint        NULL,
    TotalCost       float           NULL,
    StartDate       Date            NULL,
    EndDate         Date            NULL,
    ClientID        bigint          NOT NULL,

    Primary Key (ProjectID),
    Foreign Key (ClientID) References Client(ClientID)
);


CREATE TABLE Project_Employee(

    EmployeeID      bigint          NOT NULL,
    ProjectID       bigint          NOT NULL,
    EmployeeRole    varchar(20)     NULL,
    RoleDescription varchar(50)     NULL,
    DateJoined      Date            NULL,

    Primary Key (EmployeeID, ProjectID),
    Foreign Key (EmployeeID) References Employee(EmployeeID),
    Foreign Key (ProjectID) References Project(ProjectID)
);


CREATE TABLE Employee_Manager(

    EmployeeID      bigint          NOT NULL,
    ManagerID       smallint        NOT NULL,

    Primary Key (EmployeeID, ManagerID),
    Foreign Key (EmployeeID) References Employee(EmployeeID)
);


CREATE TABLE PositionHistory(

    EmployeeID          bigint      NOT NULL,
    PositionTitleID     bigint      NOT NULL,
    DateStart           Date 		NOT NULL,
    DateEnd             Date        NULL,

    Primary Key (EmployeeID, PositionTitleID),
    Foreign Key (EmployeeID) References Employee(EmployeeID),
    Foreign Key (PositionTitleID) References PositionDescription(PositionTitleID)
);


CREATE TABLE Invoice(

	InvoiceID       bigint     	NOT NULL     AUTO_INCREMENT,
    InvoiceDate     Date    	NOT NULL,
    Cost            float   	NULL,
    AmountPaid      float    	NULL,
    ProjectID       bigint  	NOT NULL,

    Primary Key (InvoiceID),
    Foreign Key (ProjectID) References Project(ProjectID)
);

CREATE TABLE CostUpdate(

    CostUpdateID     bigint       NOT NULL    AUTO_INCREMENT,
    Amount           int          NOT NULL,
    CostUpdateDate   date         NOT NULL,
    Description      varchar(300)  NULL,
    InvoiceID        bigint       NOT NULL,

    Primary Key (CostUpdateID),
    Foreign Key (InvoiceID) References Invoice(InvoiceID)

    );

CREATE TABLE PayHistory(

    EmployeeID      bigint		NOT NULL,
    DateStart       Date		NOT NULL,
    DateEnd         Date		NULL,
    Wage            float		NULL,
    Salary          int			NULL,

    Primary Key (EmployeeID, DateStart),
    Foreign Key (EmployeeID) References Employee(EmployeeID)

);

CREATE TABLE Project_Milestone(

    ProjectID        bigint         NOT NULL,
    MilestoneName    varchar(20)    NOT NULL,
    StartDate        date           NOT NULL,
    EndDate          date         	NULL,

    Primary Key (ProjectID, MilestoneName),
    Foreign Key (ProjectID) References Project(ProjectID),
    Foreign Key (MilestoneName) References Milestone(MilestoneName)

    );

CREATE TABLE Card(

    ClientID         bigint         NOT NULL,
    PaymentCardNo    varchar(16)    NOT NULL,

    Primary Key (ClientID, PaymentCardNo),
    Foreign Key (ClientID) References Client(ClientID)
);


INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('James',       'Harrison',     '2017-01-09',   '1980-02-02',   123456789);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Annette',     'Sheenan',      '2017-01-09',   '1991-11-11',   123456790);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Orpheus',     'Millander',    '2017-02-20',   '1989-10-12',   123456791);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Chreshiek',   'Sylvester',    '2017-05-20',   '1994-02-04',   123456792);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Alejandro',   'Servetto',     '2017-07-19',   '1988-10-10',   123456793);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Amir',        'Blumenfeld',   '2018-03-29',   '1990-10-02',   123456794);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Walter',      'White',        '2018-01-02',   '1988-11-02',   123456795);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Jesse',       'Jackson',      '2018-11-01',   '1989-04-14',   123456796);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('John',        'Carico',       '2018-09-12',   '1982-07-29',   123456797);
INSERT INTO Employee (FName, LName, HireDate, BirthDate, SSN) VALUES ('Francis',     'Turecek',      '2018-05-10',   '1980-04-08',   123456798);


INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (27316,       'Denver',            'CO');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (46048,       'Toronto',           'NY');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (46667,       'Tallahasse',         'TN');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (14850,       'Ithaca',            'NY');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (39955,       'Homer',             'NY');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (43937,       'Rome',              'NY');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (40436,       'Cortland',          'NY');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (42798,       'Manhattan',         'NY');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (21227,       'San Francisco',     'CA');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (35977,       'Seattle',           'WA');   
INSERT INTO ZipCode (ZIP, CityName, StateName) VALUES (29839,       'Manchesterville',   'VA');   


INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Fareed',   'Tighe',     '1022 Stewart avenue',    27316);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Yeter',    'Dupond',    '610 N Aurora St',        46048);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Ampelios', 'Oquendo',   '369 Pleasant Avenue',    46667);   
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('BeepBoop', 'Beep',   '127 Pluscraft Boulevard',   14850);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Joash',    'Borisov',   '447 Jameson Boulevard',  39955);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Kalindi',  'Blazy',     '73 Pankratz Road',       43937);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Elysia',   'Anthon',    '56786 Mccormick Drive',  40436);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Nicola',   'Windmill',  '62 3rd Parkway',         42798);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Karlens',  'Finker',    '92 Schmedeman Parkway',  21227);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Amalia',   'Clemintoni','17 Shopko Trail',        35977);
INSERT INTO Client (FName, LName, BillingAddress, ZIP) VALUES ('Jennee',   'Tythacott', '956 Killdeer Drive',     29839);  



INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone A', 'cleaning the laundry');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone B', 'folding the clothes');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone C', 'sweeping the basement');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone D', 'giving the dog dinner');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone E', 'fighting crime');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone F', 'eating marshmallows');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone G', 'getting eaten by marshamllows');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone H', 'the dog bites back');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone I', 'issa joke ok');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone J', 'wishing and waiting');
INSERT INTO Milestone (MilestoneName, MilestoneDescription) VALUES ('Milestone K', 'success and graditude');




INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Captain', 300000, null, 'keeps crew in line');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Navigator', null, 14.50, 'keeps ship on course');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Quartermaster', 1, null, 'makes the beds and stuff');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Cooper', null, 20, 'coops, scoops and loopdy loops');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Carpenter', 80000, null, 'fixes wood and things');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Master Gunner', null, 50.47, 'shoots the big guns');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Scallywag', null, 7.50, 'shoots the small guns');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Wallyscag', null, 80.70, 'gets shot at by the medium guns');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Dallyswag', null, 6.50, 'we still dont know');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('HR Rep', 50000, null, 'deals with humans and relations');
INSERT INTO PositionDescription (PositionTitle, BaseSalary, BaseWage, Description) VALUES ('Janitor', null, 14.97, 'leaves things sparkly');



INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-08-05', '2018-08-29', '2017-11-03', 28.77, 7.70,  1);    
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-03-09', '2018-03-23', '2018-02-04', 39.06, 50.93, 2);   
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-11-01', '2018-11-15', '2018-09-16', 90.18, 86.82, 3);  
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-04-19', '2018-05-03', '2018-05-13', 93.59, 95.63, 3);   
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2017-12-01', '2017-12-15', '2018-07-27', 65.41, 47.20, 3);   
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-09-13', '2018-09-27', '2018-05-24', 54.95, 28.67, 6);   
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2017-12-20', '2018-01-04', '2018-06-26', 41.62, 80.80, 8);  
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-01-16', '2018-01-30', '2018-04-26', 58.94, 58.14, 8);
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-07-01', '2018-01-15', '2018-04-26', 59.25, 30.14, 8);   
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-11-04', '2018-11-28', '2017-11-19', 89.8 , 62.56, 9);   
INSERT INTO Paycheck (PayPeriodStart, PayPeriodEnd, CheckDate, Hours, Taxes, EmployeeID) VALUES ('2018-09-25', '2018-10-09', '2018-06-22', 16.25, 95.22, 10);  




INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Cat grooming website', 100, 1461, '2017-11-13', '2018-02-05', 4);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Butcher shop website', 350, 1004, '2018-02-05', null, 2);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('GIAC Outreach website', 698, 210, '2018-02-28', '2018-04-19', 5);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Project Westchester', 567, 733, '2018-04-19', '2018-07-11', 1);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Project Amadeus', 555, 183, '2018-07-11', null, 10);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Vesta Supreme', 840, 437, '2018-09-10', '2018-11-07', 10);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Launch Blitz 3000', 9376, 1279, '2018-10-11', '2018-11-09',  9);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Frankensteins Ladyboys', 9238, 566, '2018-10-19', null, 7);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('FG Wells Showdown', 8403, 224, '2018-11-07', '2018-11-09', 2);
INSERT INTO Project (ProjectName, TotalHours, TotalCost, StartDate, EndDate, ClientID) VALUES ('Death and Disruption', 6780, 878, '2018-11-09', '2018-12-31', 3);



INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (9,     7,    'code debugger', 'debugs code writted by developers');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (7,     8,    'project lead',     'main decision making and task delegation');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (1,     9,    'developer',     'implements project lead\'s ideas');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (6,     10,    'developer',     'implements project lead\'s ideas');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (7,     4,    'project lead',     'main decision making and task delegation');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (9,     1,    'code debugger', 'debugs code writted by developers');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (7,     10,    'project lead',     'main decision making and task delegation');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (5,     7,    'project lead',     'main decision making and task delegation');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (9,     4,    'code debugger', 'debugs code writted by developers');
INSERT INTO Project_Employee (EmployeeID, ProjectID, EmployeeRole, RoleDescription) VALUES (1,     8,    'developer',     'implements project lead\'s ideas');


INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (1, 7);
INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (2, 7);
INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (3, 5);
INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (4, 5);
INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (8, 6);
INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (9, 6);
INSERT INTO Employee_Manager (EmployeeID, ManagerID) VALUES (10,7);

INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (1, '2017-01-09', '2018-01-09' , 9.00);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (1, '2018-01-09', NULL, 21.52);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (2, '2017-01-09', NULL, 33.67);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (3, '2017-02-20', '2017-06-24', 15.98);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (3, '2017-06-24', '2018-01-01', 38.68);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (3, '2018-01-01', NULL, 40.00);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (4, '2018-05-20', NULL, 73384.44);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (5, '2018-07-19', NULL, 69749.60);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (6, '2018-03-29', NULL, 96449.84);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Wage)   VALUES (8, '2017-04-20', '2018-11-01', 12.00);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (8, '2017-11-01', '2018-04-20', 60000.88);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (8, '2018-04-20', '2018-09-05', 89070.00);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (8, '2018-09-05', NULL, 95000.88);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (9, '2017-09-12', NULL, 67380.57);
INSERT INTO PayHistory (EmployeeID, DateStart, DateEnd, Salary) VALUES (10,'2017-05-10', NULL, 80777.48);

INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (1,    3,    '2018-01-31',        '2018-05-22');
/*INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (1,    4,    '2018-05-04',        '2018-16-23');*/
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (4,    6,    '2018-05-16',        '2018-07-17');
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (3,    2,    '2018-05-18',        '2018-07-22');
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (4,    5,    '2018-06-11',        '2018-10-24');
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (3,    3,    '2018-06-25',        '2018-07-30');
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (1,    7,    '2018-08-03',        null);
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (2,    3,    '2018-09-03',        null);
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (3,    6,    '2018-10-17',        null);
INSERT INTO PositionHistory (EmployeeID, PositionTitleID, DateStart, DateEnd) VALUES (4,    3,    '2018-11-27',        null);

INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid,  ProjectID) VALUES ('2018-5-28',     303.62, 303.62,    1);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-8-21',     356.94, 356.94,    4);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-3-10',     160.68, 100.00,    3);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-3-04',       35.92,     35.92,    4);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-9-30',     462.91, 100.00,    5);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-3-13',      31.83,     31.83,    6);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-9-24',      179.70, 25.00,    8);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-12-11',     332.74, 100.00,    10);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-5-20',      126.86, 126.86,    7);
INSERT INTO Invoice (InvoiceDate, Cost, AmountPaid, ProjectID) VALUES ('2018-1-16',      387.83, 387.83,    4);




INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (415.46, '2018-2-20', 'sit amet sem fusce con bibendum felis sed interdum venenatis turpis enim blandit', 1);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (325.62, '2017-12-5', 'lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate', 1);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (495.21, '2018-1-11', 'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea', 4);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (371.98, '2018-1-3', 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 7);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (413.76, '2018-5-10', 'tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque', 8);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (409.47, '2018-2-25', 'turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc', 9);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (142.31, '2018-11-3', 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', 3);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (490.26, '2018-7-26', 'erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin', 6);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (392.51, '2018-9-24', 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 5);
INSERT INTO CostUpdate (Amount, CostUpdateDate, Description, InvoiceID) VALUES (338.91, '2018-9-30', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec', 4);



INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (10, 'Milestone A', '2017-05-12', '2018-09-06');
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (4, 'Milestone C', '2018-02-01', '2018-10-24');
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (2, 'Milestone B', '2017-10-20', '2018-10-31');
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (3, 'Milestone B', '2017-07-23', '2018-09-21');
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (4, 'Milestone D', '2018-02-16', '2018-07-30');
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (4, 'Milestone J', '2018-09-06', NULL);
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (2, 'Milestone J', '2018-10-24', NULL);
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (7, 'Milestone F', '2018-10-31', NULL);
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (10, 'Milestone B', '2018-09-21', NULL);
INSERT INTO Project_Milestone (ProjectID, MilestoneName, StartDate, EndDate) VALUES (7, 'Milestone E', '2018-07-30', NULL);



INSERT INTO Card (ClientID, PaymentCardNo) VALUES (1, '0259603404371986');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (2, '9951541544853261');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (3, '3414301385838635');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (4, '9889623055163685');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (5, '4533605163075123');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (6, '4220394045172322');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (7, '0982199070547814');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (8, '2556625074030357');
INSERT INTO Card (ClientID, PaymentCardNo) VALUES (9, '3751446177764346');
