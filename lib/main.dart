import 'package:flutter/material.dart';
import 'package:simple_reddit/injector.dart';
import 'package:simple_reddit/presentation/main/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: HomeScreen()),
      ),
    );
  }
}
