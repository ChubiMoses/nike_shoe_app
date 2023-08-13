import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: kToolbarHeight + 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(image: AssetImage("assets/logo.png"),height: 20, width: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.white)
                  ),
                 IconButton(
                  onPressed: (){}, icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white,)
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}