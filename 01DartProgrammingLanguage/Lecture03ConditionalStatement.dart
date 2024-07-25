void main() {
  String name = "SMAS";
  print("StudentName${name}");

  double eng = 50;

  double math = 100;

  double urdu = 100;

  double obtainedtotal = eng + math + urdu;
  print("Obtained Total =${obtainedtotal}");
  
  double per = (obtainedtotal / 300) * 100;
  print("Percentage =${per.toStringAsFixed(2)}");

  if (per <= 100 && per >= 80) {
    print("GradeA1");
  } else if (per <= 79 && per >= 70) {
    print("GradeA");
  } else if (per <= 69 && per >= 60) {
    print("GradeB");
  } else if (per <= 59 && per >= 50) {
    print("GradeC");
  } else {
    print("IU jaien ");
  }
}
