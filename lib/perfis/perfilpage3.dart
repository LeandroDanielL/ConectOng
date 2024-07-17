import 'package:flutter/material.dart';

class PerfilPage3 extends StatefulWidget {
  final int authorId;

  PerfilPage3({required this.authorId});

  @override
  _PerfilPage3State createState() => _PerfilPage3State();
}

class _PerfilPage3State extends State<PerfilPage3> {
  bool _isFollowing = false;
  int _followersCount = 3400; // Exemplo de contagem de seguidores

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      if (_isFollowing) {
        _followersCount++;
      } else {
        _followersCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 10, thickness: 2, color: Colors.grey[300]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/PerfilPage3.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sopão Solidário',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$_followersCount Seguidores',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Descrição do perfil Sopão Solidário.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _toggleFollow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFollowing
                      ? const Color.fromARGB(255, 76, 158, 175)
                      : null,
                ),
                child: Text(_isFollowing ? 'Seguindo' : 'Seguir'),
              ),
            ),
            Divider(height: 20, thickness: 2),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Posts',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildPost(
                    image: 'assets/images/post5.jpeg',
                    text: 'Campanha de arrecadação! Estamos arrecadando alimentos para ajudar nossos irmãos do Rio Grande do Sul. É uma tragédia a situação que se encontra nas regiões inundadas e, por isso, estamos recebendo doações que serão enviadas para colegas operando na região. Agradecemos pela sua ajuda!',
                    likes: 150,
                    comments: 30,
                  ),
                  SizedBox(height: 20),
                  _buildPost(
                    image: 'assets/images/post6.jpg',
                    text: 'A Força do Voluntariado: Nossos voluntários são a espinha dorsal de nossas ações! Com imensa generosidade, eles dedicam seu tempo e energia para transformar a vida de muitas pessoas. Cada gesto de carinho e cada hora doada fazem a diferença e ajudam a construir um futuro melhor para todos. Junte-se a nós e descubra como você também pode fazer parte dessa corrente do bem!',
                    likes: 200,
                    comments: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildPost({
    required String image,
    required String text,
    required int likes,
    required int comments,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Lógica de curtir o post
                      },
                    ),
                    SizedBox(width: 5),
                    Text('$likes Likes'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chat_bubble_outline),
                      onPressed: () {
                        // Lógica de comentar no post
                      },
                    ),
                    SizedBox(width: 5),
                    Text('$comments Comentários'),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Lógica de compartilhar o post
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
