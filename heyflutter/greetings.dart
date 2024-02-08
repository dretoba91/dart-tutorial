import 'dart:io';

String greeting = "Welcome to dart basics";


List<String> hobbies = [];


  void main() {
    print(greeting);
  print("Enter your name:");
  var name = stdin.readLineSync();
  print("Enter your age: ");
  var age = stdin.readLineSync();
  print("Enter your hobbies (one per line, type 'done' when finished):");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input == "done") {
      break;
    }
    hobbies.add(input);
  }

  print(
      "Your name is $name \n Your age is $age \n and your hobbies are $hobbies");
  }