import 'package:flutter/material.dart';

class ViewAllNewsScreen extends StatelessWidget {
  const ViewAllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All News",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
