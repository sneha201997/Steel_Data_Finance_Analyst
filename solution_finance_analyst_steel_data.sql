/*1. What are the names of all the customers who live in New York?*/

select concat(FirstName,' ',LastName) as name
from customers
where City='New York';

/*2. What is the total number of accounts in the Accounts table?*/

select count(distinct AccountID) 
from accounts;

/*3. What is the total balance of all checking accounts?*/

select sum(Balance)
from accounts
where AccountType='Checking';

/*4. What is the total balance of all accounts associated with customers who live in Los Angeles?*/

select sum(Balance)
from accounts a 
join customers c on a.CustomerID=c.CustomerID
where City= 'Los Angeles';

/*5. Which branch has the highest average account balance?*/

select BranchName, avg(Balance) as avg_bal
from accounts a 
join branches b on a.BranchID=b.BranchID
group by BranchName
order by avg_bal desc
limit 1;

/*6. Which customer has the highest current balance in their accounts?*/

select a.CustomerID, concat(FirstName,' ', LastName), sum(Balance) as total_bal
from accounts a 
join customers c on a.CustomerID=c.CustomerID
group by a.CustomerID
order by total_bal desc
limit 1;

/*7. Which customer has made the most transactions in the Transactions table?*/

select FirstName, count(t.AccountID) as total_count
from accounts a 
join customers c on a.CustomerID=c.CustomerID
join transactions t on a.AccountID=t.AccountID
group by FirstName
order by total_count desc;

/*8.Which branch has the highest total balance across all of its accounts?*/

select a.BranchID, BranchName, sum(Balance) as total_bal
from accounts a 
join branches b on a.BranchID=b.BranchID
group by 1, 2
order by total_bal desc
limit 1; 

/*9. Which customer has the highest total balance across all of their accounts, 
including savings and checking accounts?*/

select a.CustomerID, FirstName, sum(Balance) as total_bal
from accounts a 
join customers c on a.CustomerID=c.CustomerID
where AccountType in ('Checking', 'Savings')
group by 1,2
order by total_bal desc
limit 1; 

/*10. Which branch has the highest number of transactions in the Transactions table?*/

select BranchName, count(TransactionID) total_count
from accounts a 
join branches b on a.BranchID=b.BranchID
join transactions t on a.AccountID=t.AccountID
group by 1
order by total_count desc;
