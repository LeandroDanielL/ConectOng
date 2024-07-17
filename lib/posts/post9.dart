import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../perfis/perfilpage5.dart';

class PostPage9 extends StatefulWidget {
  @override
  _PostPage9State createState() => _PostPage9State();
}

class _PostPage9State extends State<PostPage9> {
  int likes = 170;
  bool isLiked = false;
  List<Map<String, String>> comments = [
    {'name': 'Ana Oliveira', 'comment': 'Iniciativa maravilhosa!'},
    {'name': 'Pedro Santos', 'comment': 'Como posso contribuir?'},
    {'name': 'Fernanda Lima', 'comment': 'Parabéns pelo projeto!'}
  ];

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  Future<void> addComment(String comment) async {
    // Obtém o usuário logado
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userName = user.displayName ?? 'Anônimo';

      setState(() {
        comments.add({'name': userName, 'comment': comment});
      });
    } else {
      // Handle user not logged in
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Você precisa estar logado para comentar.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 5),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Pesquisar",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
        children: [
          Divider(height: 10, thickness: 2, color: Colors.grey[300]),
          GestureDetector(
            onTap: () {
              // Navegar para o perfil do autor
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilPage5(authorId: 123)), // Substitua 123 pelo ID do autor
              );
            },
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage('assets/images/PerfilPage5.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navegar para o perfil do autor
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PerfilPage5(authorId: 1)), // Substitua 123 pelo ID do autor
                        );
                      },
                      child: Text(
                        'Projeto Impacto do Bem',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'A 3 horas',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Campanha de Solidariedade ao Rio Grande do Sul',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Hoje iniciamos uma campanha para ajudar o povo do Rio Grande do Sul. Devido ao alto volume das chuvas e outros fatores, centenas de famílias perderam tudo. Situação bem delicada onde toda ajuda nesse momento é bem-vinda.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/images/post9.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: Image.asset(
                  'assets/images/post9.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 16),
            color: Colors.grey.withOpacity(0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                      color: isLiked ? Colors.blue : Colors.black,
                    ),
                    onPressed: toggleLike,
                  ),
                  SizedBox(width: 4),
                  Text('$likes'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          String comment = '';
                          return AlertDialog(
                            title: Text('Adicionar Comentário'),
                            content: TextField(
                              onChanged: (value) {
                                comment = value;
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (comment.isNotEmpty) {
                                    addComment(comment);
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text('Adicionar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(width: 4),
                  Text('${comments.length}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 4),
                  Text('Compartilhar'),
                ],
              ),
            ],
          ),
          Divider(height: 10, thickness: 2, color: Colors.grey[300]),
          ...comments.map((commentData) => ListTile(
            title: Text(commentData['comment']!),
            subtitle: Text(commentData['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
          )),
        ],
      ),
    );
  }
}
