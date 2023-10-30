CREATE TABLE [Schedule] (
	id int NOT NULL,
	work_time date NOT NULL,
	room_id int NOT NULL,
  CONSTRAINT [PK_SCHEDULE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Patient] (
	id int NOT NULL UNIQUE,
	name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(12) NOT NULL,
	address varchar(50) NOT NULL,
	comment varchar(250) NOT NULL,
  CONSTRAINT [PK_PATIENT] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Reception] (
	id int NOT NULL,
	reg_journal_id int NOT NULL,
	staff_id int NOT NULL,
  CONSTRAINT [PK_RECEPTION] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Doctor] (
	id int NOT NULL,
	name varchar(MAX) NOT NULL,
	email varchar(MAX) NOT NULL,
	phone varchar(MAX) NOT NULL,
	comment varchar(MAX) NOT NULL,
  CONSTRAINT [PK_DOCTOR] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Department] (
	id int NOT NULL,
	department_name varchar(MAX) NOT NULL,
	room_id int NOT NULL,
	doctor_id int NOT NULL,
	shedule_id int NOT NULL,
  CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Insurance_policy] (
	id int NOT NULL,
	patient_id int NOT NULL,
	insurance_policy_num int NOT NULL UNIQUE,
	expire_from datetime NOT NULL,
	expire_to datetime NOT NULL,
	insurance_company varchar NOT NULL,
  CONSTRAINT [PK_INSURANCE_POLICY] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Medical_card] (
	id int NOT NULL,
	patient_id int NOT NULL,
	medical_card_num int NOT NULL UNIQUE,
	analysis_id int NOT NULL,
	desease_id int NOT NULL,
	diagnosis_id int NOT NULL,
	insurance_policy_id int NOT NULL,
	card_reg_date datetime NOT NULL,
  CONSTRAINT [PK_MEDICAL_CARD] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Reg_journal] (
	id int NOT NULL,
	medical_card_id int NOT NULL,
	departament_id int NOT NULL,
	insurance_policy int NOT NULL,
	medical_card int NOT NULL,
	reg_date datetime NOT NULL,
	exit_date datetime NOT NULL,
  CONSTRAINT [PK_REG_JOURNAL] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Staff] (
	id int NOT NULL UNIQUE,
	name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(12) NOT NULL,
  CONSTRAINT [PK_STAFF] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Analysis] (
	id int NOT NULL,
	room varchar NOT NULL,
	appointment_date date NOT NULL,
  CONSTRAINT [PK_ANALYSIS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Desease] (
	id int NOT NULL,
	ICD10_code varchar NOT NULL UNIQUE,
	description varchar NOT NULL,
	prognose varchar NOT NULL,
  CONSTRAINT [PK_DESEASE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Hospital] (
	id int NOT NULL,
	room int NOT NULL,
	reg_date datetime NOT NULL,
  CONSTRAINT [PK_HOSPITAL] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Ambulatory] (
	id int NOT NULL,
	reg_date datetime NOT NULL,
  CONSTRAINT [PK_AMBULATORY] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Room] (
	id int NOT NULL,
	capacity int NOT NULL,
	description varchar NOT NULL,
  CONSTRAINT [PK_ROOM] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Recipy_journal] (
	id int NOT NULL,
	medical_card_id int NOT NULL,
	departament_id int NOT NULL,
	reg_date datetime NOT NULL,
	analysis_id int NOT NULL,
	desease_id int NOT NULL,
	diagnosis_id int NOT NULL,
  CONSTRAINT [PK_RECIPY_JOURNAL] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Diagnosis] (
	id int NOT NULL,
	ICD10_code varchar NOT NULL,
  CONSTRAINT [PK_DIAGNOSIS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Discharge_journal] (
	id int NOT NULL,
	staff_id int NOT NULL,
	medical_card_id int NOT NULL,
	hospital_id int NOT NULL,
	ambulatory_id int NOT NULL,
	discharge_date datetime NOT NULL,
  CONSTRAINT [PK_DISCHARGE_JOURNAL] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Schedule] WITH CHECK ADD CONSTRAINT [Schedule_fk0] FOREIGN KEY ([room_id]) REFERENCES [Room]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Schedule] CHECK CONSTRAINT [Schedule_fk0]
GO


ALTER TABLE [Reception] WITH CHECK ADD CONSTRAINT [Reception_fk0] FOREIGN KEY ([reg_journal_id]) REFERENCES [Reg_journal]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reception] CHECK CONSTRAINT [Reception_fk0]
GO
ALTER TABLE [Reception] WITH CHECK ADD CONSTRAINT [Reception_fk1] FOREIGN KEY ([staff_id]) REFERENCES [Staff]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reception] CHECK CONSTRAINT [Reception_fk1]
GO


ALTER TABLE [Department] WITH CHECK ADD CONSTRAINT [Department_fk0] FOREIGN KEY ([room_id]) REFERENCES [Room]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Department] CHECK CONSTRAINT [Department_fk0]
GO
ALTER TABLE [Department] WITH CHECK ADD CONSTRAINT [Department_fk1] FOREIGN KEY ([doctor_id]) REFERENCES [Doctor]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Department] CHECK CONSTRAINT [Department_fk1]
GO
ALTER TABLE [Department] WITH CHECK ADD CONSTRAINT [Department_fk2] FOREIGN KEY ([shedule_id]) REFERENCES [Schedule]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Department] CHECK CONSTRAINT [Department_fk2]
GO

ALTER TABLE [Insurance_policy] WITH CHECK ADD CONSTRAINT [Insurance_policy_fk0] FOREIGN KEY ([patient_id]) REFERENCES [Patient]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Insurance_policy] CHECK CONSTRAINT [Insurance_policy_fk0]
GO

ALTER TABLE [Medical_card] WITH CHECK ADD CONSTRAINT [Medical_card_fk0] FOREIGN KEY ([patient_id]) REFERENCES [Patient]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Medical_card] CHECK CONSTRAINT [Medical_card_fk0]
GO
ALTER TABLE [Medical_card] WITH CHECK ADD CONSTRAINT [Medical_card_fk1] FOREIGN KEY ([analysis_id]) REFERENCES [Analysis]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Medical_card] CHECK CONSTRAINT [Medical_card_fk1]
GO
ALTER TABLE [Medical_card] WITH CHECK ADD CONSTRAINT [Medical_card_fk2] FOREIGN KEY ([desease_id]) REFERENCES [Desease]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Medical_card] CHECK CONSTRAINT [Medical_card_fk2]
GO
ALTER TABLE [Medical_card] WITH CHECK ADD CONSTRAINT [Medical_card_fk3] FOREIGN KEY ([diagnosis_id]) REFERENCES [Diagnosis]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Medical_card] CHECK CONSTRAINT [Medical_card_fk3]
GO
ALTER TABLE [Medical_card] WITH CHECK ADD CONSTRAINT [Medical_card_fk4] FOREIGN KEY ([insurance_policy_id]) REFERENCES [Insurance_policy]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Medical_card] CHECK CONSTRAINT [Medical_card_fk4]
GO

ALTER TABLE [Reg_journal] WITH CHECK ADD CONSTRAINT [Reg_journal_fk0] FOREIGN KEY ([medical_card_id]) REFERENCES [Medical_card]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reg_journal] CHECK CONSTRAINT [Reg_journal_fk0]
GO
ALTER TABLE [Reg_journal] WITH CHECK ADD CONSTRAINT [Reg_journal_fk1] FOREIGN KEY ([departament_id]) REFERENCES [Department]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reg_journal] CHECK CONSTRAINT [Reg_journal_fk1]
GO
ALTER TABLE [Reg_journal] WITH CHECK ADD CONSTRAINT [Reg_journal_fk2] FOREIGN KEY ([insurance_policy]) REFERENCES [Insurance_policy]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reg_journal] CHECK CONSTRAINT [Reg_journal_fk2]
GO
ALTER TABLE [Reg_journal] WITH CHECK ADD CONSTRAINT [Reg_journal_fk3] FOREIGN KEY ([medical_card]) REFERENCES [Medical_card]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reg_journal] CHECK CONSTRAINT [Reg_journal_fk3]
GO
ALTER TABLE [Reg_journal] WITH CHECK ADD CONSTRAINT [Reg_journal_fk4] FOREIGN KEY ([exit_date]) REFERENCES [Discharge_journal]([discharge_date])
ON UPDATE CASCADE
GO
ALTER TABLE [Reg_journal] CHECK CONSTRAINT [Reg_journal_fk4]
GO




ALTER TABLE [Hospital] WITH CHECK ADD CONSTRAINT [Hospital_fk0] FOREIGN KEY ([room]) REFERENCES [Room]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Hospital] CHECK CONSTRAINT [Hospital_fk0]
GO



ALTER TABLE [Recipy_journal] WITH CHECK ADD CONSTRAINT [Recipy_journal_fk0] FOREIGN KEY ([medical_card_id]) REFERENCES [Medical_card]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Recipy_journal] CHECK CONSTRAINT [Recipy_journal_fk0]
GO
ALTER TABLE [Recipy_journal] WITH CHECK ADD CONSTRAINT [Recipy_journal_fk1] FOREIGN KEY ([departament_id]) REFERENCES [Department]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Recipy_journal] CHECK CONSTRAINT [Recipy_journal_fk1]
GO
ALTER TABLE [Recipy_journal] WITH CHECK ADD CONSTRAINT [Recipy_journal_fk2] FOREIGN KEY ([analysis_id]) REFERENCES [Analysis]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Recipy_journal] CHECK CONSTRAINT [Recipy_journal_fk2]
GO
ALTER TABLE [Recipy_journal] WITH CHECK ADD CONSTRAINT [Recipy_journal_fk3] FOREIGN KEY ([desease_id]) REFERENCES [Desease]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Recipy_journal] CHECK CONSTRAINT [Recipy_journal_fk3]
GO
ALTER TABLE [Recipy_journal] WITH CHECK ADD CONSTRAINT [Recipy_journal_fk4] FOREIGN KEY ([diagnosis_id]) REFERENCES [Diagnosis]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Recipy_journal] CHECK CONSTRAINT [Recipy_journal_fk4]
GO


ALTER TABLE [Discharge_journal] WITH CHECK ADD CONSTRAINT [Discharge_journal_fk0] FOREIGN KEY ([staff_id]) REFERENCES [Staff]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Discharge_journal] CHECK CONSTRAINT [Discharge_journal_fk0]
GO
ALTER TABLE [Discharge_journal] WITH CHECK ADD CONSTRAINT [Discharge_journal_fk1] FOREIGN KEY ([medical_card_id]) REFERENCES [Medical_card]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Discharge_journal] CHECK CONSTRAINT [Discharge_journal_fk1]
GO
ALTER TABLE [Discharge_journal] WITH CHECK ADD CONSTRAINT [Discharge_journal_fk2] FOREIGN KEY ([hospital_id]) REFERENCES [Hospital]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Discharge_journal] CHECK CONSTRAINT [Discharge_journal_fk2]
GO
ALTER TABLE [Discharge_journal] WITH CHECK ADD CONSTRAINT [Discharge_journal_fk3] FOREIGN KEY ([ambulatory_id]) REFERENCES [Ambulatory]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Discharge_journal] CHECK CONSTRAINT [Discharge_journal_fk3]
GO

