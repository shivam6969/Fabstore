import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabstore/cart_provider.dart';
import 'package:fabstore/fav_provider.dart';
import 'package:fabstore/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider(),),
        ChangeNotifierProvider(create: (context)=>FavProvider(),)

      ],
      
      child: MaterialApp(
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            prefixIconColor: Color.fromARGB(121, 1, 41, 121),
      
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
      
            ),
            titleLarge: TextStyle(
                        fontFamily: "Cinzel",
                        fontWeight: FontWeight.bold,
                        fontSize: 32
                      ),
          ),
      
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )
            
      
          ),
          useMaterial3: false,
          fontFamily: "Exo2",
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 45, 75, 210),primary: Color.fromARGB(255, 45, 70, 210))
        ),
        title: "Fab Store",
        home: const HomePage(
         
          
        ),
      
      ),
    );
  }
}