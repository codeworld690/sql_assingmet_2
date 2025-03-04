CREATE DATABASE healthcare_system;
USE healthcare_system;

-- Patients Table
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Contact VARCHAR(15),
    Address TEXT
);

INSERT INTO Patients (Name, Age, Gender, Contact, Address) VALUES
('Amit Kumar', 45, 'Male', '9876543210', 'Delhi, India'),
('Priya Sharma', 32, 'Female', '9876543221', 'Mumbai, India'),
('Rajesh Verma', 50, 'Male', '9876543232', 'Kolkata, India'),
('Sita Devi', 28, 'Female', '9876543243', 'Chennai, India'),
('Arjun Mehta', 38, 'Male', '9876543254', 'Bangalore, India');

-- Doctors Table
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

INSERT INTO Doctors (Name, Specialty, Phone, Email) VALUES
('Dr. Ramesh Gupta', 'Cardiology', '9876512345', 'ramesh.gupta@hospital.com'),
('Dr. Anjali Rao', 'Pediatrics', '9876523456', 'anjali.rao@hospital.com'),
('Dr. Suresh Menon', 'Orthopedics', '9876534567', 'suresh.menon@hospital.com'),
('Dr. Kavita Iyer', 'Neurology', '9876545678', 'kavita.iyer@hospital.com'),
('Dr. Manoj Tiwari', 'Dermatology', '9876556789', 'manoj.tiwari@hospital.com');

-- Appointments Table
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Time TIME,
    Status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

INSERT INTO Appointments (Patient_ID, Doctor_ID, Date, Time, Status) VALUES
(1, 1, '2025-03-10', '10:30:00', 'Scheduled'),
(2, 2, '2025-03-11', '11:00:00', 'Scheduled'),
(3, 3, '2025-03-12', '14:00:00', 'Completed'),
(4, 4, '2025-03-13', '15:30:00', 'Scheduled'),
(5, 5, '2025-03-14', '09:45:00', 'Cancelled');

-- Medical_History Table
CREATE TABLE Medical_History (
    History_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Diagnosis TEXT,
    Treatment TEXT,
    Notes TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Medical_History (Patient_ID, Diagnosis, Treatment, Notes) VALUES
(1, 'Hypertension', 'Regular medication', 'Needs regular BP check-up'),
(2, 'Asthma', 'Inhaler prescribed', 'Avoid dust and smoke'),
(3, 'Fractured leg', 'Cast applied for 6 weeks', 'Follow-up after 6 weeks'),
(4, 'Migraine', 'Painkillers and stress management', 'Monitor triggers'),
(5, 'Skin Allergy', 'Topical creams and antihistamines', 'Avoid allergens');

-- Medications Table
CREATE TABLE Medications (
    Medication_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Price DECIMAL(10,2),
    Description TEXT
);

INSERT INTO Medications (Name, Type, Price, Description) VALUES
('Aspirin', 'Painkiller', 50.00, 'Used for pain relief and fever reduction'),
('Cetirizine', 'Antihistamine', 30.00, 'Used for allergy relief'),
('Paracetamol', 'Analgesic', 20.00, 'Used for fever and pain relief'),
('Metformin', 'Diabetes Medication', 100.00, 'Used for blood sugar control'),
('Amoxicillin', 'Antibiotic', 80.00, 'Used for bacterial infections');

-- Prescriptions Table
CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Medication_ID INT,
    Date_Provided DATE,
    Dosage VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID)
);

INSERT INTO Prescriptions (Patient_ID, Medication_ID, Date_Provided, Dosage) VALUES
(1, 1, '2025-03-01', '1 tablet daily'),
(2, 2, '2025-03-02', '2 tablets daily'),
(3, 3, '2025-03-03', '500mg every 6 hours'),
(4, 4, '2025-03-04', '1 tablet before meal'),
(5, 5, '2025-03-05', '250mg every 8 hours');

-- Bills Table
CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Total_Amount DECIMAL(10,2),
    Payment_Status ENUM('Paid', 'Pending'),
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Bills (Patient_ID, Total_Amount, Payment_Status, Date) VALUES
(1, 5000.00, 'Paid', '2025-03-01'),
(2, 2000.00, 'Pending', '2025-03-02'),
(3, 1500.00, 'Paid', '2025-03-03'),
(4, 3000.00, 'Pending', '2025-03-04'),
(5, 1000.00, 'Paid', '2025-03-05');

-- Staff Table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Contact VARCHAR(15),
    Shift ENUM('Morning', 'Evening', 'Night')
);

INSERT INTO Staff (Name, Role, Contact, Shift) VALUES
('Vikram Singh', 'Nurse', '9876567890', 'Morning'),
('Meera Joshi', 'Receptionist', '9876578901', 'Evening'),
('Ravi Patel', 'Technician', '9876589012', 'Night'),
('Sanjay Reddy', 'Pharmacist', '9876590123', 'Morning'),
('Neha Kapoor', 'Admin', '9876501234', 'Evening');

-- Departments Table
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Phone VARCHAR(15)
);

INSERT INTO Departments (Name, Location, Phone) VALUES
('Cardiology', 'Building A', '9876511111'),
('Pediatrics', 'Building B', '9876522222'),
('Orthopedics', 'Building C', '9876533333'),
('Neurology', 'Building D', '9876544444'),
('Dermatology', 'Building E', '9876555555');

-- Facilities Table
CREATE TABLE Facilities (
    Facility_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Type VARCHAR(100),
    Cost DECIMAL(10,2),
    Availability_Status ENUM('Available', 'Not Available')
);

INSERT INTO Facilities (Name, Type, Cost, Availability_Status) VALUES
('MRI Scan', 'Diagnostic', 5000.00, 'Available'),
('ICU Bed', 'Emergency', 2000.00, 'Available'),
('X-Ray', 'Diagnostic', 1000.00, 'Available'),
('Operation Theatre', 'Surgical', 15000.00, 'Available'),
('Ambulance Service', 'Emergency', 3000.00, 'Not Available');

