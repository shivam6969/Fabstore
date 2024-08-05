import 'package:flutter/material.dart';
import 'package:fabstore/cart_page.dart';
import 'package:fabstore/fav_page.dart';
import 'package:fabstore/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  int currentPage = 0;
  List<Widget> pages = [
    const ProductList(),
    const CartPage(),
    const FavPage()
  ];

  

  @override
  
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items:const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart)
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite)
          ),

        ],
      ),

    );


  }
}