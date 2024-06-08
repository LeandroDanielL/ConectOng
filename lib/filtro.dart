import 'package:flutter/material.dart';

class Filtro extends StatefulWidget {
  const Filtro({super.key});

  @override
  _FiltroState createState() => _FiltroState();
}

class _FiltroState extends State<Filtro> {
  Map<String, bool> categories = {
    'Assistência social': false,
    'Sem teto': false,
    'Educativas': false,
    'Cultura': false,
    'Ambientais': false,
    'Saúde': false,
    'Direitos humanos': false,
    'Habitação': false,
    'Paz e conflitos': false,
  };

  double distance = 0;
  bool isOngOpen = false;

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
        ],
      ),
    );
  }
}
