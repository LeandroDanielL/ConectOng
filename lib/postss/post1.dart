import 'package:flutter/material.dart';
import '../perfis/perfilpage1.dart'; // Importe a página de perfil do autor

class PostPage1 extends StatelessWidget {
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
                MaterialPageRoute(builder: (context) => PerfilPage1(authorId: 123)), // Substitua 123 pelo ID do autor
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
                      image: AssetImage('assets/images/author1.png'),
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
                          MaterialPageRoute(builder: (context) => PerfilPage1(authorId: 1)), // Substitua 123 pelo ID do autor
                        );
                      },
                      child: Text(
                        'Projeto Cãomer',
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
            'Campanha: Doação!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Olá PessoAU!! Espero que todos estejam bem!! Aqui no abrigo estamos precisando muito da ajuda de vocês! Gastamos em média, um saco de ração (25kg) por dia. É bastante coisa e não conseguimos sozinhos. Toda ajuda é muito bem vinda!',
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
                          'assets/images/post1.png',
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
                  'assets/images/post1.png',
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
                  Icon(Icons.thumb_up_alt_outlined),
                  SizedBox(width: 4),
                  Text('123'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 4),
                  Text('45'),
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
        ],
      ),
    );
  }
}
