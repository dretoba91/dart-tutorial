import 'dart:io';

void main(List<String> args) {
  // Question (a). Write a program that asks the user to enter a list of integers.

  List<int> numbers = [];

  while (true) {
    print("Enter an integer (or 'done' to finish):");
    String? input = stdin.readLineSync();
    if (input == 'done') {
      break;
    }

    try {
      int number = int.parse(input!);
      numbers.add(number);
    } on FormatException {
      print("Invalid input. Please enter an integer.");
    }
  }

  numbers.forEach((number) {
    print(number);
  });

/**Question (b). Create two new empty lists:
- odd numbers
- even numbers
*/

  List<int> oddNumbers = [];
  List<int> evenNumbers = [];

  // Question (c). Iterate over the list using a for loop to determine if the element is odd or even
  for (var i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 == 0) {
      evenNumbers.add(numbers[i]);
    } else {
      oddNumbers.add(numbers[i]);
    }
  }

  print("this is even numbers: $evenNumbers");
  print("this is odd numbers: $oddNumbers");

  /** Question(d)
   Create a function to calculate the average value of each list
   - Define a function calculateAverage() that accepts a list as argument
   - Calculate the average of all the numbers of this list.

   */
  double calculateAverage(List<int> values) {
    int sum = values.reduce((value, element) => value + element);
    double averageSum = sum / 2;
    return averageSum;
  }

  // print(calculateAverage(numbers));

  /** Question(e)
   Create a function to merge and sort the two lists inside the SAME function
   - Define a function that accepts two lists as arguments
   - Merge the elements from both input lists
   - Sort the merged list in ascending order


   */

  List<int> inputList1 = [];
  List<int> inputList2 = [];
  print("Enter an integer for list 1 (or 'done' to finish):");

  while (true) {
    String? input = stdin.readLineSync();
    if (input == 'done') {
      break;
    }
    try {
      int inputNum1 = int.parse(input!);
      inputList1.add(inputNum1);
    } on FormatException {
      print("Invalid input. Please enter an integer.");
    }
  }

  print("Enter an integer for list 2 (or 'done' to finish):");

  while (true) {
    String? input = stdin.readLineSync();
    if (input == 'done') {
      break;
    }
    try {
      int inputNum2 = int.parse(input!);
      inputList2.add(inputNum2);
    } on FormatException {
      print("Invalid input. Please enter an integer.");
    }
  }

  // Define a function that accepts two lists as arguments

  mergeAndSortList(List<int> value1, List<int> value2) {
    // Merge the elements from both input lists
    List<int> mergedLists = [...value1, ...value2];
    print("merged list: $mergedLists");

    // Sort the merged list in ascending order
    mergedLists.sort();
    print("sorted list $mergedLists");

    return "Sorted and Merged Lists";
  }

  // mergeList(inputList1, inputList2);

  // Question (f). The final output of whole program should look like this

  // a. Calling the method calculateAverage() for odd and even numbers.
  print("Average of odd numbers: ${calculateAverage(oddNumbers)}");

  print("Average of even numbers: ${calculateAverage(evenNumbers)}");

  // b. Calling the method mergeAndSortList()

  print("Merged and sorted list ${mergeAndSortList(inputList1, inputList2)}");
}
