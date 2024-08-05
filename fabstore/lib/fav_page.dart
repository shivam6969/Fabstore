
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabstore/fav_provider.dart';



class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavProvider>(context).fav;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        titleTextStyle: const TextStyle(color: Colors.white,
                                  fontFamily: "Cinzel",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32 ),
        centerTitle: true,
      ),

      body: ListView.builder(
          itemCount: fav.length,
          itemBuilder: (context,index){
            final favItem = fav[index];

            return ListTile(
              
              title: Text(
                favItem['title'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              

              

              leading: CircleAvatar(
                
                backgroundImage: AssetImage(favItem['ImageUrl'] as String),
              ),

              trailing: 
                  IconButton(
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
                                'Are you sure you  want to remove the selected item form your favourites?',
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
                                Provider.of<FavProvider>(context,listen: false).removeProduct(favItem);
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
    );
  }
}