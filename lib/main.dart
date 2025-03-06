import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference_service/textfield_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textValue = ref.watch(textHandlerProvider);

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
                onChanged:
                    (text) => ref
                        .read(textHandlerProvider.notifier)
                        .textChanged(text),
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
