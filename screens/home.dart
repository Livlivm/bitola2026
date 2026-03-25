import 'package:flutter/material.dart';
import 'bitola.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text("App Bitola"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Bitola()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Abrir Calculadora",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
