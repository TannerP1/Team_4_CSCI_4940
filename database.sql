Create Database myDB;
USE myDB;
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
   O_hours TIME ,
   O_num INTEGER,
   Building VARCHAR(255),
   Email VARCHAR(255)
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

