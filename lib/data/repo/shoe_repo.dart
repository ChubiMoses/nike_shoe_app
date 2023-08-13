import 'dart:ui';

import 'package:challenge/data/model/shoe_model.dart';
import 'package:get/get.dart';

class ShoesRepository{

var listCategory = ["BasketBall", "Running", "Training"];

final listShoes = [
  Shoes(
    "41B XIBcoo Niker Shoe", 
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
    "41B XIBcoo Niker Shoe", 
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
    "41B XIBcoo Niker Shoe", 
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