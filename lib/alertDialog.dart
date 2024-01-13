import 'package:flutter/material.dart';

class alertDialog extends StatelessWidget {
  const alertDialog({super.key, required this.item});
  final String item;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Congtulation!'),
      ),
      content: SizedBox(
        height: 60,
        child: Center(
          child: Column(
            children: [
              Text('You have added'),
              Text('${5}'),
              Text(item+' on your bag'),
            ],
          ),
          //Text('You have added\n${5}\n' + item + 'on your bag'),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            "Okay",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
