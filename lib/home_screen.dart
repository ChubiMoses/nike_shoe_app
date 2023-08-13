import 'package:challenge/details_show_screen.dart';
import 'package:challenge/data/model/shoe_model.dart';
import 'package:challenge/widgets/custom_app_bar.dart';
import 'package:challenge/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;
 
  @override
  void initState() {
    _pageController.addListener(() {
      listener();
    });
    super.initState();
  }

  @override
  void dispose() {
     _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Get.find<ShoesController>().init();
    final controller =  Get.find<ShoesController>();
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10,),
          const CustomAppBar(),
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children:List.generate(controller.categories.length, (index) => 
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(controller.categories[index], 
                  style:  TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color:index == 0 ?  controller.getColor( _currentPage) : Colors.white,)),
                ))
              ),
            ),
          ),
         
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: controller.shoes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index){
                final Shoes shoes = controller.shoes[index];
                final listTitle = shoes.category.split(" ");
                return GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, _){
                      return DetailsShowScreen(shoes: shoes);
                    }));
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(right: indexPage == index ? 30 : 60.0),
                    child: Transform.translate(
                      offset:  Offset(indexPage == index ?0: 10, 0),
                      child: LayoutBuilder(
                        builder: (context, constrainst){
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                          margin:  EdgeInsets.only(top:indexPage == index ? 30 : 50, bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: Colors.white
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40
                                ),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(shoes.category, 
                                    style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                   const SizedBox(height: 8,),
                                    Text(shoes.name, 
                                    style: const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w800),
                                    ),
                                   const SizedBox(height: 4,),
                                    Text(shoes.price, 
                                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                                    ),
                                   const SizedBox(height: 4,),
                                    FittedBox(
                                      child: Text('${listTitle[0]} \n ${listTitle[1]}', 
                                      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top:constrainst.maxHeight * 0.2,
                                left: constrainst.maxWidth * 0.05,
                                right:-constrainst.maxWidth * 0.16,
                                bottom: constrainst.maxHeight * 0.2,
                                child: Hero(
                                  tag: shoes.listImage[0].image,
                                  child: Image(image: AssetImage(shoes.listImage[0].image)))
                                ),
                               Positioned(
                                bottom: 0,
                                right: 0,
                                child: Material(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36)
                                  ),
                                  color: shoes.listImage[0].color,
                                  child: InkWell(
                                    onTap:(){
                                      
                                    },
                                    child: const SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.add, size: 40,),
                                    ),
                                  ),
                                )
                                ),
                            ],
                          ),
                         );
                        },
                      ),
                    ),
                  ),
                );
               }
            ),
          ),
           Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child:  CustomBottomBar(color:   controller.getColor(_currentPage)),
          ),
        ],
      ),
    );
  }

  void listener(){
    setState(() {
      _currentPage = _pageController.page!;
      if(_currentPage >= 0 && _currentPage < 0.7){
        indexPage = 0;
      }else if(_currentPage > 0.7 && _currentPage < 1.7){
        indexPage = 1;
      }else if(_currentPage > 1.7 && _currentPage < 2.7){
        indexPage =  2;
      }
    });
  }

}