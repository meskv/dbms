CREATE TABLE BOOK (
	Book_id integer(20) primary key,
    Title varchar(200),
    Publisher_Name varchar(100),
    Pub_Year varchar(5)
);

CREATE TABLE BOOK_AUTHORS (
	Book_id integer(20) primary key,
    Author_Name varchar(100)
);

CREATE TABLE PUBLISHER (
	Name varchar(50),
    Address varchar(200),
    Phone varchar(12)
);

CREATE TABLE BOOK_COPIES (
	Book_id integer(20) primary key,
    Branch_id integer(20),
    No_of_Copies integer(20)
);


CREATE TABLE BOOK_LENDING (
	Book_id integer(20) primary key,
    Branch_id integer(20),
    Card_No varchar(20),
    Date_out date,
    Due_Date date
);

CREATE TABLE LIBRARY_BRANCH (
    Branch_id integer(20),
    Branch_Name varchar(50),
    Address varchar(200)
);





