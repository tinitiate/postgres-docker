CREATE SCHEMA loans;
ALTER SCHEMA loans OWNER TO tinitiate;
set search_path=loans;
create table loans.loan_master
(
    loan_id    int
   ,loan_type  varchar(200)
   ,loan_desc  varchar(2000)
   ,PRIMARY KEY (loan_id)
);
create table loans.loan_rules
(
    loan_rule_id       int 
   ,loan_id            int 
   ,creditscore_limit  decimal 
   ,creditscore_offset decimal
   ,amount_limit       decimal  
   ,amount_offset      decimal
   ,interest           decimal
   ,duration_months    int 
   ,PRIMARY KEY (loan_rule_id)
   ,CONSTRAINT loan_rules_loan_id_fk
      FOREIGN KEY(loan_id)
    REFERENCES loan_master(loan_id)
);
create table loans.customer
(
    customer_id              int
   ,customer_name            varchar(200)
   ,application_date         date
   ,customer_creditscore     int
   ,customer_req_loanamount  decimal
   ,PRIMARY KEY (customer_id)
);
create table loans.customer_loans_status
( 
    customer_loan_id  int
   ,customer_id       int
   ,loan_id           int
   ,loan_status       varchar(200) 
   ,approved_interest decimal
   ,approved_duration_months int
   ,application_date  date
   ,notes             varchar(2000)
   ,PRIMARY KEY (customer_loan_id)
   ,CONSTRAINT customer_loans_loanid_fk
      FOREIGN KEY(loan_id)
    REFERENCES loan_master(loan_id)
   ,CONSTRAINT customer_loans_custid_fk
      FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)
);






