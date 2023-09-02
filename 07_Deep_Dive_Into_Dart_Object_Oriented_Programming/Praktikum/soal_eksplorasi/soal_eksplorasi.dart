// Membuat interface Shape
abstract class Shape {
  double getArea();
  double getPerimeter();
}

// Membuat class Circle yang mengimplementasikan Shape
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }

  @override
  double getPerimeter() {
    return 2 * 3.14 * radius;
  }
}

// Membuat class Rectangle yang mengimplementasikan Shape
class Rectangle implements Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double getArea() {
    return length * width;
  }

  @override
  double getPerimeter() {
    return 2 * (length + width);
  }
}

// Membuat class Triangle yang mengimplementasikan Shape
class Triangle implements Shape {
  double side1;
  double side2;
  double side3;

  Triangle(this.side1, this.side2, this.side3);

  @override
  double getArea() {
    double s = (side1 + side2 + side3) / 2;
    return (s * (s - side1) * (s - side2) * (s - side3));
  }

  @override
  double getPerimeter() {
    return side1 + side2 + side3;
  }
}

void main() {
  // Membuat objek-objek bangun datar
  var circle = Circle(8.0);
  var rectangle = Rectangle(2.0, 4.0);
  var triangle = Triangle(4.0, 2.0, 6.0);

  // Menghitung luas dan keliling untuk masing-masing bangun datar
  double areaCircle = circle.getArea();
  double perimeterCircle = circle.getPerimeter();

  double areaRectangle = rectangle.getArea();
  double perimeterRectangle = rectangle.getPerimeter();

  double areaTriangle = triangle.getArea();
  double perimeterTriangle = triangle.getPerimeter();

  // Menampilkan hasil perhitungan
  print('Luas dan Keliling Lingkaran:');
  print('Luas: $areaCircle');
  print('Keliling: $perimeterCircle');

  print('\nLuas dan Keliling Persegi Panjang:');
  print('Luas: $areaRectangle');
  print('Keliling: $perimeterRectangle');

  print('\nLuas dan Keliling Segitiga:');
  print('Luas: $areaTriangle');
  print('Keliling: $perimeterTriangle');
}
