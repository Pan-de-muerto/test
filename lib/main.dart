import 'package:flutter/material.dart';
import 'package:terra_reports/homePage.dart';
import 'package:terra_reports/views/home.dart';

void main() {
  runApp(const ReportApp());
}

class ReportApp extends StatelessWidget {
  const ReportApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reportes",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
