class Person {
  // att.
  String? name;
  String? gender;
  int? age;

  Person({required this.name, required this.age, required this.gender});
  Person.withoutGender({required this.name, required this.age});

  // methods
  display() {
    print('$name : $gender : $age');
  }
}
