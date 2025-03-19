import 'package:donut_app_2b_rodriguez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

// Definición de la clase BurguerTab como StatelessWidget
class SmoothieTab extends StatelessWidget {
  // Lista de donuts en venta
  final List<List<dynamic>> donutsOnSale = [
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    // Repetición de algunos donuts para llenar la cuadrícula
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  // Constructor de la clase BurguerTab
  SmoothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Devuelve un GridView para mostrar los donuts
    return GridView.builder(
      // Número de elementos en la lista
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(8.0),
      // Delegado de la cuadrícula con número fijo de columnas
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Dos columnas en la cuadrícula
        childAspectRatio: 1 / 1.5, // Relación de aspecto de los elementos
      ),
      // Constructor de elementos de la cuadrícula
      itemBuilder: (context, index) {
        // Devuelve un widget BurguerTab para cada elemento
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutStore: donutsOnSale[index][1],
          donutPrice: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
        );
      },
    );
  }
}
