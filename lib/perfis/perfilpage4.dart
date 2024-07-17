import 'package:flutter/material.dart';

class PerfilPage4 extends StatefulWidget {
  final int authorId;

  PerfilPage4({required this.authorId});

  @override
  _PerfilPage4State createState() => _PerfilPage4State();
}

class _PerfilPage4State extends State<PerfilPage4> {
  bool _isFollowing = false;
  int _followersCount = 1280; // Exemplo de contagem de seguidores

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
                    backgroundImage: AssetImage('assets/images/PerfilPage4.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Instituto Macunaíma',
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
                          'Descrição do Instituto Macunaíma.',
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
                    image: 'assets/images/post7.jpg',
                    text: 'Palestra Magna: Combate ao Racismo. Uma conversa essencial para promover a igualdade! Como parte do projeto Negritude-se, o Instituto apresenta a Palestra Magna "Combate ao racismo: da teoria à prática cotidiana" com Bruno Egonu. O evento é gratuito e acontecerá na PUC Barreiro essa sexta.',
                    likes: 180,
                    comments: 35,
                  ),
                  SizedBox(height: 20),
                  _buildPost(
                    image: 'assets/images/post8.jpg',
                    text: 'Relembrando Nossas Conquistas: Para nós, é uma alegria relembrar tudo o que alcançamos no ano passado. Queremos agradecer à comunidade, aos nossos colaboradores e parceiros por todas as vivências e conquistas. Sem cada um de vocês, o Instituto Macunaíma não seria possível. Seguimos juntos!',
                    likes: 220,
                    comments: 50,
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
