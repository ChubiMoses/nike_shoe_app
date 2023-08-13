import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: color,borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.house, size: 36, color: Colors.white,)
            ),
            Container(
              height: double.infinity,
              width: 50,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color:color
              ),
              child: Center(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                     color:Colors.white
                  ),
                  child: Center(
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color:color
                      ),
                      child: Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration:  const BoxDecoration(
                          shape: BoxShape.circle,
                          color:Colors.white
                        ),
                        child: Center(
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color:color
                            ),
                          ),
                        ),
                      ),
                    ),
                    ),
                  ),
                ),
              ),
              
            ),
            IconButton(
              onPressed: (){}, 
              iconSize: 36,
              icon: const Icon(Icons.person_outline_outlined, color: Colors.white,)
              )
          ],
        ),
      ),
    );
  }
}