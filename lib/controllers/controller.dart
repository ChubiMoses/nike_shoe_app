
import 'package:challenge/data/model/shoe_model.dart';
import 'package:challenge/data/repo/shoe_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoesController extends GetxController{
  ShoesRepository shoesRepository;
  ShoesController({ required this.shoesRepository});
  late List _categories;
  late List<Shoes>  _shoes;
  double _currentPage = 0.0;
  double _indexPage = 0.0;
  late Color color;
  int _valueIndexColor = 0;
  int _valueIndexSize = 1;

  List get categories => _categories;
  double get currentPage => _currentPage;
  double get  indexPage => _indexPage;

  List<Shoes> get shoes => _shoes;
  int get valueIndexColor => _valueIndexColor;
  int get  valueIndexSize => _valueIndexSize;
  

  void updateIndexSize(int index){
    _valueIndexSize = index;
    update();
  }

  void updateIndexColor(int index){
    _valueIndexColor = index;
    update();
  }

   void getCategories(){
    _categories =  shoesRepository.listCategory;
    update();

   }


   void getShoes(){
    _shoes =  shoesRepository.listShoes;
    update();
   }
  

  double sizeShoes(int index, Size size){
    switch (index) {
      case 0:
        return (size.height * 0.09);
        case 1:
        return (size.height * 0.07);
        case 2:
        return (size.height * 0.05);
        case 3:
        return (size.height * 0.04);
      default:
       return (size.height * 0.05);
    }
  }
   
 
  void listener(PageController pageController){
     update();
      _currentPage = pageController.page!;
       //   getColor(_currentPage);

      if(_currentPage >= 0 && _currentPage < 0.7){
        _indexPage = 0;
      }else if(_currentPage > 0.7 && _currentPage < 1.7){
        _indexPage = 1;
      }else if(_currentPage > 1.7 && _currentPage < 2.7){
        _indexPage =  2;
      }
    update();
  }

  
  Color getColor(double page){
     late final Color color;
     print(page);
     if(page >= 0 && page < 0.7){
       color =  shoes[0].listImage[0].color;
      }else if(page > 0.7 && page < 1.7){
       color =  shoes[1].listImage[0].color;
      }else if(page > 1.7 && currentPage < 2.7){
       color =  shoes[2].listImage[0].color;
      }
      return color;
  }




void init(){
  getCategories();
  getShoes();
}




}