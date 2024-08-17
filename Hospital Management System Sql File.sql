create database HospialManagement1;
use HospialManagement1;
CREATE TABLE Patients (
		PatientID INT PRIMARY KEY,
		FirstName VARCHAR(255),
		LastName VARCHAR(255),
		Gender CHAR(1),
		DateOfBirth DATE,
		ContactNumber VARCHAR(15),
		Email VARCHAR(255),
		Address TEXT,
		InsuranceID VARCHAR(50)
		
	);

	CREATE TABLE Doctors (
		DoctorID INT PRIMARY KEY,
		FirstName VARCHAR(255),
		LastName VARCHAR(255),
		Gender CHAR(1),
		DateOfBirth DATE,
		ContactNumber VARCHAR(15),
		Email VARCHAR(255),
		Specialization VARCHAR(255),
		WorkDays VARCHAR(255)
	);

	
	CREATE TABLE Staff (
		StaffID INT PRIMARY KEY,
		FirstName VARCHAR(255),
		LastName VARCHAR(255),
		Gender CHAR(1),
		DateOfBirth DATE,
		ContactNumber VARCHAR(15),
		Email VARCHAR(255),
		Role VARCHAR(50)
	);


	CREATE TABLE Appointments (
		AppointmentID INT PRIMARY KEY,
		PatientID INT,
		DoctorID INT,
		AppointmentDateTime DATETIME,
		Status VARCHAR(50),
		FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
		FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
	);

	
	CREATE TABLE Prescriptions (
		PrescriptionID INT PRIMARY KEY,
		PatientID INT,
		DoctorID INT,
		Medications TEXT,
		Dosage TEXT,
		Instructions TEXT,
		DatePrescribed DATE,
		FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
		FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
	);

	
	CREATE TABLE BillingInformation (
		BillID INT PRIMARY KEY,
		PatientID INT,
		TotalAmount DECIMAL(10, 2),
		PaymentStatus VARCHAR(50),
		BillingDate DATE,
		FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
	);


	CREATE TABLE InventoryMedicines (
		MedicineID INT PRIMARY KEY,
		MedicineName VARCHAR(255),
		BatchNumber VARCHAR(50),
		ExpirationDate DATE,
		QuantityAvailable INT,
		PricePerUnit DECIMAL(10, 2)
	);


	CREATE TABLE InventoryEquipment (
		EquipmentID INT PRIMARY KEY,
		EquipmentName VARCHAR(255),
		PurchaseDate DATE,
		MaintenanceDate DATE,
		AvailabilityStatus VARCHAR(50)
	);
    INSERT INTO Patients (PatientID, FirstName, LastName, Gender, DateOfBirth, ContactNumber, Email, Address, InsuranceID)
VALUES 
(1, 'John', 'Doe', 'M', '1985-05-15', '1234567890', 'john.doe@example.com', '123 Main St Cityville', 'INS123'),
(2, 'Alice', 'Smith', 'F', '1990-02-20', '9876543210', 'alice.smith@example.com', '456 Elm St Townsville', 'INS456'),
(3,'tanmay','sharnagat','M','2013-03-03','9165845678','tanmay@gmail.com','indore','INS345'),
(4,'priya','sharnagat','F','2003-03-03','9165843678','priya@gmail.com','katangi','INS346'),
(5,'pragya','dawar','F','2004-03-13','9325845678','pragya@gmail.com','barwani','INS347');


INSERT INTO Doctors (DoctorID, FirstName, LastName, Gender, DateOfBirth, ContactNumber, Email, Specialization, WorkDays)
VALUES 
(1, 'Dr. Robert', 'Johnson', 'M', '1978-10-10', '111-222-3333', 'robert.johnson@gmail.com', 'Cardiologist', 'Mon, Wed, Fri'),
(2, 'Dr. Emily', 'Williams', 'F', '1982-07-05', '444-555-6666', 'emily.williams@gmail.com', 'Pediatrician', 'Tue, Thu, Sat'),
(3, 'Dr. Shaili', 'Sharnagat', 'F', '2004-11-05', '123-555-6666', 'shaili@gmail.com', 'EyeSpecialist', 'Mon, Thu, Sat'),
(4, 'Dr. Ayushi', 'Dawar', 'F', '2003-07-05', '176-145-6666', 'ayushi@gmail.com', 'Physiologist', 'Tue, wed, Sat'),
(5, 'Dr. Niharika', 'Memoroth', 'F', '2005-03-11', '444-555-1234', 'Niharika@gmail.com', 'Neurologist', 'Tue, fri, Sat');
;



INSERT INTO Staff (StaffID, FirstName, LastName, Gender, DateOfBirth, ContactNumber, Email, Role)
VALUES 
(1, 'Tanushree', 'Dhote', 'F', '2003-06-06', '777-888-9999', 'tanushree@example.com', 'Nurse'),
(2, 'Anxiety', 'kumar', 'M', '2005-09-12', '111-333-5555', 'anxiety@example.com', 'receptionist'),
(3, 'ankit', 'Bhaskar', 'M', '2001-06-02', '222-333-5555', 'Aditya@example.com', 'Swipper'),
(4, 'Vikash', 'gupta', 'M', '2004-09-12', '1999-234-5555', 'Vikash@example.com', 'guard'),
(5, 'jayas', 'mahore', 'M', '2002-11-12', '934-333-5555', 'jayas@example.com', 'Receptionist');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDateTime, Status)
VALUES 
(1, 1, 1, '2023-10-15 10:00:00', 'Scheduled'),
(2, 2, 2, '2023-10-16 14:30:00', 'pending'),
(3, 3, 3, '2023-10-17 11:35:00', 'Scheduled'),
(4, 4, 4, '2023-10-18 10:00:00', 'pending'),
(5, 5, 5, '2023-10-19 16:00:00', 'Scheduled');

INSERT INTO Prescriptions (PrescriptionID, PatientID, DoctorID, Medications, Dosage, Instructions, DatePrescribed)
VALUES 
(1, 1, 1, 'Lisinopril', '10mg', 'Take once daily', '2023-10-15'),
(2, 2, 2, 'Albuterol', '2 puffs', 'As needed for wheezing', '2023-10-16'),
(3, 3, 3, 'surgery', '1mg', 'thrice once daily', '2024-01-01'),
(4, 4, 4, 'taltz','10mg',' daily', '2023-11-11'),
(5, 1, 1, 'cynopril', 'mg', 'Take once daily', '2023-10-15');

INSERT INTO BillingInformation (BillID, PatientID, TotalAmount, PaymentStatus, BillingDate)
VALUES
(1, 1, 150.00, 'Paid', '2023-10-15'),
(2, 2, 200.00, 'Unpaid', '2000-10-16'),
(3, 2, 330.00, 'paid', '2003-11-24'),
(4, 4, 019.00, 'Unpaid', '2004-05-16'),
(5, 1, 201.00, 'Unpaid', '2006-12-03');

INSERT INTO InventoryMedicines (MedicineID, MedicineName, BatchNumber, ExpirationDate, QuantityAvailable, PricePerUnit)
VALUES 
(1, 'Aspirin', 'ABC123', '2024-12-31', 500, 5.99),
(2, 'Amoxicillin', 'DEF456', '2023-11-30', 200, 8.75),
(3, 'paracuetamol', 'fd123', '1114-12-31', 640, 3.99),
(4, 'ativan', 'A13123', '2001-10-30', 120, 5.99),
(5, 'betadine', 'gdn143', '2009-12-30', 450, 2.99);

INSERT INTO InventoryEquipment (EquipmentID, EquipmentName, PurchaseDate, MaintenanceDate, AvailabilityStatus)
VALUES 
(1, 'X-ray Machine', '2022-01-15', '2023-07-15', 'Available'),
(2, 'memograph Machine', '2034-01-15', '2033-12-24', 'Available'),
(3, 'Ultrasound Machine', '2021-09-20', '2023-09-20', 'In Use'),
(4, 'sterilizers Machine', '2022-01-23', '2023-12-15', 'unAvailable'),
(5, 'sonography Machine', '2034-12-15', '2003-07-05', 'in use');

select * from patients;
select * from Doctors;
select * from Staff;
select * from Appointments;
select * from Prescriptions;
select * from BillingInformation;
select * from InventoryMedicines;


