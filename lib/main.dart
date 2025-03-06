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
  final _controller = TextEditingController();
  String textValue = "";

  @override
  void initState() {
    _controller.addListener(_textHandle);
    super.initState();
  }

  void _textHandle() {
    setState(() {
      textValue = _controller.text.trim();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_textHandle);

    super.dispose();
  }

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
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Имя",
                  border: OutlineInputBorder(),
                ),
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
