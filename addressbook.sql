#UC1
  create database addressBook_services;
  show databases;
  use addressBook_services;
  #UC2
  create table address_book(
     id int unsigned not null auto_increment,
     fname varchar(15) not null,
     lname varchar(10) not null,
     address varchar(100) not null,
     city varchar(50) not null,
     state varchar(50) not null,
     zip int not null,
     phone long not null,
     email varchar(100) not null,
     primary key (id)
  );
  select * from address_book;
  #UC3
  insert into address_book(fname, lname, address,city, state, zip, phone, email) values
    ('Rash', 'Gajra', 'Jawahar Nagar','SGNR', 'Rajasthan', 335001, 9024502171, 'rashgajra99@gmail.com' ),
    ('Rajat', 'Kumar','Jagatpura', 'Jaipur', 'Rajathan', 335522, 7023953094, 'rajatrjsinger@gmail.com' ),
    ('Hanish', 'Nanda','Sector 23', 'Gurgaon', 'Haryana', 122041, 9057529818, 'hanish2171@gmail.com' ),
    ('Pooja', 'Jogdhand', 'Bhavdhan','Pune', 'Maharashtra', 411021, 9874563210, 'poojaj15@gmail.com' );
    #UC4
   UPDATE address_book
   SET city = 'Bangalore',
   state = 'Karnataka',
   zip = 852369
   WHERE fname = 'Hanish';
   #UC5
   DELETE FROM  address_book
   WHERE fname = 'Hanish';
   #UC6
   SELECT * FROM address_book
   where city = 'dharmanagar' or state = 'tripura';
   #UC7
   SELECT COUNT(city or state)
   FROM address_book;
   #UC8
   select fname
    from address_book
    order by fname asc;
    #UC9
   Alter table address_book add type varchar(15) after lname;
   update  address_book set type='Family' where fname ='Rash';
   update  address_book set type='Friends' where fname  ='Pooja';
   update  address_book set type='Friends' where fname  ='Hanish';
   update  address_book set type='Profession' where fname  ='Rajat';
   #UC10
   SELECT COUNT(type) AS Number_Of_Contact_Person 
   FROM address_book;
   #UC11
   insert into address_book(fname, lname, type, address, city, state, zip, phone, email) values
    ('Rajendra','Rathod','Friend','lmn colony', 'Pune', 'Rajasthan',335001, 9024502171, 'rajendrarathod@gmail.com' ),
    ('Priya','shikhavat','Family','lmn colony', 'Pune', 'Rajasthan',414504, 9603679860, 'priya@gmail.com');
    #UC12
  CREATE TABLE  contacts
     (firstName varchar(50) NOT NULL, lastName varchar(50) NOT NULL,
      mobileNumber varchar(20) NOT NULL,email varchar(50) NOT NULL, PRIMARY KEY(firstName));
  desc contacts;
  insert into contacts values('Rash', 'Gajra',9024502171, 'rashgajra99@gmail.com'),
    ('Rajat', 'Kumar',7023953094, 'rajatrjsinger@gmail.com' ),
    ('Hanish', 'Nanda',9057529818, 'hanish2171@gmail.com' );
  select * from contacts;

  create table address (
     zip varchar(6) not null,
     city varchar(30) not null,
     state varchar(30) not null,
     address varchar(100) not null,
     primary key(zip));
  desc address;
  insert into address values 
    (335001,'SGNR', 'Rajasthan','Jawahar Nagar'),
    (335522,'Jaipur', 'Rajathan','Jagatpura');
  select * from address;
  
  create table contacts_address(
     firstname varchar(30) not null,
     zip varchar(6) not null,
     foreign key (firstname) references contacts(firstname),
     foreign key (zip) references address(zip));
  desc contacts_address;
  insert into contacts_address values ('Rash','335001');
  insert into contacts_address values ('Rajat','335522');
  select * from contacts_address;

  create table relations (type varchar(15),primary key(type));
  desc relations;
  insert into relations values('Family'),('Profession');
  select * from relations;

  create table contacts_relation(
     firstname varchar(30) not null,
     type varchar(15),
     foreign key(firstname) references contacts(firstname),
     foreign key(type) references relations(type));
  desc contacts_relation;
  insert into contacts_relation values
    ( 'Rash', 'Family'),
    ('Rajat','Profession');
  select * from contacts_relation;
