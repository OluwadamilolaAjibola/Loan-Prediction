/*Importing of the dataset*/

create table loan(
	Loan_ID varchar (255) not null,
	Gender varchar (255) ,
	Married varchar (255),
	Dependents varchar (255),
	Education varchar (255),
	Self_Employed varchar (255),
	ApplicantIncome int ,
	CoapplicantIncome float ,
	LoanAmount float,
	Loan_Amount_Term float,
	Credit_History float,
	Property_Area varchar (255),
	Loan_Status varchar (255)
);
/* Code to view the created table */
select * 
from public.loan

/* Handling missing value*/

Update public.loan
set Gender = 'No Gender',
married = 'No Marital Status',
Credit_history = 0
where Gender is null or married is null or credit_history is null


delete from public.loan
where gender is null


/* The Analysis*/

/* Average LoanAmount by Gender*/

select Gender, avg(LoanAmount) as Avg_LoanAmount
from public.loan
group by Gender


/* Loan Approval Rate by Marital Status*/

select Married,
sum ( case when Loan_Status = 'Y' then 1 else 0 end) * 100.0 / count(*) as Approval_Rate
from public.loan
group by Married

/*Distribution of Loan Amount by Property Area*/
select property_area, avg(LoanAmount) as Avg_LoanAmount, count (*) as Count_Loans
from public.loan
group by property_area

/* Count of Loans by Education and Loan Status*/

select education, Loan_Status, count (*) as Count_Loans
from public.loan
group by 1,2

/*Loan Eligibility by Credit History*/

select credit_history,
sum(case when Loan_status = 'Y' then 1 else 0 end) as Approved,
sum(case when Loan_Status = 'N' then 1 else 0 end) as Rejected
from public.loan
group by 1