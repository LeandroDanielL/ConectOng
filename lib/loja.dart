import 'package:flutter/material.dart';


class LojaScreen extends StatefulWidget {
  @override
  _LojaScreenState createState() => _LojaScreenState();
}

class _LojaScreenState extends State<LojaScreen> {
  final List<Map<String, dynamic>> _itens = [
    {'nome': 'Kit de Alimentos', 'preco': 62, 'imagem': 'assets/kit_alimentos.png', 'quantidade': 1},
    {'nome': 'Kit de Higiene Completo', 'preco': 72, 'imagem': 'assets/kit_higiene_completo.png', 'quantidade': 1},
    {'nome': 'Kit Higiene Feminino', 'preco': 36, 'imagem': 'assets/kit_higiene_feminino.png', 'quantidade': 1},
    {'nome': 'Kit Higiene Masculino', 'preco': 29, 'imagem': 'assets/kit_higiene_masculino.png', 'quantidade': 1},
  ];

  final List<Map<String, dynamic>> _carrinho = [];

  void _adicionarAoCarrinho(Map<String, dynamic> item) {
    setState(() {
      _carrinho.add(item);
    });
  }

  void _removerDoCarrinho(int index) {
    setState(() {
      _carrinho.removeAt(index);
    });
  }

  double _calcularTotal() {
    return _carrinho.fold(0, (total, item) => total + item['preco']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lojinha'),
        actions: [
          Builder(
            builder: (context) => Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
                if (_carrinho.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(2), //pra deixar 2x2
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${_carrinho.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _itens.length,
        itemBuilder: (context, index) {
          final item = _itens[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    item['imagem'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['nome'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'R\$ ${item['preco']}',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Comprar'),
                    onPressed: () => _adicionarAoCarrinho(item),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text('Carrinho de Compras', style: TextStyle(fontSize: 24)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _carrinho.length,
                itemBuilder: (context, index) {
                  final item = _carrinho[index];
                  return ListTile(
                    title: Text(item['nome']),
                    subtitle: Text('R\$ ${item['preco']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () => _removerDoCarrinho(index),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: R\$ ${_calcularTotal().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('Confirmar Compra'),
                onPressed: () {
                  // Lógica de confirmação da compra
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}