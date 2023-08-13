import 'package:challenge/controllers/controller.dart';
import 'package:challenge/data/model/shoe_model.dart';
import 'package:challenge/widgets/custom_button.dart';
import 'package:challenge/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsShowScreen extends StatefulWidget {
  final Shoes shoes;
  const DetailsShowScreen({super.key, required this.shoes,});

  @override
  State<DetailsShowScreen> createState() => _DetailsShowScreenState();
}

class _DetailsShowScreenState extends State<DetailsShowScreen> {
  

  @override
  Widget build(BuildContext context) {
     Get.find<ShoesController>().init();
    final controller =  Get.find<ShoesController>();
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height*0.15,
            right: -size.height*0.20,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, _){
                return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: value * (size.height *0.5),
                width: value * (size.height * 0.5),
                decoration: BoxDecoration(
                  color:widget.shoes.listImage[controller.valueIndexColor].color,
                  shape: BoxShape.circle
                ),
                );
              },
            )
            ),
            Positioned(
              top: kToolbarHeight,
              left: 16,
              right: 16,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: ()=>Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded, 
                    color: Colors.black,)
                    ),
                  IconButton(
                    onPressed: (){},
                     icon: const Icon(Icons.favorite)
                     )
                ],
                
              ),
           ),
           Positioned(
            top: size.height * 0.2,
            right: 0,
            left: 0,
            child: FittedBox(
              child: Text(
                widget.shoes.category, 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.grey[100])
                  ),
            )
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 250), 
              top: size.height * 0.22,
              right: controller.sizeShoes(controller.valueIndexSize, size),
              left: controller.sizeShoes(controller.valueIndexSize, size),
              child: Hero(
                tag: widget.shoes.name,
                child: Image(image: AssetImage(widget.shoes.listImage[controller.valueIndexColor].image)))
              ),
          Positioned(
            top: size.height * 0.6,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.shoes.category,
                             style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),),
                             const SizedBox(height: 8,),
                             Text(
                              widget.shoes.name,
                              style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),),
                        ],
                      ),
                    ),
                    ShakeTransition(
                     // right:false,
                      child: Text(
                        widget.shoes.price,
                        style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),),
                    ),
                  ],
                ),
                 ShakeTransition(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8,),
                      Row(
                        children:List.generate(5, (index) => 
                         Icon(Icons.star, color: widget.shoes.punctuation > index ? widget.shoes.listImage[controller.valueIndexColor].color : Colors.white  ,))
                        ),
                        const SizedBox(height: 8,),
                        const Text(
                          "SIZE",
                          style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),),
                 
                       const SizedBox(height: 8,),
                       Row(
                        children: List.generate(4, (index) => 
                        Padding(padding: const EdgeInsets.only(right: 16),
                        child: CustomButton(
                          onTap:(){
                            controller.updateIndexSize(index);
                            setState(() {
                              
                            });
                          },
                          color: index ==  controller.valueIndexSize ? widget.shoes.listImage[controller.valueIndexColor].color : Colors.white,
                          child: Text("${index + 7}",
                           style:  TextStyle(
                          fontWeight: FontWeight.w600,
                          color: index == controller.valueIndexSize ? Colors.white : Colors.black,
                           fontSize: 22),),
                         )
                        ,))
                       )
                    ],
                  ),
                 )
              ],
            )
            ),

            Positioned(
              top: size.height * 0.84,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text(
                        "COLOR",
                        style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),),
                         const SizedBox(height: 8,),
                         Row(
                          children:List.generate(widget.shoes.listImage.length, (index) =>
                           GestureDetector(
                            onTap:(){
                              controller.updateIndexColor(index);
                              setState(() {
                                
                              });
                            },
                             child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color:widget.shoes.listImage[index].color,
                                shape: BoxShape.circle,
                                border:index == controller.valueIndexColor ? Border.all(color: Colors.white, width: 2) : null,
                              ),
                                                   ),
                           )),
                         ),
                        ],
                      ),
                    ),

                     ShakeTransition(
                      right: true,
                       child: CustomButton(
                        width: 100,
                        color:  widget.shoes.listImage[controller.valueIndexColor].color,
                        child: const Text("BUY",
                          style:  TextStyle(
                           fontWeight: FontWeight.bold,
                          fontSize: 20),),
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