import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String textValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Имя",
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    textValue = text.trim();
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            Text(textValue, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
