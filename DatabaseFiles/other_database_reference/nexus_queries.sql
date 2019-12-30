-- List of all employees
SELECT *
FROM Employee;

-- List of managers
SELECT *
FROM Employee
WHERE Employee.EmployeeID IN(
SELECT ManagerID
FROM Employee_Manager
);


-- Manger and their underlings
SELECT CONCAT(FName, ' ', LName) AS "Walter Whites Meth Monkeys"
FROM Employee
JOIN (
    SELECT EmployeeID
    FROM Employee_Manager
        WHERE ManagerID IN (
            SELECT EmployeeID
            FROM Employee
            WHERE FName = 'Walter' AND LName = 'White'
    )
) AS deriv
USING(EmployeeID);


-- List of projects
SELECT *
FROM Project;


-- List of milestones for a project
SELECT MilestoneName AS "Milestone", MilestoneDescription AS "Description"
FROM Milestone
WHERE MilestoneName IN (

    SELECT MilestoneName
    FROM Project_Milestone
    WHERE ProjectID IN (

            SELECT ProjectID
            FROM Project
            WHERE ProjectName = "Butcher Shop Website"
    )
);


-- List of clients
SELECT CONCAT(FName, ' ', LName) AS "Client Name", BillingAddress AS Street, CityName AS City, StateName AS "State", Client.ZIP
FROM Client INNER JOIN ZipCode ON Client.ZIP = ZipCode.ZIP
ORDER BY FName ASC;


-- List of projects requested by client
SELECT ProjectName
AS "Amalia Clemintonis Projects"
FROM Project p INNER JOIN Client c ON p.ClientID = c.ClientID
WHERE c.FName = "Amalia" AND c.LName = "Clemintoni";


-- List of employee’s paychecks
SELECT CONCAT(PayPeriodStart, ' to ', PayPeriodEnd) AS "Pay Period", Hours
FROM Paycheck p INNER JOIN Employee e ON p.EmployeeID = e.EmployeeID
WHERE e.FName = "Orpheus" AND e.LName = "Millander";


-- List of employees who started on certain date
SELECT CONCAT(FName, ' ', LName) AS "Employee",
    HireDate AS "Hired in January 2017"
    FROM Employee
WHERE MONTH(HireDate) = 01 AND YEAR(HireDate) = 2017;


-- List of completed projects
SELECT *
FROM Project  
WHERE EndDate IS NOT NULL;


-- List of total hours from all projects
SELECT Sum(TotalHours) AS TotalHours_AllProjects
FROM Project;


-- Invoices for a project
SELECT InvoiceDate, Cost
FROM Invoice i
    INNER JOIN Project p ON i.ProjectID = p.ProjectID
WHERE ProjectName = "Project Westchester";


-- Project with greatest completion range (most hours spent on it)
SELECT *
FROM Project
WHERE TotalHours =
    (SELECT MAX(TotalHours)
     FROM Project);

-- List of project costs (cost update history)
SELECT Amount, CostUpdateDate, Description
FROM CostUpdate cu
    INNER JOIN Invoice i ON cu.InvoiceID = i.InvoiceID
    INNER JOIN Project p ON i.ProjectID = p.ProjectID
WHERE ProjectName = "Project Westchester";

-- Revenue to date for the company
SELECT ROUND(SUM(AmountPaid), 0) AS TotalRevenue
FROM Invoice;

-- Employee year to date pay (in 2018)
-- for wage employees (orpheus millander, id 3)
SELECT SUM(p.Hours * ph.Wage) AS "YTD Pay"
FROM Paycheck p
    INNER JOIN PayHistory ph ON p.EmployeeID = ph.EmployeeID
    INNER JOIN Employee e ON ph.EmployeeID = e.EmployeeID
WHERE e.FName = "Orpheus" AND e.LName = "Millander" AND YEAR(p.CheckDate) = 2018
AND Wage IN (SELECT Wage
                FROM PayHistory
                WHERE e.FName = "Orpheus" AND e.LName = "Millander" AND DateEnd IS NULL AND Wage IS NOT NULL);

-- for salary employees (francis turecek, id 10)
SELECT ROUND(SUM(salary/24), 2) AS "YTD Pay"
FROM Paycheck p
    INNER JOIN PayHistory ph ON p.EmployeeID = ph.EmployeeID
    INNER JOIN Employee e ON ph.EmployeeID = e.EmployeeID
WHERE e.FName = "Francis" AND e.LName = "Turecek" AND YEAR(p.CheckDate) = 2018
AND Salary IN (SELECT Salary
                FROM PayHistory
                WHERE e.FName = "Francis" AND e.LName = "Turecek" AND DateEnd IS NULL AND Salary IS NOT NULL);


-- Employee(s) with longest position history (have worked the longest)
SELECT *
FROM Employee
WHERE HireDate = (
            SELECT Min(HireDate)
            FROM Employee
);


-- List of all employees at a certain position(quartermaster)
SELECT e.FName, e.LName
FROM Employee e
    INNER JOIN PositionHistory ph ON e.EmployeeID = ph.EmployeeID
    INNER JOIN PositionDescription pd ON ph.PositionTitleID = pd.PositionTitleID
WHERE PositionTitle = 'Quartermaster';


-- List of everyone who makes above a certain pay
 -- employee with wage above $30/hr
SELECT CONCAT(FName, " ", LName) AS "Employee With Wage Above $30/hr", Wage
FROM Employee e
    INNER JOIN PayHistory ph ON e.EmployeeID = ph.EmployeeID
WHERE ph.DateEnd IS NULL AND wage > 30;


 -- employee with salary above $70,000
SELECT CONCAT(FName, " ", LName) AS "Employee With Salary Above $70,000", Salary
FROM Employee e
    INNER JOIN PayHistory ph ON e.EmployeeID = ph.EmployeeID
WHERE ph.DateEnd IS NULL AND salary > 70000;


-- Everyone who makes below a certain pay
 -- employee with wage below $30/hr
SELECT CONCAT(FName, " ", LName) AS "Employee With Wage Below $30/hr", Wage
FROM Employee e
    INNER JOIN PayHistory ph ON e.EmployeeID = ph.EmployeeID
WHERE ph.DateEnd IS NULL AND wage < 30;


 -- employee with salary below $70,000
SELECT CONCAT(FName, " ", LName) AS "Employee With Salary Below $70,000", Salary
FROM Employee e
    INNER JOIN PayHistory ph ON e.EmployeeID = ph.EmployeeID
WHERE ph.DateEnd IS NULL AND salary < 70000;


-- List of employees at a given role in a project
SELECT FName AS FirstName, LName AS LastName
FROM Project p
    INNER JOIN Project_Employee p_e ON p.ProjectID = p_e.ProjectID
    INNER JOIN Employee e ON p_e.EmployeeID = e.EmployeeID
WHERE ProjectName = "Project Westchester" AND EmployeeRole = "Project Lead";


-- Show all projects and total cost
SELECT ProjectName, TotalCost
FROM Project
UNION
SELECT '***TOTAL-COST-ALL-PROJECTS***', SUM(TotalCost) AS AllProjectsTotalCost
FROM Project;


-- Show all current projects . . . projects that have not been completed
SELECT *
FROM Project
WHERE EndDate IS NULL;
