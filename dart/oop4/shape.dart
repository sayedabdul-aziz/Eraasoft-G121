import 'dart:math' as math;

abstract class Area {
  getArea();
}

abstract class Perimeter {
  getPerimeter();
}

class Circle implements Area, Perimeter {
  double r;
  Circle(this.r);

  @override
  getArea() {
    print('Area : ${math.pi * r * r}');
  }

  @override
  getPerimeter() {
    print('Perimeter: ${2 * math.pi * r}');
  }
}
