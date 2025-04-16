import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyOrdersScreen extends StatefulWidget
{
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
   appBar: AppBar(
     leading: IconButton(
       icon: Icon(Icons.arrow_back),
       onPressed: () {
         Navigator.pop(context);
       },
     ),
     title: Text('My Orders',style: TextStyle(
       fontSize: height*0.026
     ),),
   ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchAndFilter(height,width,context),

            _buildItem(height,width,context,"Arriving Tomorrow",
                Color.fromRGBO(13, 118, 0, 1)),

            _buildplus20(height,width,context),
            _buildItem(height,width,context,"Cancelled on 12 Mar, 2025",Color.fromRGBO(237, 0, 0, 1)),
            _buildItem(height,width,context,"Order not placed", Color.fromRGBO(253, 131, 25, 1)),

            _buildDeliveryItem2(height,width,context),
            _buildDeliveryItem(height,width,context),


          ],
        ),
      ),
    );
  }
  Widget _buildSearchAndFilter(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0,10,15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height*0.06,
            width: width*0.63,
            child: TextField(
              style: TextStyle(
                fontSize: height*0.016,
              ),
              decoration: InputDecoration(

                hintText: 'Search products',
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.black, // Thin black border
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),

              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              // Get tap position and show the popup
              //_showPopup(details.globalPosition,context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/images/filter.svg",height: height*0.03,),
                  SizedBox(width: 8),
                  Text(
                    'Filter',
                    style: TextStyle(
                      //color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildplus20(height,width,context)
  {
    var size=50.0;
    return  Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size + 40, // Adjust depending on overlap
                height: size,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: size / 2,
                        backgroundImage: AssetImage('assets/images/iron_table.png'),
                      ),
                    ),
                    Positioned(
                      left: size * 0.3,
                      child: CircleAvatar(
                        radius: size / 2,
                        backgroundImage: AssetImage('assets/images/iron_table.png'),
                      ),
                    ),
                    Positioned(
                      left: size * 0.6,
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                          border: Border.all( color: Color.fromRGBO(13, 118, 0, 1), width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '+20',
                            style: TextStyle(
                              color: Color.fromRGBO(13, 118, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: size * 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8,8,8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fresh Products', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.016,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Text('Arriving on April 20, 2025', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(13, 118, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.015,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Text('₹ 3,389', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.018,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1 /*PERCENT not supported*/
                    ),)
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.keyboard_arrow_up,size: height*0.035,color: Colors.black38,),
              ),


            ],
          ),
          Container(
              width:width*0.9,
              child: Divider(thickness: 0.5,))
        ],
      ),
    );
  }
  Widget _buildItem(height,width,context,string,color)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0,8,10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/iron_table.png",height: height*0.09
              ),
              SizedBox(width: width*0.02,),
              Container(
                height: height*0.09,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Travel Steamer Iron for Clothes, 1200W Port...', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.015,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    Text( string, textAlign: TextAlign.left, style: TextStyle(
                        color: color,
                        fontFamily: 'Inter',
                        fontSize: height*0.014,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    Text('₹ 189', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.016,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                    ),)
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.chevron_right,color: Colors.grey,)
            ],
          ),
          Container(
              width:width*0.9,
              child: Divider(thickness: 0.5,))
        ],
      ),
    );
  }
  Widget _buildDeliveryItem(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10,8,10),
      child: Column(
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/iron_table.png",height: height*0.09),
              SizedBox(width: width*0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Travel Steamer Iron for Clothes, 1200W Port...', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(25, 25, 25, 1),
                      fontFamily: 'Inter',
                      fontSize:height*0.015,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                  SizedBox(height: height*0.02,),
                  Text('Delivered on Nov 20,  2024', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(13, 118, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: height*0.013,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star,color: Colors.orange,),
                      Icon(Icons.star,color: Colors.orange,),
                      Icon(Icons.star,color: Colors.orange,),
                      Icon(Icons.star,color: Colors.orange,),
                      Icon(Icons.star,color: Colors.orange,)
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Text('Write a review', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(13, 118, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: height*0.015,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                  ),)


                ],
              ),
              Container(
                height: height*0.1,
                  child: Icon(Icons.chevron_right,color: Colors.grey,)
              )
            ],
          ),
        ],
      ),
    );
  }
 Widget  _buildDeliveryItem2(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10,8,10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/iron_table.png",height: height*0.09),
              SizedBox(width: width*0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Travel Steamer Iron for Clothes, 1200W Port...', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(25, 25, 25, 1),
                      fontFamily: 'Inter',
                      fontSize:height*0.015,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                  SizedBox(height: height*0.02,),
                  Text('Delivered on Nov 20,  2024', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(13, 118, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: height*0.013,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                  SizedBox(height: height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star,color: Colors.grey,),
                      Icon(Icons.star,color: Colors.grey,),
                      Icon(Icons.star,color: Colors.grey,),
                      Icon(Icons.star,color: Colors.grey,),
                      Icon(Icons.star,color: Colors.grey,),

                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Text('Rate this product now', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(76, 76, 76, 1),
                      fontFamily: 'Inter',
                      fontSize: height*0.015,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                  ),)


                ],
              ),
              Container(
                  height: height*0.1,
                  child: Icon(Icons.chevron_right,color: Colors.grey,)
              )
            ],
          ),
          Container(
              width:width*0.9,
              child: Divider(thickness: 0.8,))
        ],
      ),
    );
  }
}


