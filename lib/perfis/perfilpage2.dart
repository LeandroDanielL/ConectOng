import 'package:fluther/posts/post2.dart';
import 'package:fluther/posts/post4.dart';
import 'package:flutter/material.dart';

class PerfilPage2 extends StatefulWidget {
  final int authorId;

  PerfilPage2({required this.authorId});

  @override
  _PerfilPage2State createState() => _PerfilPage2State();
}

class _PerfilPage2State extends State<PerfilPage2> {
  bool _isFollowing = false;
  int _followersCount = 1500; // Exemplo de contagem de seguidores

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
                    backgroundImage: AssetImage('assets/images/author2.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alegria É Mato',
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
                          'Plantamos alegria e colhemos solidariedade!',
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
                    context: context,
                    image: 'assets/images/post2.jpg',
                    text: 'Ação social - Distribuição de cestas!',
                    likes: 123,
                    comments: 45,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage2()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  _buildPost(
                    context: context,
                    image: 'assets/images/post4.jpg',
                    text: 'Mais uma vez, MUITO OBRIGADA a todos que nos ajudam… seguimos plantando pequenas sementinhas e fazendo colheitas super especiais!',
                    likes: 250,
                    comments: 80,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage4()),
                      );
                    },
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
    required BuildContext context,
    required String image,
    required String text,
    required int likes,
    required int comments,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
