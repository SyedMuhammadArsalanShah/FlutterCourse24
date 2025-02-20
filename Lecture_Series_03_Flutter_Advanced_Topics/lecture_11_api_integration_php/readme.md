

# **Step-by-Step Guide for User Registration System**

## **1. Set Up Your Local Server**
- Install **XAMPP** or **WAMP**.
- Open **XAMPP Control Panel** and start **Apache** & **MySQL**.

---

## **2. Create a Database in MySQL**
1. Open **phpMyAdmin** (`http://localhost/phpmyadmin/`).
2. Create a database named **api_db**.
3. Run this SQL query:

   ```sql
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255) NOT NULL,
       email VARCHAR(255) UNIQUE NOT NULL,
       password VARCHAR(255) NOT NULL
   );
   ```

---

## **3. Create the PHP Backend**
1. In `C:\xampp\htdocs`, create a folder named **flutter_app**.
2. Inside **flutter_app**, create a file named **register.php** and add:

   ```php
   <?php
   $conn = mysqli_connect("localhost", "root", "", "api_db");

   if (!$conn) {
       die(json_encode(["message" => "Connection failed"]));
   }

   $name = $_POST['name'];
   $email = $_POST['email'];
   $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

   $sql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$password')";
   $res = mysqli_query($conn, $sql);

   echo json_encode(["message" => $res ? "User registered successfully" : "Error"]);
   ?>
   ```

---

## **4. Build the Flutter App**
### **4.1 Install Dependencies**
- Open your Flutter project and run:

   ```sh
   flutter pub get
   ```

---

### **4.2 Create the Registration Form**
Replace the contents of `main.dart` with:

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Registration',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> registerUser() async {
    final url = Uri.parse('http://192.168.1.100/flutter_app/register.php'); // Change IP

    final response = await http.post(url, body: {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    var data = json.decode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data['message'])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email'), keyboardType: TextInputType.emailAddress),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: registerUser, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
```

---

## **5. Run the System**
1. Start **XAMPP** and ensure **Apache & MySQL** are running.
2. Find your local **IPv4 Address** by running:

   ```sh
   ipconfig
   ```

3. Update `main.dart`:
   ```dart
   final url = Uri.parse('http://YOUR_IP/flutter_app/register.php');
   ```
4. Run the app:

   ```sh
   flutter run
   ```

5. Enter details and click **Register**.

---

## **6. Verify User Data in MySQL**
- Open **phpMyAdmin**.
- Select `api_db` > `users` table.
- Click **Browse** to see registered users.

And that's it! 🎯 Your **Flutter + PHP + MySQL User Registration System** is ready! 🚀