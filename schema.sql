/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id int PRIMARY KEY,
    name varchar,
    date_of_birth date,
);


CREATE TABLE medical_histories (
    id int PRIMARY KEY,
    admitted_at timestamp,
    patient_id int FOREIGN KEY REFERENCES patients(id),
    status varchar,
);

CREATE TABLE treatments (
    id int PRIMARY KEY,
    type varchar,
    name varchar,
);
