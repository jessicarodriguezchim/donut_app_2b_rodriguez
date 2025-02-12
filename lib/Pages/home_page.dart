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
              TabBar(tabs: myTabs)
              //TabBarView

              //Carrito
            ],
          )),
    );
  }
}
