import 'package:fluther/constantes.dart';
import 'package:flutter/material.dart';

class LojaScreen extends StatefulWidget {
  const LojaScreen({super.key});

  @override
  _LojaScreenState createState() => _LojaScreenState();
}

class _LojaScreenState extends State<LojaScreen> {
   List<Map<String, dynamic>> _itens = itensLoja;// constante para os itens da loja 
 

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
        title: const Text('Lojinha'),
        actions: [
          Builder(
            builder: (context) => Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
                if (_carrinho.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2), //pra deixar 2x2
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${_carrinho.length}',
                        style: const TextStyle(
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'R\$ ${item['preco']}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Comprar'),
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
            const DrawerHeader(
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
                      icon: const Icon(Icons.remove_circle),
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
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Confirmar Compra'),
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