import 'package:flutter/material.dart';

class BuildMagicRetouchContent extends StatelessWidget {
  const BuildMagicRetouchContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/rmv2.jpeg",
      "assets/images/rmv2.jpeg",
      "assets/images/rmv2.jpeg",
      "assets/images/rmv2.jpeg",
      "assets/images/rmv2.jpeg",
      "assets/images/rmv2.jpeg",
    ];
    List<String> titles = [
      "Day Look",
      "Day 2 ",
      "Day 3 ",
      "Day 4 ",
      "Day 5 ",
      "Day 6 ",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 130,
            //color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
               itemCount: images.length,
               itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 5),
                   child: Container(
                     width: 70,
                     child: Column(
                       children: [
                         ClipRRect(
                           borderRadius:  BorderRadius.circular(6),
                           child: Image.asset(
                             images[index],
                             height: 100,
                             width: 70,
                             fit: BoxFit.fitHeight,
                           ),
                         ),
                         SizedBox(height: 5,),
                         Text(
                           titles[index],
                           style: TextStyle(
                             color: Colors.white
                           ),
                           overflow: TextOverflow.ellipsis,
                           maxLines: 1,
                         )
                       ],
                     ),
                   ),
                 );
               },
            ),
          )
        ],
      ),
    );
  }
}
