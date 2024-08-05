import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabstore/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    
    
    final cart = Provider.of<CartProvider>(context).cart;
    double totalCartValue = cart.fold(0, (sum, item) => sum + item['price']);
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Cart"),
        titleTextStyle: const TextStyle(color: Colors.white,
                                  fontFamily: "Cinzel",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32 ),
        centerTitle: true,
          
        ),

        body: 
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context,index){
                    final cartItem = cart[index];
                            
                    return ListTile(
                      title: Text(
                        cartItem['title'],
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      
                            
                      subtitle: Text('Size: ${cartItem['sizes']} , Price: ${cartItem['price']}'),
                            
                      leading: CircleAvatar(
                        
                        backgroundImage: AssetImage(cartItem['ImageUrl'] as String),
                      ),
                            
                      trailing: IconButton(
                        onPressed: (){
                          showDialog(context: context,
                           builder: (context){
                            return AlertDialog(
                              title:const  Text(
                                'Remove Product',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Exo2",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24 
                                ),
                            
                              ),
                              content: const Text(
                                'Are you sure you  want to remove the selected item form the cart?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Exo2",
                                  fontWeight: FontWeight.normal,
                                  
                                  fontSize: 18 
                                ),
                              ),
                            
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                            
                                   child: const Text("No",
                                   style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                   ),)
                                  ),
                                TextButton(
                                  onPressed: (){
                                    Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                                    Navigator.of(context).pop();
                            
                                  },
                            
                                   child: const Text("Yes",
                                   style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold
                                   ),)
                                  ),
                              ],
                            
                            
                            
                            );
                              
                            
                           }
                          );
                            
                        },
                        icon: const Icon(Icons.delete,color: Colors.red,),
                      ),
                    );
                    
                  }
                            ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    child: Text("Cart Value $totalCartValue",
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Exo2",

                    ),
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        
                        onPressed: (){
                          
                        },
                        icon: const Icon(Icons.shopping_cart_checkout),
                        label:const Text("Checkout",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                  )
                
              ],
            ),

      );

  }
}