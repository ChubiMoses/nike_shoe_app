import 'dart:ui';
import 'package:challenge/data/model/shoe_model.dart';

class ShoesRepository{

var listCategory = ["BasketBall", "Running", "Training"];

final listShoes = [
  Shoes(
    "Nike Impact 4 Basketball Shoes", 
    "Nike Air", 
    "\$120.00",
     4,
   [
    ImageShoes(
      'assets/nike1.png', 
      const Color(0xFFE66573)
      ),
      ImageShoes(
      'assets/nike2.png', 
     const Color(0xFFE4A953)
      ),
      ImageShoes(
      'assets/nike3.png', 
      const Color(0xFF891E4E)
      )
   ]
   ),
    Shoes(
    "Nike Impact 4 Basketball Shoes", 
    "Nike Air", 
    "\$120.00",
     4,
   [
     ImageShoes(
      'assets/nike2.png', 
       const Color(0xFFE4A953)
      ),
      ImageShoes(
      'assets/nike1.png', 
      const Color(0xFFE66573)
      ),

      ImageShoes(
      'assets/nike3.png', 
     const Color(0xFF891E4E)
      )
   ]
   ),
    Shoes(
   "Nike Impact 4 Basketball Shoes", 
    "Nike Air", 
    "\$120.00",
     4,
   [
     ImageShoes(
      'assets/nike3.png', 
      const Color(0xFF891E4E)
      ),
      ImageShoes(
      'assets/nike1.png', 
      const Color(0xFFE66573)
      ),
      ImageShoes(
      'assets/nike2.png', 
       const Color(0xFFE4A953)
     
      ),
     
     
   ]
   )
];
}