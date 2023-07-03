# frozen_string_literal: true

# Create teachers
teacher1 = Teacher.create(name: 'John River')
teacher2 = Teacher.create(name: 'Peter Walley')

# Create subjects
subject1 = Subject.create(name: 'Math')
subject2 = Subject.create(name: 'Chemistry')

# Create classrooms
classroom1 = Classroom.create(name: '101')
classroom2 = Classroom.create(name: '102')

# Create students
Student.create(name: 'Alex Rainbow')
Student.create(name: 'Ann Summer')

# Create sections
Section.create(
  teacher: teacher1,
  subject: subject1,
  classroom: classroom1,
  days_of_week: %i[monday wednesday friday],
  start_time: Time.parse('08:00AM'),
  duration: 80
)

Section.create(
  teacher: teacher2,
  subject: subject2,
  classroom: classroom2,
  days_of_week: %i[tuesday thursday],
  start_time: Time.parse('02:00PM'),
  duration: 50
)

Section.create(
  teacher: teacher2,
  subject: subject2,
  classroom: classroom2,
  days_of_week: [:wednesday],
  start_time: Time.parse('09:00AM'),
  duration: 80
)
