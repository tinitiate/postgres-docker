COPY loan_rules(loan_rule_id, loan_id, creditscore_limit, creditscore_offset, amount_limit, amount_offset, interest, duration_months)
FROM 'loan_rules.csv'
DELIMITER ','
CSV HEADER;
