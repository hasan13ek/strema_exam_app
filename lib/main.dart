import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strema_exam_app/ui/main_screen.dart';
import 'package:strema_exam_app/view_models/number_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_)=>NumberViewModel()),
    ],
      child: const MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainScrenn(),
    );
  }
}


