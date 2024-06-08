import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluther/servicos/autenticacao_servicos.dart';
import 'package:flutter/material.dart';
import 'filtro.dart';
import 'perfilpage1.dart';
import 'loja.dart';

class Feed extends StatefulWidget {
  final User user;
  const Feed({super.key, required this.user});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset("assets/images/Conect Ong_Logo.png"),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
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
            const SizedBox(width: 10),
          ],
        ),
      ),
      drawer: Filtro(),
      endDrawer: ( //menu
        Drawer(child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text((widget.user.displayName != null) ? widget.user.displayName! : ""),
                accountEmail: Text(widget.user.email!),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                        'https://cdn.icon-icons.com/icons2/1369/PNG/512/-person_90382.png'),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text('Perfil'),
                onTap: () => Navigator.pushNamed(context, '/perfil'),
              ),
              ListTile(
                leading: const Icon(Icons.bookmark),
                title: const Text('Post Salvos'),
                onTap: () {}, //n vai ter por enquanto 
              ),
               ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notificaçoes'),
                 onTap: () {},  //n vai ter por enquanto 
                 trailing: Container( 
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  ),
                  ),
              ),
              ListTile(
                leading: const Icon(Icons.add_business),
                title: const Text('Loja'),
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LojaScreen()),
                      );
                    },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () => Navigator.pushNamed(context, '/perfil'),
              ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Deslogar'),
                onTap: () {
                  AutenticacaoServicos().deslogar();
                },
              )
            ],
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(height: 10, thickness: 2, color: Colors.grey[300]),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              width: 140,
              height: 30,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(226, 226, 189, 98),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                'Recomendados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
        _buildPost(
                    context: context,
                    authorName: 'Cão sem Dono',
                    timeAgo: '3h',
                    postTitle: 'Oiii!!! Sou a Layla. Venha me conhecer... ',
                    postImage: const AssetImage('assets/images/post1.png'),
                    authorImage: const AssetImage('assets/images/author1.png'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage1()),
                      );
                    },
                  ),
                  _buildPost(
                    context: context,
                    authorName: 'Cão sem Dono',
                    timeAgo: '3h',
                    postTitle: 'Oiii!!! Sou a Layla. Venha me conhecer... ',
                    postImage: const AssetImage('assets/images/post1.png'),
                    authorImage: const AssetImage('assets/images/author1.png'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage1()),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildPost({
    required BuildContext context,
    required String authorName,
    required String timeAgo,
    required String postTitle,
    required AssetImage postImage,
    required AssetImage authorImage,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: CircleAvatar(
                      radius: 20,
                      backgroundImage: authorImage,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PerfilPage()),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PerfilPage()),
                      );
                    },
                    child: Text(
                      authorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                postTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Image(image: postImage),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

//Posts
class PostPage1 extends StatelessWidget {
  const PostPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
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
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
        children: [
          Divider(height: 10, thickness: 2, color: Colors.grey[300]),
          // Nome do autor e horário da publicação
          Row(
            children: [
              // Foto do autor
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  // Aqui você pode definir a imagem do autor
                  image: const DecorationImage(
                    image: AssetImage('assets/images/author1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome do autor
                  Text(
                    'Nome do Autor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Horário da publicação
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
          const SizedBox(height: 16),

          // Título do post
          const Text(
            'Título do Post',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),

          // Texto do post
          const Text(
            'Conteúdo do Post',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),

          // Imagem do post
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Defina o raio das bordas aqui
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300], // Cor de fundo de fallback
              child: Image.asset(
                'assets/images/post1.png',
                fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço disponível
              ),
            ),
          ),

          // Linha transparente abaixo da imagem
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.grey.withOpacity(0.2),
          ),

          // Ícones de interação
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Lógica de interação com o coração vazio
                    },
                  ),
                  const Text(
                    '123', // Número de curtidas (simulado)
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      // Lógica de interação com a caixa de texto
                    },
                  ),
                  const Text(
                    '45', // Número de comentários (simulado)
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Lógica de interação com o botão de compartilhar
                },
              ),
            ],
          ),

          // Linha separadora
          Divider(height: 10, thickness: 2, color: Colors.grey[300]),

          // Comentários
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildComment(
                userName: 'Nome do Usuário',
                timeAgo: 'Há 1 hora',
                comment: 'Comentário interessante aqui...',
              ),
              Divider(height: 10, thickness: 2, color: Colors.grey[300]),
              _buildComment(
                userName: 'Outro Usuário',
                timeAgo: 'Há 30 minutos',
                comment: 'Outro comentário interessante...',
              ),
              Divider(height: 10, thickness: 2, color: Colors.grey[300]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComment({
    required String userName,
    required String timeAgo,
    required String comment,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Foto do perfil
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                // Aqui você pode definir a imagem do usuário
                image: const DecorationImage(
                  image: AssetImage('assets/images/user_profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do usuário
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Tempo desde a publicação do comentário
                Text(
                  timeAgo,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Texto do comentário
        Text(comment),
        const SizedBox(height: 8),
      ],
    );
  }
}

class PostPage2 extends StatelessWidget {
  const PostPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
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
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: const Center(
        child: Text('Conteúdo do Post'),
      ),
    );
  }
}
