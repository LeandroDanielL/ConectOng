import 'package:flutter/material.dart';
import 'package:fluther/constantes.dart';

class Filtro extends StatefulWidget {
  final ValueNotifier<List<int>> filterNotifier;
  final List<int> allPostIds;

  const Filtro({super.key, required this.filterNotifier, required this.allPostIds});

  @override
  _FiltroState createState() => _FiltroState();
}

class _FiltroState extends State<Filtro> {
  Map<String, bool> categories = categoriasFiltro;  // constante para as categorias presente no filtro 


  double distance = 0;
  bool isOngOpen = false;

  List<int> getSelectedIds() {
    List<int> selectedIds = [];
    if (categories['Assistência social'] ?? false) {
      selectedIds.addAll([5, 6, 9]); // IDs dos posts relacionados à Assistência social
    }
    if (categories['Sem teto'] ?? false) {
      selectedIds.addAll([2, 4]); // IDs dos posts relacionados à Sem teto
    }
    if (categories['Animais'] ?? false) {
      selectedIds.addAll([1, 3]); // IDs dos posts relacionados à Educativas
    }
    if (categories['Cultura'] ?? false) {
      selectedIds.addAll([7, 8,10]); // IDs dos posts relacionados à Cultura
    }
    return selectedIds;
  }

  void resetFilters() {
    setState(() {
      categories.updateAll((key, value) => false);
      distance = 0;
      isOngOpen = false;
      widget.filterNotifier.value = widget.allPostIds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 60, // Altura definida para o cabeçalho
            color: Colors.blue, // Cor de fundo do cabeçalho
            padding: const EdgeInsets.all(10.0), // Padding para dar espaço interno
            child: Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/Conect Ong_Logo.png", // Caminho para o logo
                  height: 40, // Altura do logo
                  width: 40, // Largura do logo
                ),
                const SizedBox(width: 10), // Espaço entre o logo e o texto
                const Text(
                  'Filtrar Resultados',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20, // Tamanho da fonte do texto
                  ),
                ),
              ],
            ),
          ),
          for (var entry in categories.entries)
            CheckboxListTile(
              title: Text(entry.key),
              value: entry.value,
              onChanged: (bool? value) {
                setState(() {
                  categories[entry.key] = value!;
                });
              },
            ),
          ListTile(
            title: Text("Distância: ${distance.toStringAsFixed(0)} km"),
            subtitle: Slider(
              min: 0,
              max: 20,
              divisions: 20,
              label: "${distance.toStringAsFixed(0)} km",
              value: distance,
              onChanged: (double value) {
                setState(() {
                  distance = value;
                });
              },
            ),
          ),
          SwitchListTile(
            title: const Text("ONG Aberta"),
            value: isOngOpen,
            onChanged: (bool value) {
              setState(() {
                isOngOpen = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                widget.filterNotifier.value = getSelectedIds();
              },
              child: const Text("Aplicar Filtros"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: resetFilters,
              child: const Text("Limpar Filtros"),
            ),
          ),
        ],
      ),
    );
  }
}
