import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strema_exam_app/view_models/number_view_model.dart';

class ScreenTwo extends StatefulWidget {
  ScreenTwo({Key? key,required this.number}) : super(key: key);
  final String number;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  void initState() {
    super.initState();
    Provider.of<NumberViewModel>(context, listen: false)
        .lengtNumber(widget.number);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birinchi Sahifa"),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.update))
        ],
      ),
      body: Consumer<NumberViewModel>(builder: (context,viewModel,child){
        return Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text(viewModel.numberLength.toString(),style:const TextStyle(fontSize: 34),),
            ],
          ),
        );
      }),
    );
  }
}
