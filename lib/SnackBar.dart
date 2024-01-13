
import 'package:flutter/material.dart';

SnackBarMessage(context, text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.purple.shade300,
      ),
    );
  }