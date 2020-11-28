use carzz_insurance;

-- 1st Queire
(SELECT * FROM  grp6_____customer JOIN grp6_____vehicle ON grp6_____customer.Customer_ID= grp6_____vehicle.Customer_ID 
WHERE grp6_____customer. Customer_ID IN
	(SELECT Customer_ID FROM grp6____policy_claim WHERE CLAIM_STATUS = 'PENDING'));

-- 2nd Queire
select * from Grp6_____CUSTOMER inner join GRP6_____PREMIUM_PAYMENT on 
Grp6_____CUSTOMER.Customer_ID=GRP6_____PREMIUM_PAYMENT.Customer_ID where
 GRP6_____PREMIUM_PAYMENT.Premium_Amount > (select Sum(Customer_ID) from Grp6_____CUSTOMER);

-- 3rd queire
SELECT * FROM grp6_____insurance_company 
WHERE company_id 
in(SELECT DISTINCT grp6_____products_details.company_id 
FROM grp6_____products_details,  grp6_____department 
WHERE  grp6_____products_details.NO_OF_PRODUCTS > grp6_____department.NO_OF_DEPARTMENTS 
AND  grp6_____department.LOCATION IN   (SELECT DISTINCT LOCATION FROM  grp6_____department));

-- 4th Queire
SELECT * FROM Grp6_____CUSTOMER WHERE Customer_ID IN (SELECT Customer_ID 
FROM Grp6_____VEHICLE GROUP BY(Customer_ID) HAVING count(Vehicle_ID) >=2 
AND Customer_ID IN (SELECT Customer_ID FROM GRP6_____PREMIUM_PAYMENT WHERE Premium_Amount = 0));

-- 5th Queire
SELECT * FROM  grp6_____vehicle JOIN grp6_____premium_payment 
ON grp6_____vehicle.Customer_ID = grp6_____premium_payment.Customer_ID 
AND grp6_____vehicle.Vehicle_Id < grp6_____premium_payment.Premium_Amount ;


-- 6th Queire
Select * from grp6_____customer where  Customer_ID 
IN (SELECT DISTINCT(grp6____policy_claim.Customer_ID)
FROM grp6____policy_claim, grp6_____claim_settlement, grp6_____coverage
WHERE
Claim_Amount > Claim_Settlement_Id + Vehicle_Id 
+grp6____policy_claim .Claim_Id 
+ grp6____policy_claim.Customer_ID
AND Claim_Amount < Amount_Paid)  -- (AMOUNT_PAID = COVERAGE_ AMOUNT)