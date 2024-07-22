import 'dart:io';

void main() {
  while (true) {
    print('Enter the Number 1:');
    int num1 = int.tryParse(stdin.readLineSync()!) ?? 0;
    print('Enter the Number 2:');
    int num2 = int.tryParse(stdin.readLineSync()!) ?? 0;
    print('Enter Your Operation(+ , - , *, /): ');
    String ope = stdin.readLineSync()!;

    switch (ope) {
      case '+':
        print("Sum is : ${num1 + num2}");
        break;
      case '-':
        print("Sub is : ${num1 - num2}");
        break;
      case '*':
        print("Multi is : ${num1 * num2}");
        break;
      case '/':
        print("Div is : ${num1 / num2}");
        break;
      default:
        print('Invalid Operation !!');
    }

    print('Do u need any other operation (y/n)?');
    String res = stdin.readLineSync()!;
    if (res.toLowerCase() == 'n') {
      print('GodBy!!');
      break;
    }
  }
  //
}
