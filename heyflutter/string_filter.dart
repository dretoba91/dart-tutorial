import 'dart:io';

void main() {
  // Question(a). Write a program that asks the user to enter a list of country names
  List<String> countries = [];

  print("Enter a country name (or 'done' to finish):");
  while (true) {
    String? input = stdin.readLineSync();
    if (input == 'done') {
      break;
    }

    try {
      countries.add(input!);
    } on FormatException {
      print("Invalid input. Please enter a String.");
    }
  }
  countries.forEach((country) {
    print("Country: $country");
  });

  /** Question(b).
   Create a list of country objects with 2x properties:
   - Country name 
   - Name length
   Hint: Use map() to generate this new list of Country objects

   */

  List countryObjects = [];
  countries
      .map((country) => {
            countryObjects
                .add({"Country name": country, "Name length": country.length})
          })
      .toList();

  // print("Country list objects: $countryObjects");

  /** Question(c). Create a function formatCountries that does the following:
   * Use a loop to iterate through the list of country objects
 */

  void formatCountries() {
    countryObjects.forEach((element) {
      print(
          "${element["Country name"]} (${element["Name length"]} characters)");
    });
  }

  formatCountries();

  /** Question(d). Create a function filterCountriesByNameLength 
   * This function accepts 2 arguments
     - The list of country objects
     - Minimum character length the country names should have
   * The function should do the following:
     - Apply the filtering function to the list of country objects
     - Display the output of countries with names longer than e.g. 10 characters:

   */
  filterCountriesByNameLength(List value1, int value2) {
    print("Countries with names longer than $value2 characters:");
    value1.forEach((element) {
      if (element["Name length"] > value2) {
        print(
            "${element["Country name"]} (${element["Name length"]} characters)");
      }
    });
  }

  filterCountriesByNameLength(countryObjects, 6);
}
