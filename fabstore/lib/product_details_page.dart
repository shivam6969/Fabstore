import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabstore/cart_provider.dart';
import 'package:fabstore/fav_provider.dart';


class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
    });


  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String selectedsize = "n";
  

  

  void onTap(){
    if(selectedsize!="n"){
      Provider.of<CartProvider>(context,listen: false).addProduct({
      'id' : widget.product['id'],
      'title':widget.product['title'],
      'price' : widget.product['price'],
      'sizes' : selectedsize,
      'company': widget.product['company'],
      'ImageUrl' : widget.product['ImageUrl']
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Added to cart!"))
      );


    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Select a Size!"))
      );
    }
    
                    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        titleTextStyle: const TextStyle(color: Colors.white,
                                  fontFamily: "Exo2",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22 ),
        

      ),
      body: Column(
        
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                  widget.product['title']as String,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  ),
                ),
                
                IconButton(
            
                  onPressed: (){
                    
                    Provider.of<FavProvider>(context,listen: false).addProduct({
                    'id' : widget.product['id'],
                    'title':widget.product['title'],
                    'price' : widget.product['price'],
                    'sizes' : selectedsize,
                    'company': widget.product['company'],
                    'ImageUrl' : widget.product['ImageUrl']
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to favourites!"))
                    );
                    
            
                  },
                  color: Colors.red,
                  icon: const Icon(Icons.favorite),
                  
                ),
            
              ]
                
              
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['ImageUrl']as String),
          ),
          const Spacer(flex: 5),

          Container(
            
            
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromARGB(243, 231, 230, 230),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height:10 ,),

                SizedBox(
                  height: 50,
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<String>).length,
                    itemBuilder: (context,index){
                      final size = (widget.product['sizes'] as List<String>)[index];
                  
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsize = size;
                            });
                          },
                          child: Chip(
                            
                            label: Text(size.toString()),
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            
                            backgroundColor: 
                            selectedsize == size
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(190, 82, 102, 111),
                      
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      
                      // backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                      
                  
                    ),
                    icon: const Icon(Icons.shopping_cart),

                    
                    label: const Text("Add To Cart"),
                  ),
                )


              ],
            ),
          )

        ],
      ),

    );
  }
}