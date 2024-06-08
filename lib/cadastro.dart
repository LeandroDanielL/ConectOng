import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Conect Ong_Full.png', scale: 1.5),
                const SizedBox(height: 25),
                const Text('Crie sua conta', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 30),
                Card(
                  color: const Color(0xFFD9D9D9),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                            icon: Icon(Icons.person),
                            fillColor: Color.fromARGB(226, 226, 189, 98),
                            filled: true,
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email),
                            fillColor: Color.fromARGB(226, 226, 189, 98),
                            filled: true,
                          ),
                        ),
                        TextFormField(
                          controller: senhaController,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(Icons.lock),
                            fillColor: Color.fromARGB(226, 226, 189, 98),
                            filled: true,
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3084D1),
                          ),
                          onPressed: () => register(context),
                          child: const Text('Cadastrar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        ),
                      ],
                    ), 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register(BuildContext context) async {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text;

    if (nome.isEmpty) {
      showAlertDialog(context, "Erro", "Por favor, insira seu nome.");
      return;
    }

    if (!email.contains('@')) {
      showAlertDialog(context, "Erro", "Por favor, insira um email válido.");
      return;
    }

    if (senha.length < 8) {
      showAlertDialog(context, "Erro", "A senha deve ter pelo menos 8 caracteres.");
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome);
    await prefs.setString('email', email);
    await prefs.setString('senha', senha);

    // Todos os dados são válidos e foram salvos, navegue de volta para a tela de login
    Navigator.pop(context);
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
