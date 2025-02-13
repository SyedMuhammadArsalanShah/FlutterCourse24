void main() {
  int num1 = 75;
  int num2 = 100;

  int add = num1 + num2;

  int sub = num1 - num2;
  int mul = num1 * num2;
  double div = num1 / num2;
  int mod = num1 % num2;
  // by integer
  int divint = num1 ~/ num2;

  print("by adding${add}");
  print("by subtracting${sub}");
  print("by multiplying${mul}");
  print("by dividing${div}");
  print("by dividing${divint}");
  print("by modulus${mod}");
}