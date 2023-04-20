-- insert into book values(1, "Wings of Fire", "Penguin Publications", 2004);
-- insert into book values(2, "Book 2", "Penguin Publications", 2005);
-- insert into book values(3, "Book 3", "Penguin Publications", 2005);
-- insert into book values(4, "Book 4", "Penguin Publications", 2005);
-- insert into book values(5, "Book 5", "Penguin Publications", 2005);

-- insert into book_authors values(1, "Dr. A.P.J Abdul Kalam");
-- insert into book_authors values(2, "Author 2");
-- insert into book_authors values(3, "Author 3");
-- insert into book_authors values(4, "Author 4");
-- insert into book_authors values(5, "Author 5");

-- insert into publisher values("Penguin Publications", "26-D Rajmarg, New Delhi, 800001", "9876543210");
-- insert into publisher values("ABC Print", "New Delhi, 800001", "9876543210");

-- insert into book_copies values(1, "123", 1200);
-- insert into book_copies values(2, "213", 321);
-- insert into book_copies values(3, "321", 450);
-- insert into book_copies values(4, " 523", 12);
-- insert into book_copies values(5, "654", 36);

-- insert into book_lending values(1, "123", "ABC2346", 01/02/2023, 01/02/2023);
-- insert into book_lending values(2, "213", "ABC2345", 01/02/2023, 01/02/2023);

-- insert into library_branch values("123", "ABC", "26-D Rajmarg, New Delhi");

update book set publisher_name = "Publication Updated" where book_id = 2;












