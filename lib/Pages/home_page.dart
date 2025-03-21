import 'package:donut_app_2b_rodriguez/tabs/burguer_tab.dart';
import 'package:donut_app_2b_rodriguez/tabs/donut_tab.dart';
import 'package:donut_app_2b_rodriguez/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_rodriguez/tabs/pizza_tab.dart';
import 'package:donut_app_2b_rodriguez/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_rodriguez/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Lista de tabs
  List<Widget> myTabs = [
    //DonutTab
    MyTab(iconPath: 'lib/icons/donut.png'),
    //BurgerTab
    MyTab(iconPath: 'lib/icons/burger.png'),
    //SmoothieTab
    MyTab(iconPath: 'lib/icons/smoothie.png'),
    //PanCakesTab
    MyTab(iconPath: 'lib/icons/pancakes.png'),
    //pizzaTab
    MyTab(iconPath: 'lib/icons/pizza.png'),
  ];
  // Variables del carrito
  int itemCount = 0;
  double totalPrice = 0.0;

  void addToCart(double price) {
    setState(() {
      itemCount++;
      totalPrice += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Icon(
                Icons.menu,
                color: Colors.pinkAccent[800],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(Icons.person),
                )
              ]),
          body: Column(children: [
            // Texto principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text("I want to", style: TextStyle(fontSize: 32)),
                  Text("Eat",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.pinkAccent[800]))
                ],
              ),
            ),
            // TabBar
            TabBar(tabs: myTabs),
            // Contenido de pestañas
            Expanded(
              child: TabBarView(children: [
                DonutTab(addToCart: addToCart),
                BurgerTab(addToCart: addToCart),
                SmoothieTab(addToCart: addToCart),
                PancakesTab(addToCart: addToCart),
                PizzaTab(addToCart: addToCart)
              ]),
            ),
            // Carrito
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$itemCount Items | \$${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Delivery Charges Included",
                              style: TextStyle(fontSize: 12)),
                        ],
                      )),
                  ElevatedButton(
                    onPressed: () {
                      if (itemCount > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Ir al carrito')),
                        );
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: Text('View Cart',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
