import 'package:flutter/material.dart';
import 'package:tugaspertemuan4/list_page.dart';
import 'package:tugaspertemuan4/moviereview_model.dart';
import 'package:tugaspertemuan4/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ListPage(),
    );
  }
}