// 5. Create Rectangle Area Analysis Program

void main(List<String> args) {
  /** Question (e) 
 Use a for loop to print area, and isSquare status for each rectangle
 e.g.  Area: <Area>
 Is Square: <True/False>
*/

  List<Rectangle> rectangleInstances = [box1, box2, box3];
  for (Rectangle element in rectangleInstances) {
    // Calculate the area
    int area = element.getArea();

    // Determine if it's a square

    bool isSquare = element.isSquare();

    print("Area: $area");
    print("Is Square: $isSquare");
  }

  // Question (f) Call the findLargestArea()

  findLargestArea([box1.getArea(), box2.getArea(), box3.getArea()]);
}

/** Question (a). Define a Rectangle class with the following following properties 
 * width
 * Height
 */

class Rectangle {
  int? width;
  int? height;

  Rectangle(int width, int height) {
    this.width = width;
    this.height = height;
  }

  /** Question(c). Implement for the Rectangle class the following methods
  - getArea()
  - isSquare()
 */
  getArea() {
    int area = width! * height!;
    return area;
  }

  isSquare() {
    if (width == height) {
      return true;
    } else {
      return false;
    }
  }
}

/** Question(b). Create instances of Rectangle with different dimensions
 */

final box1 = Rectangle(40, 25);
final box2 = Rectangle(30, 30);
final box3 = Rectangle(50, 30);

/** Question(d). Create a function findLargestArea() 
 - It accepts a list of Rectangle objects
 - Determine and return the rectangle with the largest area
 */

findLargestArea(List value) {
  // Question (e).
  int highest = value[0];
  value.forEach((element) {
    // print("Area: ${element} and Square: ${element}");
    if (element > highest) {
      highest = element;
    }
  });
  print("The rectangle with the largest area has an area of $highest");
}
