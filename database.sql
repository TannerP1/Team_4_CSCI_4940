/*mysql script to create database and populate each table with info*/
Create Database myDB;
use myDB;
CREATE TABLE Students(
   Student_id  INTEGER auto_increment NOT NULL,
   FName VARCHAR(255),
   LNanme  VARCHAR(255),
   Email VARCHAR(255),
   Phone VARCHAR(10),
   PRIMARY KEY(Student_id)
);

CREATE TABLE Professors(
   p_id INTEGER auto_increment NOT NULL,
   P_name VARCHAR(255),
   Begin_O_hrs TIME,
   End_O_hrs TIME,
   O_num INTEGER,
   day_of_week VARCHAR(255),
   Building VARCHAR(255),
   Email VARCHAR(255),
   PRIMARY KEY(p_id)
);

CREATE TABLE OtherEvents(
   Event_id INTEGER auto_increment NOT NULL,
   Event_name VARCHAR(255),
   Event_date DATE,
   Event_time  TIME,
   Location VARCHAR(255),
   Event_description TEXT,
   Event_img LONGBLOB,
   PRIMARY KEY(Event_id)
);

CREATE TABLE CampusEvents(
  Event_id INTEGER auto_increment NOT NULL,
   Event_name Varchar(255),
   Event_date DATE,
   Event_time TIME,
   Location VARCHAR(255),
   Event_desciption TEXT,
   Event_img LONGBLOB,
   PRIMARY KEY(Event_id)
);

insert into professors(P_name,Begin_O_hrs,End_O_hrs,O_num,day_of_week,Building,Email) 
values("Sai Mukkavilli","10:45:00","12:00:00", "203", "Monday,Tuesday,Wednesday,Thursday", "Crawford Wheatley", "sai.mukkavilli@gsw.edu"),
("Satayaki Nan","09:30:00", "10:45:00","211","Monday,Tuesday,Wednesday,Thursday", "Crawford Wheatley", "satayaki.nan@gsw.edu");

Alter table campusevents add Event_end_time time;
select * from campusevents;
alter table campusevents
rename column Event_desciption to Event_description;

insert into campusevents(Event_name, Event_date,Event_time, Location, Event_description,Event_img,Event_end_time)
values("Boxing class","2024-03-23","03:00:00","Florrie Chappell Gymnasium","Join us for an exhilarating boxing class that will challenge your strength, agility, and endurance. Led by experienced boxing instructors, this class is suitable for all fitness levels, from beginners to advanced athletes.","boxing.avif","04:30:00"),
("Yoga class","2024-03-30","2:30:00","Florrie Chappell Gymnasium","Join us for a rejuvenating Serene Flow Yoga class designed to help you unwind, de-stress, and reconnect with your body and mind. Led by our experienced and compassionate instructor, this class offers a perfect blend of gentle movements, breath work, and mindfulness practices suitable for all levels, from beginners to experienced yogis.","yoga.jpeg","03:30:00"),
("Club Fair","2024-04-01","11:00:00","Storm Dome","Are you passionate about promoting fairness, equality, and social justice? Join the Fair Club and become part of a community dedicated to making a positive impact on campus and beyond!","club_fair.jpeg","02:00:00");

rename table students to users;
rename table campusevents to gen_events;

create table User_events(
user_id INTEGER,
event_id INTEGER,
primary key(user_id,event_id),
foreign key(user_id) References users(Student_id),
foreign key(event_id) References gen_events(Event_id)
);
drop table otherevents;
insert into professors(P_name,Begin_O_hrs,End_O_hrs,O_num,day_of_week,Building,Email) 
values("Ru Story-Huffman","08:00:00","11:00:00","202","Monday,Wednesday,Thursday","James E. Carter Library","ru.story-huffman@gsw.edu"),
("Mikela Barlow","09:00:00","11:00:00","304","Monday,Wednesday,Thursday,Friday","Student Success Center","mikela.barlow@gsw.edu");
