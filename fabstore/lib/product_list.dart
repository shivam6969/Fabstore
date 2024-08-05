import 'package:flutter/material.dart';
import 'package:fabstore/global_variables.dart';
import 'package:fabstore/product_card.dart';
import 'package:fabstore/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filters = const [
    "All",
    "Men",
    "Women",
    "Fab"
    
  ];
  late String selectedfilter;

  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }


  @override
  Widget build(BuildContext context) {
        const border = OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1)
                      ),
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                      );


    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Fab \nStore",
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      
                    ),
                  )
                  
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount:filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedfilter = filter;
                        });
                        
                      },
                      child: Chip(
                        backgroundColor: selectedfilter == filter? Theme.of(context).colorScheme.primary : Color.fromARGB(190, 82, 102, 111),
                        side: const BorderSide(
                          color:  Color.fromRGBO(240, 245, 247, 1),
                        ),
                        label:Text(filter),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                    ),
                  );
              
                }
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return ProductDetailsPage(product: product);
                          }
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['ImageUrl'] as String,
                      backgroundColor: index.isEven
                       ? Color.fromARGB(255, 178, 209, 220)
                       : Color.fromARGB(255, 110, 171, 214),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
  }
}