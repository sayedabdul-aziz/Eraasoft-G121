class Person {
  // att.
  String? _name;
  int? _age;
  setName(String name) {
    this._name = name;
  }

  set name(String name) => this._name = name;

  set Age(int age) {
    if (age > 0) {
      this._age = age;
    } else {
      print('invalid age');
    }
  }

  int? getAge() => this._age;

  int? get age => this._age;

  String getName() {
    return this._name ?? '';
  }
}

// {
//   return      =>
// }
