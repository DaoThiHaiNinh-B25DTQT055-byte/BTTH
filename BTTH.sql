create database quan_ly_dat_ve;
use quan_ly_dat_ve;

create table Flight(
 flight_id varchar(10) primary key,
 airline_name varchar(100),
 departure_airport varchar(100),
 arrival_airport varchar(100),
 departure_time date,
 arrival_time date,
 ticket_price float
);

create table Passenger(
 passenger_id varchar(10) primary key,
 passenger_full_name varchar(150),
 passenger_email varchar(255) unique,
 passenger_phone varchar(15) unique,
 passenger_bod date
);

create table Booking(
 booking_id int auto_increment primary key,
 passenger_id varchar(10),
 foreign key(passenger_id) references Passenger(passenger_id),
 flight_id varchar(10),
 foreign key(flight_id) references Flight(flight_id),
 booking_date date,
 booking_status enum('Comfirmed', 'Cancelled', 'Pending')
);

create table Payment(
 payment_id int auto_increment primary key,
 booking_id int,
 foreign key(booking_id) references Booking(booking_id),
 payment_method enum('Credit Card', 'Bank Transfer', 'Cash'),
 payment_amount float,
 payment_date date,
 payment_status enum('Success', 'Failed', 'Pending')
);

alter table Passenger
add column passenger_gender enum('Nam', 'Nu', 'Khac');

alter table Booking
add column ticket_quantity integer not null default 1;

alter table Payment
modify column payment_amount decimal(10,2) check(payment_amount > 0);

insert into Passenger
values ('P0001', 'Nguyen Anh Tuan', 'tuan.nguyen@example.com', '0901234567', '1995-05-15', 'Nam'),
('P0002', 'Tran Thi Mai', 'mai.tran@example.com', '0912345678', '1996-06-16', 'Nu'),
('P0003', 'Le Minh Tuan', 'tuan.le@example.com', '0923456789', '1997-07-17', 'Nam'),
('P0004', 'Pham Hong Son', 'son.pham@example.com', '0934567890', '1998-08-18', 'Nam'),
('P0005', 'Nguyen Thi Lan', 'lan.nguyen@example.com', '0945678901', '1999-09-19', 'Nu'),
('P0006', 'Vu Thi Bao', 'bao.vu@example.com', '0956789012', '2000-10-20', 'Nu'),
('P0007', 'Doan Minh Hoang', 'hoang.doan@example.com', '0967890123', '2001-11-21', 'Nam'),
('P0008', 'Nguyen Thi Thanh', 'thanh.nguyen@example.com', '0978901234', '2002-12-22', 'Nu'),
('P0009', 'Trinh Bao Vy', 'vy.trinh@example.com', '0989012345', '2003-01-23', 'Nu'),
('P0010', 'Bui Hoang Nam', 'nam.bui@example.com', '0990123456', '2004-02-24', 'Nam');

insert into Flight
values ('F001', 'VietJet Air', 'Tan Son Nhat', 'Nha Trang', '2025-03-01 08:00:00', '2025-03-01 10:00:00', 150.5),
('F002', 'Vietnam Airlines', 'Noi Bai', 'Hanoi', '2025-03-01 09:00:00', '2025-03-01 11:30:00', 200.0),
('F003', 'Bamboo Airways', 'Da Nang', 'Phu Quoc', '2025-03-01 10:00:00', '2025-03-01 12:00:00', 120.8),
('F004', 'Vietravel Airlines', 'Can Tho', 'Ho Chi Minh', '2025-03-01 11:00:00', '2025-03-01 12:30:00', 180.0);

insert into Booking
values (1, 'P0001', 'F001', '2025-02-20', 'Confirmed', 1),
(2, 'P0002', 'F002', '2025-02-21', 'Cancelled', 2),
(3, 'P0003', 'F003', '2025-02-22', 'Pending', 1),
(4, 'P0004', 'F004', '2025-02-23', 'Confirmed', 3),
(5, 'P0005', 'F001', '2025-02-24', 'Pending', 1),
(6, 'P0006', 'F002', '2025-02-25', 'Confirmed', 2),
(7, 'P0007', 'F003', '2025-02-26', 'Cancelled', 1),
(8, 'P0008', 'F004', '2025-02-27', 'Pending', 4),
(9, 'P0009', 'F001', '2025-02-28', 'Confirmed', 1),
(10, 'P0010', 'F002', '2025-02-28', 'Pending', 1),
(11, 'P0001', 'F003', '2025-03-01', 'Confirmed', 3),
(12, 'P0002', 'F004', '2025-03-02', 'Cancelled', 1),
(13, 'P0003', 'F001', '2025-03-03', 'Pending', 2),
(14, 'P0004', 'F002', '2025-03-04', 'Confirmed', 1),
(15, 'P0005', 'F003', '2025-03-05', 'Cancelled', 2),
(16, 'P0006', 'F004', '2025-03-06', 'Pending', 1),
(17, 'P0007', 'F001', '2025-03-07', 'Confirmed', 3),
(18, 'P0008', 'F002', '2025-03-08', 'Cancelled', 2),
(19, 'P0009', 'F003', '2025-03-09', 'Pending', 1),
(20, 'P0010', 'F004', '2025-03-10', 'Confirmed', 1);

insert into Payment
values (1, 1, 'Credit Card', 150.5, '2025-02-20', 'Success'),
(2, 2, 'Bank Transfer', 200.0, '2025-02-21', 'Failed'),
(3, 3, 'Cash', 120.8, '2025-02-22', 'Pending'),
(4, 4, 'Credit Card', 180.0, '2025-02-23', 'Success'),
(5, 5, 'Bank Transfer', 150.5, '2025-02-24', 'Pending'),
(6, 6, 'Cash', 200.0, '2025-02-25', 'Success'),
(7, 7, 'Credit Card', 120.8, '2025-02-26', 'Failed'),
(8, 8, 'Bank Transfer', 180.0, '2025-02-27', 'Pending'),
(9, 9, 'Cash', 150.5, '2025-02-28', 'Success'),
(10, 10, 'Credit Card', 200.0, '2025-03-01', 'Pending');

