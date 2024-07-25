void main() {
  display('Ahmed Ali', 'male', 34);
  display1('Ali', 'Male');
  display2(age: 23, name: 'Ahmed Ali', gender: 'Male');
  display3(name: 'Ahmed Ali', gender: 'Male');
  display4('Ahmed', age: 23, gender: 'MALE');
}

//1) positional params. (ordered , required)
void display(String name, String gender, int age) {
  print('$name : $gender : $age');
}

//2) positional params. (ordered , required and optional)
void display1(String name, String gender, [int age = 20, int? x]) {
  print('$name : $gender : $age');
}

//3) named params. (not ordered , required)
void display2(
    {required String name, required String gender, required int age}) {
  print('$name : $gender : $age');
}

//4) named params. (not ordered , required and optional)
void display3({required String name, required String gender, int age = 20}) {
  print('$name : $gender : $age');
}

//5)
void display4(String name, {required String gender, int age = 20}) {
  print('$name : $gender : $age');
}
