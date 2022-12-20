import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strema_exam_app/view_models/number_view_model.dart';

class ScreenOne extends StatefulWidget {
   ScreenOne({Key? key,required this.number}) : super(key: key);
   final int number;

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  void initState() {
    super.initState();
    Provider.of<NumberViewModel>(context, listen: false)
        .degreeNumber(widget.number);
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
      body: Consumer<NumberViewModel>(
          builder: (context,viewModel,child){

        return Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text(viewModel.numberFirst.toString(),style: TextStyle(fontSize: 34),)
            ],
          ),
        );
      }),
    );
  }
}
