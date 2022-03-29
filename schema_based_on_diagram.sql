CREATE TABLE medical_histories(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted timestamp without time zone NOT NULL
   DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
  patient_id INT NOT NULL,
  status VARCHAR(50) NOT NULL
);










