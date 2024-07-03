#Create a stored procedure to update project team members (remove existing, add new ones):
CREATE PROCEDURE UpdateProjectTeam (
    IN projectID INT,
    IN newMembers TEXT
)
BEGIN
    -- Remove existing team members
    DELETE FROM TeamMembers WHERE ProjectID = projectID;

    -- Add new team members
    -- Assuming newMembers is a comma-separated string of EmployeeIDs
    DECLARE i INT DEFAULT 0;
    DECLARE memberID INT;
    DECLARE numMembers INT;

    SET numMembers = (LENGTH(newMembers) - LENGTH(REPLACE(newMembers, ',', '')) + 1);
    
    WHILE i < numMembers DO
        SET memberID = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(newMembers, ',', i + 1), ',', -1) AS UNSIGNED);
        INSERT INTO TeamMembers (ProjectID, EmployeeID) VALUES (projectID, memberID);
        SET i = i + 1;
    END WHILE;
END;