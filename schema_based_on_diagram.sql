/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id int PRIMARY KEY,
    name varchar,
    date_of_birth date
);


CREATE TABLE medical_histories (
    id int PRIMARY KEY,
    admitted_at timestamp,
    patient_id int,
    status varchar,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
    id int PRIMARY KEY,
    type varchar,
    name varchar
);

CREATE TABLE invoices (
    id int PRIMARY KEY,
    total_amount numeric,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id int PRIMARY KEY,
    unit_price numeric,
    quantity int,
    total_price numeric,
    invoice_id int,
    treatment_id int,
    FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatment_histories (
    medical_history_id int,
    treatment_id int,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);
