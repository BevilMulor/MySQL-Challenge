#Create a function to calculate the number of days remaining until a project deadline:
CREATE FUNCTION DaysUntilDeadline (projectId INT) RETURNS INT
BEGIN
    DECLARE daysRemaining INT;
    SELECT DATEDIFF(Deadline, CURDATE()) INTO daysRemaining
    FROM Projects
    WHERE ProjectID = projectId;
    RETURN daysRemaining;
END;