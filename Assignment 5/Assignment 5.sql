

--(1).inner join

a)Inner join Student and Teacher based on Subjects

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student inner join
	teacher on
	student.subjects=teacher.subjects;


b) Inner join student and teacher based on TeacherName 

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student inner join
	teacher on
	student.subjects=teacher.subjects and
	teacher.TeacherName like 'U%';

c) inner join student and teacher based on Teacher_id >3

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student inner join
	teacher on
	student.subjects=teacher.subjects and
	teacher.Teacher_id >3;

--(2).Left join

a) Left join Student and Teacher based on Subjects

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student left join
	teacher on
	student.subjects=teacher.subjects;
    
b) Left join student and teacher based on TeacherName 

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student left join
	teacher on
	student.subjects=teacher.subjects and
	teacher.TeacherName like 'U%';

c) Left join student and teacher based on Teacher_id >3

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student left join
	teacher on
	student.subjects=teacher.subjects and
	teacher.Teacher_id >3;

--(3). Right outer Joins

a) Right outer joins Student and Teacher based on Subjects

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student right join
	teacher on
	student.subjects=teacher.subjects;

b) Right outer joins student and teacher based on TeacherName 

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student right join
	teacher on
	student.subjects=teacher.subjects and
	teacher.TeacherName like 'U%';

c) Right Outer joins student and teacher based on Teacher_id >3

	use School;
	select student.StudentName, teacher.TeacherName
	subjects from student right join
	teacher on
	student.subjects=teacher.subjects and
	teacher.Teacher_id >3;




