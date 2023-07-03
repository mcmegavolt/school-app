# Create teachers
teacher1 = Teacher.create(name: "John River")
teacher2 = Teacher.create(name: "Peter Walley")

# Create subjects
subject1 = Subject.create(name: "Math")
subject2 = Subject.create(name: "Chemistry")

# Create classrooms
classroom1 = Classroom.create(name: "101")
classroom2 = Classroom.create(name: "102")

# Create sections
section1 = Section.create(
  teacher: teacher1,
  subject: subject1,
  classroom: classroom1,
  days_of_week: [:monday, :wednesday, :friday],
  start_time: Time.parse("08:00AM"),
  duration: 50
)

section2 = Section.create(
  teacher: teacher2,
  subject: subject2,
  classroom: classroom2,
  days_of_week: [:tuesday, :thursday],
  start_time: Time.parse("02:00PM"),
  duration: 80
)

# Create students
student1 = Student.create(name: "Alex Rainbow")
student2 = Student.create(name: "Ann Summer")

# Add sections to students schedules
student1.sections << section1
student2.sections << section2