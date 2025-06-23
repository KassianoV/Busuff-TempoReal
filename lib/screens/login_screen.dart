import 'package:flutter/material.dart';
// Mude 'busuff_transporte' para o nome do seu projeto
import 'package:busuff_transporte/screens/driver_screen.dart';
import 'package:busuff_transporte/screens/student_selection_screen.dart';
import 'package:busuff_transporte/widgets/custom_button.dart';
import 'package:busuff_transporte/widgets/custom_text_field.dart';

enum UserType { aluno, motorista }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserType _selectedUserType = UserType.aluno;
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // --- LÓGICA DE AUTENTICAÇÃO REAL DEVE SER INSERIDA AQUI ---
    if (_selectedUserType == UserType.aluno) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentSelectionScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DriverScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        title: const Text(
          'UFF',
          style: TextStyle(
            color: Colors.white,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            ToggleButtons(
              isSelected: [
                _selectedUserType == UserType.aluno,
                _selectedUserType == UserType.motorista
              ],
              onPressed: (index) {
                setState(() {
                  _selectedUserType = index == 0 ? UserType.aluno : UserType.motorista;
                });
              },
              borderRadius: BorderRadius.circular(8.0),
              selectedColor: Colors.white,
              fillColor: const Color(0xFF2A74DC), // Cor primária definida
              constraints: const BoxConstraints(minHeight: 40.0, minWidth: 120.0),
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Sou Aluno')),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Sou Motorista')),
              ],
            ),
            const SizedBox(height: 30),
            CustomTextField(
              labelText: 'Identificação',
              controller: _idController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Senha',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'Acessar',
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
