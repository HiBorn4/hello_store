import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAdressScreen extends StatefulWidget
{
  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
  @override
  Widget build(BuildContext context) {
    var isChecked=false;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: Text('Add new address', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(25, 25, 25, 1),
            fontFamily: 'semibold',
            fontSize: height*0.022,
            letterSpacing: 0 ,
            fontWeight: FontWeight.normal,
            height: 1
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0,10,20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.01,),
              _buildHeadings(height,width,context,"Full Name ( first and last name)*"),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.08,
                width: width*0.9,
                child: TextField(
                  style: TextStyle(
                    fontSize: height*0.02,

                  ),
                  decoration: InputDecoration(

                    hintText: 'Enter name',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),

                    isDense: true, // Makes it more compact
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.circular(3),

                    ),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              _buildHeadings(height,width,context,"Mobile Number*"),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.08,
                width: width*0.9,
                child: TextField(
                  style: TextStyle(
                    fontSize: height*0.02,

                  ),
                  decoration: InputDecoration(

                    hintText: 'Enter',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey,

                    ),
                    isDense: true, // Makes it more compact
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.circular(3),

                    ),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeadings(height,width,context,"Pincode *"),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: height*0.07,
                        width: width*0.44,
                        child: TextField(
                          style: TextStyle(
                            fontSize: height*0.02,

                          ),
                          decoration: InputDecoration(

                            hintText: 'Enter',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.grey,

                            ),
                            isDense: true, // Makes it more compact
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.8),
                              borderRadius: BorderRadius.circular(3),

                            ),


                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: width*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.03,),
                      Container(

                        height: height*0.053,
                        width: width*0.44,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          color : Color.fromRGBO(13, 118, 0, 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SvgPicture.asset("assets/images/location.svg"),
                            SizedBox(width: width*0.03,),
                            Text('Current Location', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(239, 239, 239, 1),
                                fontFamily: 'Inter',
                                fontSize: height*0.016,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),


                ],
              ),
           //   SizedBox(height: height*0.01,),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeadings(height,width,context,"State *"),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: height*0.07,
                        width: width*0.44,
                        child: TextField(
                          style: TextStyle(
                            fontSize: height*0.02,

                          ),
                          decoration: InputDecoration(

                            hintText: 'Enter',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.grey,

                            ),
                            isDense: true, // Makes it more compact
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.8),
                              borderRadius: BorderRadius.circular(3),

                            ),


                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                 SizedBox(width: width*0.02,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeadings(height,width,context,"City *"),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: height*0.07,
                        width: width*0.44,
                        child: TextField(
                          style: TextStyle(
                            fontSize: height*0.02,

                          ),
                          decoration: InputDecoration(

                            hintText: 'Enter',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.grey,

                            ),
                            isDense: true, // Makes it more compact
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.8),
                              borderRadius: BorderRadius.circular(3),

                            ),


                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 1.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(height: height*0.01,),


              _buildHeadings(height,width,context,"Flat, House no, building name *"),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.08,
                width: width*0.9,
                child: TextField(
                  style: TextStyle(
                    fontSize: height*0.02,

                  ),
                  decoration: InputDecoration(

                    hintText: 'Enter',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey,

                    ),
                    isDense: true, // Makes it more compact
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.circular(3),

                    ),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              _buildHeadings(height,width,context,"Road name, Area, colony *"),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.08,
                width: width*0.9,
                child: TextField(
                  style: TextStyle(
                    fontSize: height*0.02,

                  ),
                  decoration: InputDecoration(

                    hintText: 'Enter',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey,

                    ),
                    isDense: true, // Makes it more compact
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.circular(3),

                    ),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              _buildHeadings(height,width,context,"Landmark *"),
              SizedBox(height: height*0.01,),
              Container(
                height: height*0.08,
                width: width*0.9,
                child: TextField(
                  style: TextStyle(
                    fontSize: height*0.02,

                  ),
                  decoration: InputDecoration(

                    hintText: 'E.g. near apollo hospital',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey,

                    ),
                    isDense: true, // Makes it more compact
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),


                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.circular(3),

                    ),


                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: width*0.04,),
                  Text('Make as my default address', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(25, 25, 25, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)


                ],
              ),
              SizedBox(height: height*0.025,),
              Text('Address type', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(25, 25, 25, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.019,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(height: height*0.015,),
              Row(
                children: [
                  _buildAddressTypeCard(height,width,context,"House","address_home.svg"),
                  SizedBox(width: width*0.05,),
                  _buildAddressTypeCard(height,width,context,"Business","address_business.svg"),
                ],
              ),
              SizedBox(height: height*0.025,),
              InkWell(
                onTap: ()
                {

                },
                child: Center(
                  child: Container(
                    width: width*0.9,
                    height: height*0.07,
                    decoration: BoxDecoration(
                        color: Color(0XFF2E7D32),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add  Address', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'semibold',
                            fontSize: height*0.022,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),

                      ],
                    ),
                  ),
                ),
              ),








            ],
          ),
        ),
      ),
    );
  }
  Widget _buildHeadings(height,width,context,string )
  {
    return    Text(string, textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(25, 25, 25, 1),
        fontFamily: 'Inter',
        fontSize: height*0.019,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
    ),);
  }
  Widget _buildAddressTypeCard(height,width,context,hometype,image)
  {
    return  Container(

     // width: width*0.24,

      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey
          )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12 ,8,12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hometype, textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(76, 76, 76, 1),
                fontFamily: 'Inter',
                fontSize: height*0.017,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1
            ),),
            SizedBox(width: width*0.02,),
            SvgPicture.asset("assets/images/$image")
          ],
        ),
      ),
    );
  }

}