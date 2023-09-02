class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String grade;
  List<Course> courses = [];

  Student(this.name, this.grade);

  void addCourse(Course course) {
    courses.add(course);
  }

  void removeCourse(Course course) {
    courses.remove(course);
  }

  void viewCourses() {
    if (courses.isEmpty) {
      print('$name belum memiliki kursus.');
    } else {
      print('Kursus yang dimiliki oleh $name:');
      for (var course in courses) {
        print('Judul: ${course.title}');
        print('Deskripsi: ${course.description}');
        print('--------------------------');
      }
    }
  }
}

void main() {
  // Contoh penggunaan:
  // Membuat beberapa objek Course
  var mathCourse = Course('Matematika', 'Pelajaran tentang matematika dasar.');
  var historyCourse = Course('Sejarah', 'Pelajaran tentang sejarah dunia.');

  // Membuat objek Student
  var student1 = Student('Usup', '10');
  var student2 = Student('Nana', '11');

  // Menambahkan kursus ke mahasiswa
  student1.addCourse(mathCourse);
  student1.addCourse(historyCourse);
  student2.addCourse(historyCourse);

  // Melihat kursus yang dimiliki oleh mahasiswa
  student1.viewCourses();
  student2.viewCourses();

  // Menghapus kursus dari mahasiswa
  student1.removeCourse(mathCourse);
  student2.removeCourse(mathCourse);
}
