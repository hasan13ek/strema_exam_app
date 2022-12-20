import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strema_exam_app/view_models/number_view_model.dart';

class ScreenThere extends StatefulWidget {
  final int number;
  const ScreenThere({Key? key, required this.number}) : super(key: key);

  @override
  State<ScreenThere> createState() => _ScreenThereState();
}

class _ScreenThereState extends State<ScreenThere> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NumberViewModel>(context, listen: false)
        .listenNumbers(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3 - screen"),
      ),
      body: Consumer<NumberViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    viewModel.counter.toString(),
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    context.read<NumberViewModel>().pauseCounterStream();
                  },
                  child: const Text(
                    "Pause Stream",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<NumberViewModel>().resumeCounterStream();
                  },
                  child: const Text(
                    "Resume Stream",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<NumberViewModel>().cancelCounterStream();
                  },
                  child: const Text(
                    "Cancel Stream",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}