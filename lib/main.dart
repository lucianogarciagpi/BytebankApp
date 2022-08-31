import 'package:bytebankapp/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            primary: Colors.green[900],
            secondary: Colors.blueAccent[700],
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700],
          )),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green[900],
            textTheme: ButtonTextTheme.primary,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.green[900])),
      home: const Dashboard(),
    );
  }
}
