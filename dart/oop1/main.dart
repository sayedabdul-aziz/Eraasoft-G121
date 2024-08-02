import 'person.dart';

// Employee (name,year,salary) using constructor..

void main() {
  // create an object
  Person p1 = Person(name: 'Ahmed', age: 33, gender: Gender.Male);
  p1.display();

  Person p2 = Person(name: 'Samar', age: 22, gender: Gender.Female);
  p2.display();

  Person p3 = Person.withoutGender(name: 'Ahmed', age: 22);
  p3.display();
}
