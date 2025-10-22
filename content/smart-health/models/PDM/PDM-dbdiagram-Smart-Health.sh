// Smart Health - Relational Model (4NF Normalized)


Project SmartHealth {
  database_type: 'PostgreSQL'
  Note: '26 Tables - 4NF Normalized - Horizontal Layout'
}

//==============================================================================
// ROW 1: PATIENT CORE
//==============================================================================

Table patient {
  patient_id serial [pk, increment]
  first_name varchar(50) [not null]
  middle_name varchar(50)
  last_name varchar(50) [not null]
  maternal_surname varchar(50)
  birth_date date [not null]
  gender char(1) [not null]
  email varchar(100) [unique]
  registration_date timestamp [not null, default: `now()`]
  is_active boolean [not null, default: true]
}

Table document_type {
  document_type_id serial [pk, increment]
  code varchar(20) [not null, unique]
  name varchar(100) [not null]
  description text
}

Table patient_document {
  patient_id integer [ref: > patient.patient_id, not null]
  document_type_id integer [ref: > document_type.document_type_id, not null]
  document_number varchar(50) [not null]
  issuing_country char(2) [not null]
  issue_date date
  
  indexes {
    (patient_id, document_type_id) [pk]
  }
}

Table patient_address {
  address_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  address_type varchar(20) [not null]
  department varchar(50) [not null]
  municipality varchar(50) [not null]
  address_line varchar(200) [not null]
  latitude decimal(10,8)
  longitude decimal(11,8)
  postal_code varchar(20)
}

Table patient_phone {
  phone_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  phone_type varchar(20) [not null]
  number varchar(20) [not null]
  is_primary boolean [default: false]
}

//==============================================================================
// ROW 2: PATIENT EXTENDED
//==============================================================================

Table emergency_contact {
  contact_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  name varchar(100) [not null]
  relationship varchar(50) [not null]
  phone varchar(20) [not null]
  email varchar(100)
  instructions text
}

Table allergy {
  allergy_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  medication_id integer [ref: > medication.medication_id]
  allergy_type varchar(50) [not null]
  description varchar(200) [not null]
  severity varchar(20) [not null]
  registration_date timestamp [not null, default: `now()`]
}

Table policy {
  policy_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  insurance_id integer [ref: > insurance_company.insurance_id, not null]
  policy_number varchar(100) [not null, unique]
  coverage_summary text
  start_date date [not null]
  end_date date [not null]
  status varchar(20) [not null]
}

Table insurance_company {
  insurance_id serial [pk, increment]
  name varchar(200) [not null, unique]
  contact_name varchar(100)
  email varchar(100)
  phone varchar(20)
}

//==============================================================================
// ROW 3: PHYSICIAN CORE
//==============================================================================

Table physician {
  physician_id serial [pk, increment]
  internal_code varchar(20) [not null, unique]
  medical_license_number varchar(50) [not null, unique]
  first_name varchar(50) [not null]
  last_name varchar(50) [not null]
  professional_email varchar(100) [unique]
  hospital_admission_date date [not null]
  is_active boolean [not null, default: true]
}

Table specialty {
  specialty_id serial [pk, increment]
  code varchar(20) [not null, unique]
  name varchar(100) [not null]
  description text
}

Table physician_specialty {
  physician_id integer [ref: > physician.physician_id, not null]
  specialty_id integer [ref: > specialty.specialty_id, not null]
  assignment_date date [not null, default: `now()`]
  is_active boolean [not null, default: true]
  
  indexes {
    (physician_id, specialty_id) [pk]
  }
}

Table physician_address {
  address_id serial [pk, increment]
  physician_id integer [ref: > physician.physician_id, not null]
  address_type varchar(20) [not null]
  department varchar(50) [not null]
  municipality varchar(50) [not null]
  address_line varchar(200) [not null]
  office_hours varchar(100)
}

Table physician_phone {
  phone_id serial [pk, increment]
  physician_id integer [ref: > physician.physician_id, not null]
  phone_type varchar(20) [not null]
  number varchar(20) [not null]
}

//==============================================================================
// ROW 4: PHYSICIAN EXTENDED & APPOINTMENTS
//==============================================================================

Table physician_schedule {
  schedule_id serial [pk, increment]
  physician_id integer [ref: > physician.physician_id, not null]
  day_of_week smallint [not null]
  start_time time [not null]
  end_time time [not null]
  modality varchar(50)
}

Table appointment {
  appointment_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  physician_id integer [ref: > physician.physician_id, not null]
  room_id integer [ref: > room.room_id, not null]
  appointment_date date [not null]
  start_time time [not null]
  end_time time [not null]
  appointment_type varchar(50) [not null]
  status varchar(20) [not null]
  reason text
  created_by integer [ref: > user.user_id, not null]
  creation_date timestamp [not null, default: `now()`]
}

Table room {
  room_id serial [pk, increment]
  code varchar(20) [not null, unique]
  name varchar(100) [not null]
  room_type varchar(50) [not null]
  capacity integer [not null]
  is_active boolean [not null, default: true]
}

Table user {
  user_id serial [pk, increment]
  username varchar(50) [not null, unique]
  email varchar(100) [not null, unique]
  role varchar(50) [not null]
  is_active boolean [not null, default: true]
  creation_date timestamp [not null, default: `now()`]
}

//==============================================================================
// ROW 5: MEDICAL RECORDS CORE
//==============================================================================

Table medical_record {
  record_id serial [pk, increment]
  patient_id integer [ref: > patient.patient_id, not null]
  professional_id integer [ref: > physician.physician_id, not null]
  appointment_id integer [ref: > appointment.appointment_id]
  record_timestamp timestamp [not null, default: `now()`]
  record_type varchar(50) [not null]
  summary_text text [not null]
  structured_summary jsonb
  primary_diagnosis_id integer [ref: > diagnosis.diagnosis_id]
  integrity_hash varchar(64)
}

Table diagnosis {
  diagnosis_id serial [pk, increment]
  icd_code varchar(10) [not null, unique]
  description varchar(500) [not null]
  version varchar(10) [not null]
}

Table record_diagnosis {
  record_id integer [ref: > medical_record.record_id, not null]
  diagnosis_id integer [ref: > diagnosis.diagnosis_id, not null]
  diagnosis_type varchar(20) [not null]
  observations text
  
  indexes {
    (record_id, diagnosis_id) [pk]
  }
}

Table vital_sign {
  vital_sign_id serial [pk, increment]
  record_id integer [ref: > medical_record.record_id, not null]
  sign_type varchar(50) [not null]
  value decimal(10,2) [not null]
  unit varchar(20) [not null]
  measurement_timestamp timestamp [not null, default: `now()`]
}

//==============================================================================
// ROW 6: MEDICATIONS & AUDIT
//==============================================================================

Table medication {
  medication_id serial [pk, increment]
  atc_code varchar(20) [unique]
  brand_name varchar(100) [not null]
  active_ingredient varchar(200) [not null]
  presentation varchar(100) [not null]
  version varchar(10) [not null]
}

Table prescription {
  prescription_id serial [pk, increment]
  record_id integer [ref: > medical_record.record_id, not null]
  medication_id integer [ref: > medication.medication_id, not null]
  professional_id integer [ref: > physician.physician_id, not null]
  dosage varchar(100) [not null]
  frequency varchar(100) [not null]
  duration varchar(50) [not null]
  instructions text
  prescription_date timestamp [not null, default: `now()`]
  is_validated boolean [default: false]
}

Table procedure {
  procedure_id serial [pk, increment]
  code varchar(20) [not null, unique]
  description varchar(500) [not null]
  reference_price decimal(10,2)
}

Table audit_log {
  audit_id serial [pk, increment]
  user_id integer [ref: > user.user_id, not null]
  role varchar(50) [not null]
  entity varchar(50) [not null]
  entity_id integer [not null]
  action varchar(20) [not null]
  details jsonb
  timestamp timestamp [not null, default: `now()`]
  ip_address varchar(45)
  application varchar(100)
}