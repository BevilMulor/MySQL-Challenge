__Create a trigger to ensure a team lead assigned to a project is a valid employee:
CREATE TRIGGER ValidateTeamLead
BEFORE INSERT ON ProjectTeam
FOR EACH ROW
BEGIN
    IF (NEW.TeamLead = TRUE) AND 
       ((SELECT COUNT(*) FROM Employees WHERE EmployeeID = NEW.EmployeeID) = 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Team lead must be a valid employee';
    END IF;
END;