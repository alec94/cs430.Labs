set foreign_key_checks = 0;
drop table if exists Audit, CanTeach, Class, Enrolled, Phone, PreReq, Professor, Section, Student;
drop trigger Section_Delete, Section_Insert, Enrolled_Update, Student_Delete, Student_Insert;
drop view Classes_Offered;
set foreign_key_checks = 1;