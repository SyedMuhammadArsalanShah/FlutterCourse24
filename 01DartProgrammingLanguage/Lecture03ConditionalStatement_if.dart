void main() {
  String name = "SMAS";
  print("Student Name ${name}");

  String email = "smas@gmail.com";
  print("Student Email ${email}");

  String pass = "123";
  print("Student Password ${pass}");

  print("Login Form ");

  String l_email = "smas@gmail.com";
  print("Student Login  Email ${l_email}");

  String l_pass = "123";
  print("Student  Login Password ${l_pass}");

  if (email == l_email && pass == l_pass) {
    print("welcome");

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

    num number = 90;

    if (number < 0) {
      print("Negative ${number}");
    } else {
      print("Positive ${number}");
    }

    if (number % 2 == 0) {
      print("Even ${number}");
    } else {
      print("Odd ${number}");
    }

    num year = 1947;

    if (year % 4 == 0) {
      print("Leap year ");
    } else {
      print("is not a Leap year ");
    }
  } else {
    print("incorrect email and pass");
  }
}
