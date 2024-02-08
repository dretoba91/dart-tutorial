/* Chapter 3: Types & Operations */

/**
 * Type inference
  The compiler doesn’t need you to explicitly tell it the type every time — it can figure the type out on its own through a process called type inference. 

* Type conversion
 
 */

/**
 Strings

- Unicode grapheme clusters
  use (.runes) to get the Unicode of grapheme.

- Gettting Character
  to get the UTF-16 code units of a character, (.codeUnits) is used.
  
 */

// Challenges
/**
 * Challenge 1
  Using interpolation, create a string constant called myDetails that uses the fullName constant to create a string introducing yourself. For example, Ray Wenderlich’s string would read: Hello, my name is Ray Wenderlich
 
 */

// Solution

const firstName = 'Ray';
const lastName = 'Wenderlich';
const fullName = '$firstName $lastName';
const myDetails = 'Hello, my name is $fullName';

/**
 * Object and dynamic types
 - Both object and dynamic types are use to create dynamically-typed variable and thier errors can only be detected at "run-time"

 E.g var myVariable = 42;
         myVariable = 'hello';
 */

dvariables() {
  var myVariable;
  myVariable = 42;
  print("first log: $myVariable");
  myVariable = 'hello';
  return myVariable;
}

// Challenges
// Challenge 1:
/**
 * You’re a teacher, and in your class, attendance is worth 20% of the grade, the homework is worth 30% and the exam is worth 50%. Your student got 90 points for her attendance, 80 points for her homework and 94 points on her exam. Calculate her grade as an integer percentage rounded down.
 */

// Solution
const double attendance = 90;
const double homework = 80;
const double exam = 94;
percentagePoint(double points, double percent) {
  final finalPercentage = (points * percent) / 100;
  return finalPercentage;
}

final attendanceGrade = percentagePoint(attendance, 20);

final homeworkGrade = percentagePoint(homework, 30);

final examGrade = percentagePoint(exam, 50);

final double grade = attendanceGrade + homeworkGrade + examGrade;

// Challenge 2
/**
 How many?
 Given the following string: 
 const vote = 'Thumbs up! %';
 i. How many UTF-16 code units are there?
 ii. How many Unicode code points are there?
 iii. How many Unicode grapheme clusters are there?
 */

// Solution
const vote = 'Thumbs up! 👍';
// i. How many UTF-16 code units are there?
var answer1 = vote.codeUnits;

// ii. How many Unicode code points are there?
final answer2 = vote.runes;

// iii. How many Unicode grapheme clusters are there?
final answer3 = vote.runes;

// Challenge 6
// What is the value of the constant named summary?

const number = 10;
const multiplier = 5;
final summary = '$number \u00D7 $multiplier = ${number * multiplier}';


/**
  Key points
  - Type conversion allows you to conver
  type into another.
  - When doing operations with basic ari
  (+, -, *, /) and mixed types, the resul
  - Type inference allows you to omit the
  can figure it out.
  - Unicode is the standard representatio
  characters to numbers.
  - Dart uses UTF-16 values known as co
  Unicode strings.
  - A single mapping in Unicode is called
  which is known as a rune in Dart.
  - User-perceived characters may be composed of one or more code points and are called grapheme characters.
  - You can combine strings by using the addition operator.
  - You can make multi-line strings using three singlequotes or double quotes.
  - You can use string interpolation to build a string inplace.
  - Dart is an optionally-typed language. While it’s preferable to choose statically-typed variables, you may write Dart code in a dynamically-typed way by explicitly adding the dynamic type annotation in front of
  variables.
 */