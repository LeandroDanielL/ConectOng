import 'package:flutter/material.dart';

class PerfilPage2 extends StatelessWidget {
  final int authorId;

  PerfilPage2({required this.authorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Autor $authorId'),
      ),
      body: Center(
        child: Text('Informações do Autor $authorId'),
      ),
    );
  }
}
