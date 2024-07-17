import 'package:flutter/material.dart';

class PerfilPage5 extends StatefulWidget {
  final int authorId;

  PerfilPage5({required this.authorId});

  @override
  _PerfilPage5State createState() => _PerfilPage5State();
}

class _PerfilPage5State extends State<PerfilPage5> {
  bool _isFollowing = false;
  int _followersCount = 2000; // Exemplo de contagem de seguidores

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
                    backgroundImage: AssetImage('assets/images/PerfilPage5.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Projeto Impacto do Bem',
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
                          'Descrição do Projeto Impacto do Bem.',
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
                    image: 'assets/images/post9.jpg',
                    text: 'Campanha de Solidariedade ao Rio Grande do Sul: Hoje iniciamos uma campanha para ajudar o povo do Rio Grande do Sul. Devido ao alto volume das chuvas e outros fatores, centenas de famílias perderam tudo. Situação bem delicada onde toda ajuda nesse momento é bem-vinda.',
                    likes: 170,
                    comments: 32,
                  ),
                  SizedBox(height: 20),
                  _buildPost(
                    image: 'assets/images/post10.jpg',
                    text: 'Encante-se com o Lar Primavera: Lar primavera é um daqueles lugares que depois que você conhece, você apaixona completamente! É um caminho sem volta, a história do Lar é linda, a luta para manter essa casa de apoio para as crianças é de tirar o chapéu. Se você quer ver e viver milagres, conheça o Lar primavera.',
                    likes: 250,
                    comments: 60,
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