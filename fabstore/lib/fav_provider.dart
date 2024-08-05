import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier{
  final List<Map<String,dynamic>> fav = [];

  void addProduct(Map<String,dynamic> product){
    
    fav.add(product);
    notifyListeners();


    
  }
  void removeProduct(Map<String,dynamic> product){
    fav.remove(product);
    notifyListeners();
  }
}