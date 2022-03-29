CREATE TABLE medical_histories(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
  patient_id INT NOT NULL,
  status VARCHAR(50) NOT NULL
);

CREATE TABLE treatments(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE invoice_items(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL
);

CREATE TABLE invoices(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL NOT NULL,
  generated_at timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
  payed_at timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
  medical_history_id INT NOT NULL
);

CREATE TABLE patients(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL
);



