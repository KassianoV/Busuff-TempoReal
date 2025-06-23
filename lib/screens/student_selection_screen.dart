import 'package:flutter/material.dart';
// Mude 'busuff_transporte' para o nome do seu projeto
import 'package:busuff_transporte/screens/student_map_screen.dart';
import 'package:busuff_transporte/widgets/custom_button.dart';
import 'package:busuff_transporte/widgets/custom_text_field.dart';

class StudentSelectionScreen extends StatelessWidget {
  const StudentSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Localizar Ônibus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Qual linha de ônibus você deseja rastrear?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              labelText: 'Ex: Rota 1, Terminal...',
              controller: locationController,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Acessar Rota',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentMapScreen(
                      busRouteId: locationController.text.isNotEmpty
                          ? locationController.text
                          : 'onibus/rota1',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
