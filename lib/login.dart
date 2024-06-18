import 'package:flutter/material.dart';
import 'package:fluther/servicos/autenticacao_servicos.dart';
import 'package:fluther/snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool queroEntrar = true;
  bool entrarComoOng = false;
  bool _senhaVisivel = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();

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
          key: _formKey,
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
                              if (value == null || value.isEmpty) {
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
                            decoration: InputDecoration(
                              labelText: entrarComoOng ? 'E-mail da ONG' : 'E-mail',
                              icon: Icon(Icons.email),
                              fillColor: Color.fromARGB(226, 226, 189, 98),
                              filled: true,
                            ),
                          ),
                          TextFormField(
                            controller: _senhaController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'A senha não pode ser vazia';
                              }
                              if (value.length < 8) {
                                return 'A senha é muito curta';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              icon: Icon(Icons.lock),
                              fillColor: Color.fromARGB(226, 226, 189, 98),
                              filled: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _senhaVisivel = !_senhaVisivel;
                                  });
                                },
                              ),
                            ),
                            obscureText: !_senhaVisivel,
                          ),
                          Visibility(
                            visible: !queroEntrar,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nomeController,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return entrarComoOng
                                          ? 'O nome da ONG não pode ser vazio'
                                          : 'O nome não pode ser vazio';
                                    }
                                    if (value.length < 2) {
                                      return entrarComoOng
                                          ? 'O nome da ONG é muito curto'
                                          : 'O nome é muito curto';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: entrarComoOng ? 'Nome da ONG' : 'Nome',
                                    icon: Icon(Icons.person),
                                    fillColor: Color.fromARGB(226, 226, 189, 98),
                                    filled: true,
                                  ),
                                ),
                                Visibility(
                                  visible: entrarComoOng,
                                  child: TextFormField(
                                    controller: _cnpjController,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'O CNPJ não pode ser vazio';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'CNPJ',
                                      icon: Icon(Icons.business),
                                      fillColor: Color.fromARGB(226, 226, 189, 98),
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Visibility(
                            visible: !queroEntrar,
                            child: CheckboxListTile(
                              title: const Text("Entrar como ONG"),
                              value: entrarComoOng,
                              onChanged: (bool? value) {
                                setState(() {
                                  entrarComoOng = value ?? false;
                                });
                              },
                            ),
                          ),
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
                                entrarComoOng = false;
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

  void botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        _autenServico.logarUsuarios(email: email, senha: senha).then(
          (String? erro) {
            if (erro != null) {
              mostrarSnackBar(context: context, texto: erro);
            } else {
              // Navegar para o feed principal
              Navigator.pushNamed(context, '/feed');
            }
          },
        );
      } else {
        _autenServico.cadastrarUsuario(nome: nome, senha: senha, email: email).then(
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
              Navigator.pushNamed(context, '/feed');
            }
          },
        );
      }
    }
  }
}
