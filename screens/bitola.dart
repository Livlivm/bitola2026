import 'package:flutter/material.dart';

class Bitola extends StatefulWidget {
  const Bitola({super.key});

  @override
  State<Bitola> createState() => _BitolaState();
}

class _BitolaState extends State<Bitola> {
  final distanciaController = TextEditingController();
  final correnteController = TextEditingController();

  double b110 = 0;
  double b220 = 0;

  void calcular() {
    double d = double.tryParse(distanciaController.text) ?? 0;
    double c = double.tryParse(correnteController.text) ?? 0;

    b110 = (2 * c * d) / 294.64;
    b220 = (2 * c * d) / 510.4;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Resultado"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("110V: ${b110.toStringAsFixed(2)} mm²"),
            const SizedBox(height: 5),
            Text("220V: ${b220.toStringAsFixed(2)} mm²"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 250, 249), // roxo suave
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "Calculadora de\nBitola",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                campo("Distância (m)", distanciaController),
                campo("Corrente (A)", correnteController),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calcular,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 175, 236, 246),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "110V: ${b110.toStringAsFixed(2)} mm²",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "220V: ${b220.toStringAsFixed(2)} mm²",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campo(String label, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Digite aqui",
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
