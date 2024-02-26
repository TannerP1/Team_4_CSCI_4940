Create Database myDB;
use myDB;
CREATE TABLE Students(
   Student_id  INTEGER NOT NULL,
   FName VARCHAR(255),
   LNanme  VARCHAR(255),
   Email Varchar(255),
   Phone VARCHAR(10),
   primary key(Student_id)
);

CREATE TABLE Professors(
   P_name VARCHAR(255),
   O_hours Time ,
   O_num Integer,
   Building Varchar(255),
   Email VARCHAR(255)
);

CREATE TABLE OtherEvents(
   Event_id INTEGER NOT NULL,
   Event_name Varchar(255),
   Event_date DATE,
   Event_time  TIME,
   Location VARCHAR(255),
   Event_description TEXT,
   primary key(Event_id)
);

CREATE TABLE CampusEvents(
  Event_id INTEGER NOT NULL,
   Event_name Varchar(255),
   Event_date DATE,
   Event_time TIME,
   Location VARCHAR(255),
   Event_desciption TEXT,
   primary key(Event_id)
);
