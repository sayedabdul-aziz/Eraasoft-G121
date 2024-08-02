
enum Gender{
  Male,
  Female
}
class Person {
  // att.
  String? name;
  Gender? gender;
  int? age;

  Person({required this.name, required this.age, required this.gender});
  Person.withoutGender({required this.name, required this.age});

  // methods
  display() {
    print('$name : $gender : $age');
  }
}
