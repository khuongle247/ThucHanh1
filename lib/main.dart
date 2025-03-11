import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  @override
  _AgeCheckerScreenState createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _result = "";

  void _checkAgeCategory() {
    String name = _nameController.text;
    int? age = int.tryParse(_ageController.text);

    if (age == null) {
      setState(() {
        _result = "Vui lòng nhập số hợp lệ!";
      });
      return;
    }

    String category;
    if (age > 65) {
      category = "Người già";
    } else if (age >= 6) {
      category = "Người lớn";
    } else if (age >= 2) {
      category = "Trẻ em";
    } else {
      category = "Em bé";
    }

    setState(() {
      _result = "$name thuộc nhóm: $category";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("THỰC HÀNH 01")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Họ và tên"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: "Tuổi"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAgeCategory,
              child: const Text("Kiểm tra"),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
