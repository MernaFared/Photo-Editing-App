import 'package:flutter/material.dart';


import '../../shared/colors.dart';
import '../../shared/default_button.dart';
import '../../shared/shared.dart';
import '../../shared/styles.dart';
import '../auth/register/register.dart';
import '../subscription/subscription_screen.dart';
import 'components/square_tile.dart';
import 'components/text_filed.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: kGray300Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  //logo
                  const Icon(
                      Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50,),
                    Text('Welcom back you\'ve been missed!',
                    style: TextStyle(
                        color:Colors.grey.shade700,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 25,),
                  MyTextField( controller: usernameController,
                    hintText: 'username',
                    obscureText: false,

                  ),
                  const SizedBox(height: 10,),
                  MyTextField( controller: passwordController,
                    hintText: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget Password?',
                      style: TextStyle(color: Colors.grey.shade600),),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  DefaultButton(
                    height: 60,
                    bgColor: kBlackColor,
                    text: "Sign in",
                    textStyle: KWhiteText,
                    borderRadius: 8,
                    onTap: (){
                      navigateTo(context, const SubscriptionScreen());
                    },
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                          thickness:0.5,
                          color:Colors.grey.shade400,
                        ),
                        ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('Or Continue With',
                            style: TextStyle(color: Colors.grey.shade700),),
                          ),
                        Expanded(
                          child: Divider(
                          thickness:0.5,
                          color:Colors.grey.shade400,
                        ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                 SquareTile(imagePath:'assets/images/google.png'),
                     SizedBox(width: 25,),
                      SquareTile(imagePath:'assets/images/apple.png'),
                      SizedBox(width: 25,)

                    ],
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700],
                        fontSize: 18),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: (){
                          navigateTo(context,   RegisterScreen());
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                              fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
