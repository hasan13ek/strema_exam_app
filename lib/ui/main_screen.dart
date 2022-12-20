import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strema_exam_app/ui/screen_one.dart';
import 'package:strema_exam_app/ui/screen_there.dart';
import 'package:strema_exam_app/ui/screen_two.dart';
import 'package:strema_exam_app/view_models/number_view_model.dart';

class MainScrenn extends StatefulWidget {
  const MainScrenn({Key? key}) : super(key: key);

  @override
  State<MainScrenn> createState() => _MainScrennState();
}

class _MainScrennState extends State<MainScrenn> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asosiy sahifa"),
        actions: [
        ],
      ),
      body: ChangeNotifierProvider(
        create:  (context) => NumberViewModel(),
        builder: (context,child){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextField(
                  controller:  nameController,
                  decoration: getInputDecoration(label: "Raqam kiriting"),


                ),
              ),
              const  SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) =>  ScreenOne(number: int.parse(nameController.text))));
                  },
                  child:  Text("Birinchi sahifaga o'tish ")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) =>  ScreenTwo(number: nameController.text,)));
                  },
                  child: const Text("Ikkinchi sahifaga o'tish")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) =>  ScreenThere(number: int.parse(nameController.text),)));
                  },
                  child: const Text("Uchinchi sahifaga o'tish"))
            ],
          );
        },
      ),
    );
  }
}
InputDecoration getInputDecoration({required String label}) {
  return  InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(16)),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    hintText: label,
    focusColor: const Color(0xff868686),
    hintStyle: const TextStyle(color: Colors.white70),
    filled: true,
    fillColor: Colors.blue,
  );
}