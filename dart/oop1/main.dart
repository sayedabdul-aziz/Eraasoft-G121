import 'person.dart';

void main() {
  // create an object
  Person p1 = Person();
  p1.name = 'Ali';
  p1.age = 23;
  p1.gender = 'Male';
  p1.display();

  Person p2 = Person();
  p2.name = 'Amira';
  p2.age = 33;
  p2.gender = 'Female';
  p2.display();
}