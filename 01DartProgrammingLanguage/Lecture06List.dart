void main() {
  var studentslist = ["Annum", "Yousuf", "Saaria", "Hamza", "Misbah", "Sana"];
  print(studentslist);

  studentslist.add("Hiba");
  print("After Add ${studentslist}");

  var names = ["Affan", "zubair", "Fatimah"];

  studentslist.addAll(names);
  print("After Add All ${studentslist}");

  studentslist.insert(1, "Ebad");
  print("After Insert ${studentslist}");

  studentslist.insertAll(0, names);
  print("After Insert ${studentslist}");

  names[1] = "Zahid";
  print("name update ${names}");

  names.replaceRange(1, 2, ["ali", "talha", "haris"]);

  print("name update range ${names}");

  studentslist.remove("Saaria");
  print("After remove ${studentslist}");

  studentslist.removeAt(4);
  print("After remove At ${studentslist}");

  studentslist.removeLast();
  print("After remove Last ${studentslist}");

  studentslist.removeRange(2, 5);
  print("After remove Range ${studentslist}");

  print("for length ${studentslist.length}");
  print("for reversed ${studentslist.reversed}");
  print("for first ${studentslist.first}");
  print("for last ${studentslist.last}");
  print("for is empty ${studentslist.isEmpty}");
  print("for is not empty ${studentslist.isNotEmpty}");
}
