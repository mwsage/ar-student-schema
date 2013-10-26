validations and associations go in the model

model should be singular of the table name

read the validations and associations docs

only in a one to many relationship can you call a function like
  teacher.student - this is an instance(of teacher) and an object(student)

in a many to many the singular becomes plural
  teacher.students

For has and belongs to many relationship (not just any many to many): 
  when creating a mtm join table the table name is ordered alphabetically
    (this is a strong assumption but not verified in docs, but did solve
      an error)
    teachers_students is incorrect
    students_teachers is correct


