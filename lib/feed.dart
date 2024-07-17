import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluther/login.dart';
import 'package:fluther/postss/post5.dart';
import 'package:fluther/servicos/autenticacao_servicos.dart';
import 'package:flutter/material.dart';
import 'filtro.dart';
import 'loja.dart';
import 'perfis/perfilpage1.dart';
import 'perfis/perfilpage2.dart';
import 'perfis/perfilpage3.dart';
import 'perfis/perfilpage4.dart';
import 'perfis/perfilpage5.dart';
import 'postss/post1.dart';
import 'postss/post2.dart';
import 'postss/post6.dart';
import 'postss/post7.dart';
import 'postss/post8.dart';
import 'postss/post9.dart';
import 'postss/post10.dart';
import 'postss/post3.dart';
import 'postss/post4.dart';

class Feed extends StatefulWidget {
  final User user;

  Feed({super.key, required this.user});

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final List<int> allPostIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; // Lista com todos os IDs de postagens possíveis
  final ValueNotifier<List<int>> filterNotifier = ValueNotifier<List<int>>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

  final Map<int, Widget Function()> authorProfiles = {
    1: () => PerfilPage1(authorId: 1),
    2: () => PerfilPage2(authorId: 2),
    3: () => PerfilPage3(authorId: 3),
    4: () => PerfilPage4(authorId: 4),
    5: () => PerfilPage5(authorId: 5),
    // Adicione mais mapeamentos conforme necessário
  };

  @override
  void dispose() {
    filterNotifier.dispose();
    super.dispose();
  }

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
      drawer: Filtro(filterNotifier: filterNotifier, allPostIds: allPostIds),
      endDrawer: _buildEndDrawer(context),
      body: ValueListenableBuilder<List<int>>(
        valueListenable: filterNotifier,
        builder: (context, selectedIds, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Divider(height: 10, thickness: 2, color: Colors.grey[300]),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 140,
                  height: 30,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(226, 226, 189, 98),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Recomendados',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (selectedIds.contains(1))
                  _buildPost(
                    context: context,
                    authorId: 1,
                    authorName: 'Projeto Cãomer',
                    timeAgo: '3h',
                    postTitle: 'Campanha: Doação!',
                    postImage: 'assets/images/post1.png',
                    authorImage: 'assets/images/author1.png',
                    profileBuilder: authorProfiles[1]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage1()),
                      );
                    },
                  ),
                if (selectedIds.contains(2))
                  _buildPost(
                    context: context,
                    authorId: 2,
                    authorName: 'Alegria É Mato',
                    timeAgo: '2d',
                    postTitle: 'Ação social - Distribuição de cestas!',
                    postImage: 'assets/images/post2.jpg',
                    authorImage: 'assets/images/author2.jpg',
                    profileBuilder: authorProfiles[2]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage2()),
                      );
                    },
                  ),
                if (selectedIds.contains(3))
                  _buildPost(
                    context: context,
                    authorId: 1,
                    authorName: 'Projeto Cãomer',
                    timeAgo: '1d',
                    postTitle: 'Campanha de Adoção!',
                    postImage: 'assets/images/post3.jpg',
                    authorImage: 'assets/images/author1.png',
                    profileBuilder: authorProfiles[1]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage3()),
                      );
                    },
                  ),
                if (selectedIds.contains(4))
                  _buildPost(
                    context: context,
                    authorId: 2,
                    authorName: 'Alegria É Mato',
                    timeAgo: '3d',
                    postTitle: 'Foi dada a largada do nosso Café na rua😋',
                    postImage: 'assets/images/post4.jpg',
                    authorImage: 'assets/images/author2.jpg',
                    profileBuilder: authorProfiles[2]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage4()),
                      );
                    },
                  ),
                if (selectedIds.contains(5))
                  _buildPost(
                    context: context,
                    authorId: 3,
                    authorName: 'Sopão Solidário',
                    timeAgo: '3h',
                    postTitle: 'Campanha de arrecadação!',
                    postImage: 'assets/images/post5.jpeg',
                    authorImage: 'assets/images/PerfilPage3.jpg',
                    profileBuilder: authorProfiles[3]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage5()),
                      );
                    },
                  ),
                if (selectedIds.contains(6))
                  _buildPost(
                    context: context,
                    authorId: 3,
                    authorName: 'Sopão Solidário',
                    timeAgo: '2d',
                    postTitle: 'A Força do Voluntariado',
                    postImage: 'assets/images/post6.jpg',
                    authorImage: 'assets/images/PerfilPage3.jpg',
                    profileBuilder: authorProfiles[3]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Post6()),
                      );
                    },
                  ),
                if (selectedIds.contains(7))
                  _buildPost(
                    context: context,
                    authorId: 4,
                    authorName: 'Instituto Macunaíma',
                    timeAgo: '1d',
                    postTitle: 'Palestra Magna: Combate ao Racismo',
                    postImage: 'assets/images/post7.jpg',
                    authorImage: 'assets/images/PerfilPage4.jpg',
                    profileBuilder: authorProfiles[4]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage7()),
                      );
                    },
                  ),
                if (selectedIds.contains(8))
                  _buildPost(
                    context: context,
                    authorId: 4,
                    authorName: 'Instituto Macunaíma',
                    timeAgo: '5h',
                    postTitle: 'Relembrando Nossas Conquistas',
                    postImage: 'assets/images/post8.jpg',
                    authorImage: 'assets/images/PerfilPage4.jpg',
                    profileBuilder: authorProfiles[4]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage8()),
                      );
                    },
                  ),
                if (selectedIds.contains(9))
                  _buildPost(
                    context: context,
                    authorId: 5,
                    authorName: 'Projeto Impacto do Bem',
                    timeAgo: '1h',
                    postTitle: 'Campanha de Solidariedade ao Rio Grande do Sul',
                    postImage: 'assets/images/post9.jpg',
                    authorImage: 'assets/images/PerfilPage5.jpg',
                    profileBuilder: authorProfiles[5]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage9()),
                      );
                    },
                  ),
                if (selectedIds.contains(10))
                  _buildPost(
                    context: context,
                    authorId: 5,
                    authorName: 'Projeto Impacto do Bem',
                    timeAgo: '4h',
                    postTitle: 'Encante-se com o Lar Primavera',
                    postImage: 'assets/images/post10.jpg',
                    authorImage: 'assets/images/PerfilPage5.jpg',
                    profileBuilder: authorProfiles[5]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostPage10()),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

   Drawer _buildEndDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text((widget.user.displayName != null) ? widget.user.displayName! : ""),
            accountEmail: Text(widget.user.email!),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.account_circle_outlined,
                size: 72,
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
            title: const Text('Notificações'),
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
              leading: Icon(Icons.logout),
              title: Text('Deslogar'),
              onTap: () async {
                await AutenticacaoServicos().deslogar();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPost({
    required BuildContext context,
    required int authorId,
    required String authorName,
    required String timeAgo,
    required String postTitle,
    required String postImage,
    required String authorImage,
    required VoidCallback onTap,
    required Widget Function() profileBuilder,
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
                      backgroundImage: AssetImage(authorImage),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profileBuilder()),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profileBuilder()),
                      );
                    },
                    child: Text(
                      authorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                postTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(postImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
