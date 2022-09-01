CREATE TABLE Patients (
  id int,
  name varchar,
  date_of_birth date,
  PRIMARY KEY (id)
  CONSTRAINT fk_patient_id FOREIGN KEY(id) REFERENCES medical_histories(patient_id)
);

CREATE TABLE invoice_items (
  id int,
  unit_price decimal,
  quantity int,
  total_price decimal,
  invoice_id int,
  treatment_id int,
  PRIMARY KEY (id)
  CONSTRAINT fk_invoice_id FOREIGN KEY(invoice_id) REFERENCES invoices(id)
  CONSTRAINT fk_treatment_id FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id int,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int,
  PRIMARY KEY (id)
  CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories (
  id int,
  admitted_at timestamp,
  patient_id int,
  status varchar,
  PRIMARY KEY (id)
  CONSTRAINT fk_medical_history FOREIGN KEY(id) REFERENCES treatments(id)
);

CREATE INDEX  ON  medical_histories (admitted_at);

CREATE TABLE treatments (
  id int,
  type varchar,
  name varchar,
  PRIMARY KEY (id)
  CONSTRAINT fk_id FOREIGN KEY(id) REFERENCES medical_histories(id)
);