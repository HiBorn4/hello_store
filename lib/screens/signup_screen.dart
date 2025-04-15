import 'package:flutter/material.dart';
import 'package:hello_store/screens/home_menu.dart';

class SignUpScreen extends StatefulWidget
{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
               SignUpTitle(height,width),
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
  Widget SignUpTitle(var height,var width)
  {
    return Text("Let's  Create your Account",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height*0.03
    ),);
  }
  Widget  LoginForm(height,width)
  {
    return Column(
      children: [
        Row(
          children: [
            // First Name
            Expanded(
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            SizedBox(width: width*0.02),

            // Last Name
            Expanded(
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height*0.02,),

        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
        ),
        SizedBox(height: height*0.02,),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
        ),
        SizedBox(height: height*0.02,),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: Icon(Icons.phone_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
        ),
        SizedBox(height: height*0.02,),
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
        SizedBox(height:height*0.04),

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
      ],
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

}