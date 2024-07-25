// Animal (_color,eat(),setColor(),getColor())
// Lion (jungleName,eat())
// Dog (ownerName,eat())

class Person {
  int? id;
  String? name;
  Person({required this.id, required this.name});
  display() {
    print('Parent');
  }
}

class Student extends Person {
  String? grade;

  // Student(this.grade,String name, int id) : super(id: id, name: name);
  Student(this.grade, {super.id, super.name});
  @override
  display() {
    super.display();
    print('$id : $name : $grade');
  }
}

class Doctor extends Person {
  double? salary;
  // Doctor(this.salary, String name, int id) : super(id: id, name: name);
  Doctor(this.salary, {super.id, super.name});

  display() {
    print('$id : $name : $salary');
  }
}
