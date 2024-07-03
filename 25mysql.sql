#Create a trigger to prevent deleting a project that still has assigned team members:
CREATE TRIGGER PreventProjectDeletion
BEFORE DELETE ON Projects
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM TeamMembers WHERE ProjectID = OLD.ProjectID) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete project with assigned team members';
    END IF;
END;