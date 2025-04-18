import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hello_store/screens/home_menu.dart';
import 'package:hello_store/screens/signup_screen.dart';
/*
class LoginScreen extends StatefulWidget
{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,20,20,0),
          child: Column(
          children: [
            SizedBox(height: height*0.07,),
           LoginHeader(height,width),
            SizedBox(height: height*0.05,),
             LoginForm(height,width),
            SizedBox(height: height*0.02,),
             SocialButtons(height,width),
              ],
              ),
        ),
    ),
    );
  }

  Widget LoginHeader(var height,var width)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
            child: Image.asset("assets/images/login_logo.png")
        ),
        Text("Welcome back,",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: height*0.03
        ),),
        SizedBox(height: height*0.003,),
        Text("Discover Limitless Choices and Unmatched Convenience.",style: TextStyle(
            fontFamily: 'semibold',
            fontSize: height*0.018
        ),)
      ],
    );
  }
  Widget LoginForm(var height,var width)
  {
    return Form(
    //  key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            /// Email
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

               SizedBox(height: height*0.02),
            ///Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility), // You can toggle this later
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),




            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                        Checkbox(
                          value: false, onChanged: (bool? value) { true; },
                          //value: controller.rememberMe.value, onChanged:
                            //(value) => controller.rememberMe.value = value!
                         ),
                    Text("Remember Me"),
                  ],
                ),

                /// Forget Password
                TextButton(
                   onPressed: (){},
                  child: const Text("Forget Password?")),
              ],
            ),
            SizedBox(height:height*0.03),

            /// Sign In Button
            InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeMenu()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent, // Dark green
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: height*0.02),

            /// Create Account Button
            InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>SignUpScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget SocialButtons(height,width)
  {
    return Column(
      children: [
        Text("Or Sign in with ",
        style: TextStyle(
          color: Colors.black45
        ),),
        SizedBox(height: height*0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.06,
              width: width * 0.12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Image.asset("assets/images/google-icon.png"),
              ),
            ),
            SizedBox(width: width*0.05,),
            Container(
              height: height * 0.06,
              width: width * 0.12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Image.asset("assets/images/facebook-icon.png"),
              ),
            ),
          ],
        ),
      ],
    );
  }


}*/