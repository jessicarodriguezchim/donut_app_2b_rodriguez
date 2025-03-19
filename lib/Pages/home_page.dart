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

  @override
  Widget build(BuildContext context) {
    var crossAxisAlignment = CrossAxisAlignment;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //icono izquierdo
            leading: Icon(Icons.menu, color: Colors.grey[800]),
            //icono derecho
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Icon(Icons.person),
              )
            ],
          ),
          body: Column(
            children: [
              //Texto principal
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Row(
                  children: [
                    Text('I want to ', style: TextStyle(fontSize: 32)),
                    Text('Eat',
                        style: TextStyle(
                            //tamaño de letra
                            fontSize: 32,
                            //Negritas
                            fontWeight: FontWeight.bold,
                            //Subrayado
                            decoration: TextDecoration.underline))
                  ],
                ),
              ),
              //TabBar
              TabBar(tabs: myTabs),
              //TabBarView (Contenido de pestañas)
              Expanded(
                child: TabBarView(children: [
                  DonutTab(),
                  BurguerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab()
                ]),
              ),

              //Carrito
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  //Poner los elementos en los extremos de la fila
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Column(
                        //Alinear a la izquierda
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2 Items | \$45',
                            style: TextStyle(
                                fontSize: 18,
                                //Negritas
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Delivery Charges Included",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12)),
                        child: Text(
                          'View Cart',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
