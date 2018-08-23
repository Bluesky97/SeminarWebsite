--v1. Sep 1 
-- Create a database SeminarDB 
create database SeminarDB;
use SeminarDB;

--Create Category table
create table Category (
	cat_name varchar(20) primary key,
	cat_description varchar(100)
);

--Create Speaker table
create table Speaker (
   spk_id varchar(10) primary key,
   spk_name varchar(50),
   spk_email varchar(30),
   spk_phone char(8),
   spk_photo varchar(30),
   spk_profile varchar(100)
);

--Create Seminar table
create table Seminar (
	sem_id varchar(10) primary key,
	cat_name varchar(20),
	sem_title varchar(60),
	sem_description varchar(500),
	sem_duration int, 
	sem_image varchar(30),
	sem_price decimal(6,2)
	foreign key (cat_name) references category(cat_name)
);

--Create Schedule
create table Schedule (
	sch_id int identity(1,1) primary key,
	sch_date date,
	sem_id varchar(10),
	spk_id varchar(10),
	sch_capacity int,
	foreign key (sem_id) references Seminar(sem_id),
	foreign key (spk_id) references Speaker(spk_id)
);

--Create Participant
create table Participant (
	participant_email varchar(30) primary key,
	participant_name varchar(50),
	participant_password varchar(50),
	participant_phone char(8),
	participant_address varchar(50)
);

--Create Payment
create table Payment (
	payment_id int identity(1,1) primary key,
	payment_name varchar(50),
	payment_ccNo varchar(20),
	payment_ccType varchar(30),
	payment_ccCode varchar(10),
	payment_expDate varchar(10),
	payment_price decimal(6,2),
	payment_optionPay varchar(20),
	payment_date datetime,
	participant_email varchar(30),
	sch_id int,
	foreign key (participant_email) references Participant(participant_email),
	foreign key (sch_id) references Schedule(sch_id),
);

--Create Review
create table Review (
	rev_id int identity(1,1) primary key,
	rev_rating int,
	rev_remarks varchar(500),
	sem_id varchar(10),
	participant_email varchar(30),
	foreign key (sem_id) references Seminar(sem_id),
	foreign key (participant_email) references Participant(participant_email)
);

--insert into Category
insert into Category values ('Arts', 'dancing, painting, photography etc');
insert into Category values ('Lifestyle', 'health talks, sports, travelling etc');
insert into Category values ('Enrichment', 'Legal issues, personality enhancement, retirement etc');
insert into Category values ('Technology', 'IT literacy, how-to etc');
insert into Category values ('Language', 'Foreign language, certifications etc');

--insert into Speaker
insert into Speaker values ('SPK001', 'John Wong', 'JohnWong@gmail.com', '91234567', 'SPK001.jpg', 'Trained IT lecturer holding senior positions in the IT industry');
insert into Speaker values ('SPK002', 'Peter Tan', 'PeterTan@gmail.com', '97654321', 'SPK002.jpg', 'Arts Director in a local arts school.');
insert into Speaker values ('SPK003', 'Amy Chia', 'AmyChia@gmail.com', '92345671', 'notavailabe.jpg', 'Dietition working in a private hospital.');
insert into Speaker values ('SPK004', 'Roland Lim', 'RolandLim@gmail.com', '93456712', 'SPK004.jpg', 'Language teacher with Regional language Learning Center');
insert into Speaker values ('SPK005', 'Rashid Ali', 'RahidAli@gmail.com', '94567123', 'SPK005.jpg', 'Trained lawyer with a major law firm');
insert into Speaker values ('SPK006', 'Joe Goh', 'JoeGoh@gmail.com', '95671234', 'SPK006.jpg', 'Sports mentor and trainer.');
insert into Speaker values ('SPK007', 'Jenny Sim', 'Jenny@gmail.com', '96712345', 'SPK007.jpg', 'Dance school instructor.');
insert into Speaker values ('SPK008', 'Robert Tan', 'Robert@gmail.com', '97123456', 'SPK008.jpg', 'Specialist doctor practising in a leading hospital.');
insert into Speaker values ('SPK009', 'Raymond Choo', 'Raymond@gmail.com', '81234567', 'SPK009.jpg', 'Director in a leading IT consultancy firm');

--insert into Seminar
insert into Seminar values('SEM001', 'Arts', 'Origami for fun', 'Learn how to make shapes from paper', 1, 'origami.jpg', 50);
insert into Seminar values('SEM002', 'Arts', 'Stay young with dancing', 'Learn how to dance and stay healthy', 1, 'dancing.jpg', 100);
insert into Seminar values('SEM003', 'Lifestyle', 'Heart dissease prevention', 'The signs and prevention for heart disease', 1, 'heart.jpg', 100);
insert into Seminar values('SEM004', 'Technology', 'Learn all about using handphone', 'Tips and tricks to use the latest handphone', 1, 'phone.jpg', 50);
insert into Seminar values('SEM005', 'Technology', 'Cloud Technology', 'Introduction to cloud technology and the services available', 2, 'cloud.jpeg', 200);
insert into Seminar values('SEM006', 'Language', 'Korean for fun', 'Learn how to speak korean when travelling in Korea', 3, 'korean.jpg', 200);
insert into Seminar values('SEM007', 'Enrichment', 'How to write a will', 'How to write a will that is legal', 2, 'write.jpg', 100);
insert into Seminar values('SEM008', 'Lifestyle', 'How to stay healthy', 'Learn all about nutrition and how to eat healthtily', 1, 'healthy.jpeg', 50);
insert into Seminar values('SEM009', 'Arts', 'Photography workshop', 'Learn the fundamentals of photograpy', 3, 'photography.jpg', 500);

--insert into Schedule
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values ('2017-10-1', 'SEM001', 'SPK002', 1);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-11-1', 'SEM001', 'SPK002', 5);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-11-1', 'SEM001', 'SPK002', 10);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-1', 'SEM002', 'SPK002', 2);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-2', 'SEM003', 'SPK008', 20);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-2', 'SEM004', 'SPK001', 2);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-3', 'SEM004', 'SPK001', 10);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-1', 'SEM005', 'SPK009', 1);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-3', 'SEM005', 'SPK009', 5);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-11-1', 'SEM005', 'SPK009', 1);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-1', 'SEM006', 'SPK004', 1);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-1', 'SEM006', 'SPK006', 2);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-5', 'SEM006', 'SPK006', 3);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-10', 'SEM006', 'SPK004', 10);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-1', 'SEM007', 'SPK005', 1);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-3', 'SEM007', 'SPK005', 5);
insert into Schedule (sch_date,sem_id, spk_id, sch_capacity) values('2017-10-5', 'SEM007', 'SPK005', 10);

--insert into Participant
insert into Participant values ('andrian97@windowslive.com', 'Andrian', '123456', '83852235', '2 river valley close');
insert into Participant values ('alex10@gmail.com', 'Alex', '654321', '87788558', '10 holland road');
insert into Participant values ('michael20@gmail.com', 'Michael', '321456', '65878523', '312 river valley road');
insert into Participant values ('henry20@gmail.com', 'Henry', '564231', '65532878', '56 farrer road');
insert into Participant values ('dennis98@yahoo.com', 'Dennis', '343521', '68875252', '15 river valley road');

--insert into Payment
insert into Payment (payment_name, payment_ccNo, payment_ccType, payment_ccCode ,payment_expDate, payment_price, payment_optionPay, payment_date, participant_email, sch_id) values ('Andrian', '1111123415151010', 'Visa', '512' ,'08/22', 100.00, 'Credit Card', '2017-10-5', 'andrian97@windowslive.com', 1);
insert into Payment (payment_name, payment_ccNo, payment_ccType, payment_ccCode ,payment_expDate, payment_price, payment_optionPay, payment_date, participant_email, sch_id) values ('Alex', '1010432151510101', 'Master Card', '251' ,'05/23', 150.00, 'Credit Card', '2017-10-15', 'alex10@gmail.com', 2);
insert into Payment (payment_name, payment_ccNo, payment_ccType, payment_ccCode ,payment_expDate, payment_price, payment_optionPay, payment_date, participant_email, sch_id) values ('Michael', '1510515228481411', 'Visa', '878' ,'07/20', 85.00, 'Credit Card', '2017-10-20', 'michael20@gmail.com', 3);
insert into Payment (payment_name, payment_ccNo, payment_ccType, payment_ccCode ,payment_expDate, payment_price, payment_optionPay, payment_date, participant_email, sch_id) values ('Henry', 'NA', 'NA', 'NA' ,'NA', 55.00, 'Cash', '2017-11-1', 'henry20@gmail.com', 4);
insert into Payment (payment_name, payment_ccNo, payment_ccType, payment_ccCode ,payment_expDate, payment_price, payment_optionPay, payment_date, participant_email, sch_id) values ('Dennis', 'NA', 'NA', 'NA' ,'NA', 78.00, 'Cash', '2017-11-2', 'dennis98@yahoo.com', 5);

--insert into Review
insert into Review (rev_rating, rev_remarks, sem_id, participant_email) values (5, 'Good event planning and i learnt alot from this seminar', 'SEM001', 'andrian97@windowslive.com');
insert into Review (rev_rating, rev_remarks, sem_id, participant_email) values (4, 'I am very happy to attend to the seminar and i hope can provide a food', 'SEM002', 'alex10@gmail.com');
insert into Review (rev_rating, rev_remarks, sem_id, participant_email) values (3, 'Good seminar!', 'SEM003', 'michael20@gmail.com');
insert into Review (rev_rating, rev_remarks, sem_id, participant_email) values (5, 'This is very good seminar and i learnt on how to use mobile phone in proper ways', 'SEM004', 'henry20@gmail.com');
insert into Review (rev_rating, rev_remarks, sem_id, participant_email) values (5, 'Interesting seminar and also i am very happy to attend for next upcoming seminar in PSB Academy', 'SEM005', 'dennis98@yahoo.com');
