import 'package:fluther/servicos/autenticacao_servicos.dart';
import 'package:fluther/snackbar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final AutenticacaoServicos _autenServico = AutenticacaoServicos();

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
        child: Form(
          key: _formKey, //chave
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/Conect Ong_Full.png', scale: 1.5),
                  const SizedBox(height: 25),
                  const Text('Faça seu login',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 15),
                  Card(
                    color: const Color(0xFFD9D9D9),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            validator: (String? value) {
                              if (value == null) {
                                return 'O E-mail não pode ser vazio';
                              }
                              if (value.length < 5) {
                                return 'O E-mail é muito curto';
                              }
                              if (!value.contains("@")) {
                                return "O E-mail não é valido";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              icon: Icon(Icons.email),
                              fillColor: Color.fromARGB(226, 226, 189, 98),
                              filled: true,
                            ),
                          ),
                          TextFormField(
                            controller: _senhaController,
                            validator: (String? value) {
                              if (value == null) {
                                return 'A senha não pode ser vazia';
                              }
                              if (value.length < 8) {
                                return 'A senha é muito curta';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              icon: Icon(Icons.lock),
                              fillColor: Color.fromARGB(226, 226, 189, 98),
                              filled: true,
                            ),
                            obscureText: true,
                          ),
                          Visibility(
                            visible: !queroEntrar,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nomeController,
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'O nome não pode ser vazio';
                                    }
                                    if (value.length < 2) {
                                      return 'O nome é muito curto';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.person),
                                    fillColor:
                                        Color.fromARGB(226, 226, 189, 98),
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3084D1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              botaoPrincipalClicado();
                            },
                            child: Text((queroEntrar) ? 'Login' : "Cadastrar",
                                style: const TextStyle(color: Colors.black)),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                queroEntrar = !queroEntrar;
                              });
                            },
                            child: Text((queroEntrar)
                                ? "Ainda não tem uma conta ? Cadastre-se!"
                                : "Já tem uma conta ? Entre"),
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
      ),
    );
  }

  botaoPrincipalClicado() {
  String nome = _nomeController.text;
  String email = _emailController.text;
  String senha = _senhaController.text;

  if (_formKey.currentState!.validate()) {
    if (queroEntrar) {
      print("entrada validada ");
      _autenServico.logarUsuarios(email: email, senha: senha).then(
        (String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          } else {
            // Navegar para o feed principal
            Navigator.pushNamed(context, '/feedPrincipal');
          }
        },
      );
    } else {
      print("cadastro validado ");
      print(
          "${_emailController.text}, ${_nomeController.text}, ${_senhaController.text},");
      _autenServico
          .cadastrarUsuario(nome: nome, senha: senha, email: email)
          .then(
        (String? erro) {
          if (erro != null) {
            // Voltou com erro
            mostrarSnackBar(context: context, texto: erro);
          } else {
            // Deu certo
            mostrarSnackBar(
              context: context,
              texto: "Cadastro efetuado com sucesso",
              isErro: false,
            );
            // Navegar para o feed principal após cadastro bem-sucedido
            Navigator.pushNamed(context, '/feedPrincipal');
          }
        },
      );
    }
  }
}
}
