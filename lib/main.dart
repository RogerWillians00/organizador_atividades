import 'package:flutter/material.dart';
import 'seletor_tema.dart';
import 'Screens/login_page.dart';
import 'Screens/title_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isDarkTheme: isDarkTheme,
      toggleTheme: toggleTheme,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          routes: {
            '/': (context) => HomeScreen(),
            '/login': (context) => PaginaLogin(),
          }),
    );
  }
}
