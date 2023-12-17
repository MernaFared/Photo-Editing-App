import 'package:flutter/material.dart';

class BuildBottomActions extends StatelessWidget {
  const BuildBottomActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> icons = [
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
      Icon(Icons.crop,color: Colors.white,),
    ];

    List<String> iconTitles = [
      'Crop 1',
      'Crop 2',
      'Crop 3 ',
      'Crop 4',
      'Crop 4',
      'Crop 4',
      'Crop 4',
      'Crop 4',
      'Crop 4',
    ];


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: iconTitles.length ,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
               icons[index],
                SizedBox(height: 5,),
                Text(
                  iconTitles[index],
                  style: TextStyle(
                      color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
