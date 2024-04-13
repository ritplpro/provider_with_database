import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_database/provider_modal.dart';
import 'database.dart';
import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>TodoProvider(
      proToBase: ToProDatabase.proToBase),child:  MyApp(),));
}



class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}
