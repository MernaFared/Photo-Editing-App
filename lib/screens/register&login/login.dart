import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:AssetImage('assets/images/login.png'),fit:BoxFit.cover)),
        child: Scaffold(
          backgroundColor:Colors.transparent ,

          body:Stack(
            children: [
              Container(
              padding: EdgeInsets.only(left: 35,top: 110),
              child: Text('welcome\nBack',
              style: TextStyle(color:Colors.white,fontSize: 33)),
        ),
              Container(
                child: Column(
                  children: [
                    TextField(),
                    TextField(),
                    TextField(),
                  ],
                ),
              )

            ],
          )
        ),



    );
  }
}
