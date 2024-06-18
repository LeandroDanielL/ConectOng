import 'package:flutter/material.dart';


class PostPage2 extends StatelessWidget {
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
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: AssetImage('assets/images/author2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome do Autor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '2 dias atrás',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Título do Post',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Conteúdo do Post',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: Image.asset(
                'assets/images/post2.jpg',
                fit: BoxFit.cover,
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