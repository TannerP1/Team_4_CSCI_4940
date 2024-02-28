create database myDB;
use myDB;
CREATE TABLE Students(
   Student_id  INTEGER NOT NULL,
   FName VARCHAR(255),
   LNanme  VARCHAR(255),
   Email VARCHAR(255),
   Phone VARCHAR(10),
   PRIMARY KEY(Student_id)
);

CREATE TABLE Professors(
   p_id INTEGER,
   P_name VARCHAR(255),
   Begin_O_hrs TIME,
   End_O_hrs TIME,
   O_num INTEGER,
   day_of_week VARCHAR(10),
   Building VARCHAR(255),
   Email VARCHAR(255),
   PRIMARY KEY(p_id)
);

CREATE TABLE OtherEvents(
   Event_id INTEGER NOT NULL,
   Event_name VARCHAR(255),
   Event_date DATE,
   Event_time  TIME,
   Location VARCHAR(255),
   Event_description TEXT,
   Event_img LONGBLOB,
   PRIMARY KEY(Event_id)
);

CREATE TABLE CampusEvents(
  Event_id INTEGER NOT NULL,
   Event_name Varchar(255),
   Event_date DATE,
   Event_time TIME,
   Location VARCHAR(255),
   Event_desciption TEXT,
   Event_img LONGBLOB,
   PRIMARY KEY(Event_id)
);

