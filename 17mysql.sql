#Create a function to calculate the number of days a project is overdue:
CREATE FUNCTION DaysOverdue (projectId INT) RETURNS INT
BEGIN
    DECLARE daysOverdue INT;
    SELECT DATEDIFF(CURDATE(), Deadline) INTO daysOverdue
    FROM Projects
    WHERE ProjectID = projectId AND Deadline < CURDATE();
    RETURN daysOverdue;
END;