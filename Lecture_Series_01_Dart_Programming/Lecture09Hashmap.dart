void main() {


  var studentdata={"name":"sana", "age":47, "email":"e@gmail.com"};


  print(studentdata);



  print(studentdata.isEmpty);
  print(studentdata.isNotEmpty);
  print(studentdata.length);
  print(studentdata.remove("email"));
  // search
  print(studentdata.containsKey("age"));
  print(studentdata.containsValue("sanaa"));


  
}