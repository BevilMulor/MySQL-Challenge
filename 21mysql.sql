#Create a trigger to log any updates made to project records in a separate table for auditing purposes:
CREATE TABLE ProjectAuditLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID INT,
    OldProjectName VARCHAR(255),
    NewProjectName VARCHAR(255),
    OldRequirements TEXT,
    NewRequirements TEXT,
    OldDeadline DATE,
    NewDeadline DATE,
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER ProjectUpdateLog
AFTER UPDATE ON Projects
FOR EACH ROW
BEGIN
    INSERT INTO ProjectAuditLog (ProjectID, OldProjectName, NewProjectName, OldRequirements, NewRequirements, OldDeadline, NewDeadline)
    VALUES (OLD.ProjectID, OLD.ProjectName, NEW.ProjectName, OLD.Requirements, NEW.Requirements, OLD.Deadline, NEW.Deadline);
END;
