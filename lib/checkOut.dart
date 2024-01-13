import 'package:examweektwo/SnackBar.dart';
import 'package:flutter/material.dart';

class checkOut extends StatelessWidget {
  const checkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          SnackBarMessage(context, 'Congratulating');
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400),
        child: Center(
          child: Text(
            "Check Out",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
