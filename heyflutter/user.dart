// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  String? name;
  int? age;
  List<dynamic>? hobbies;
  User({
    this.name,
    this.age,
    this.hobbies,
  });

  sayHello() {
    return print("Hello $name. Nice to meet a $age person.");
  }

  displayHobbies() {
    print("Your hobbies are: ${hobbies.toString()}");
  }
}

void main(List<String> args) {
  var Funke =
      User(name: "Funke", age: 35, hobbies: ['sleeping', 'eating', 'dancing']);

  // print(Funke.name);
  // print(Funke.age);
  // print(Funke.hobbies);
  // print(Funke.sayHello());
  print(Funke.displayHobbies());
}
