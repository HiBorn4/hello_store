import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_store/screens/Address/address_screen.dart';

class CartScreen extends StatefulWidget
{
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'My Cart',
            style: TextStyle(color: Colors.black,
            fontSize: kToolbarHeight*0.4),
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Stack(
        children: [ SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,10,0,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _buildSearchAndCategories(height,width,context),
                Divider(),
                _buildExpectedMultipleDelivery(height,width,context),
                Divider(thickness: 2,),
                _buildCartItems(height,width,context),
                Divider(thickness: 2,),
                _buildWishlist(height,width,context),
                Divider(thickness: 2,),
                _buildCoupon(height,width,),
                Divider(thickness: 2,),
                _buildBillSummary(height, width, context),
                Divider(thickness: 2,),
                _buildEnder(height,width,context),
                Divider(thickness: 2,),
                SizedBox(height: height*0.2,)
              ],
            ),
          ),
        ),
          Positioned(
            bottom: height*0.08,
            left: 0,
            right: 0,
            child:   _buildProceedToBuy(height,width,context),
          )
    ]
      ),
    );
  }
  Widget  _buildSearchAndCategories(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.filter_list, color: Colors.grey),
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
              )
            ],
          ),
          SizedBox(height: height*0.014,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color : Color.fromRGBO(237, 237, 237, 1),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('All Categories (12)', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontFamily: 'Inter',
                          fontSize: height*0.016,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4,0,4,0),
                        child: Icon(Icons.expand_more),
                      )
                    ],
                  ),
                )
              ),

              Text('Grocery', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(76, 76, 76, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.016,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              Text('Minutes (11)', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(76, 76, 76, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.016,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),

            ],
          ),




        ],
      ),
    );
  }
 Widget _buildExpectedMultipleDelivery(height,width,context)
 {
   return  Padding(
     padding: const EdgeInsets.fromLTRB(12, 10,12,10),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           decoration: BoxDecoration(
             borderRadius : BorderRadius.only(
               topLeft: Radius.circular(8),
               topRight: Radius.circular(8),
               bottomLeft: Radius.circular(8),
               bottomRight: Radius.circular(8),

             ),
             color : Color.fromRGBO(231, 249, 237, 1),
           ),

           child: Padding(
             padding: const EdgeInsets.all(12.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SvgPicture.asset("assets/images/vehicle.svg"),
                 SizedBox(width: width*0.03,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('Expected', textAlign: TextAlign.left, style: TextStyle(
                               color: Color.fromRGBO(76, 76, 76, 1),
                               // fontFamily: 'regular',
                               fontSize: height*0.016,
                               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                               fontWeight: FontWeight.normal,
                               height: 1
                           ),),
                           Text('  multiple delivery ', textAlign: TextAlign.left, style: TextStyle(
                               color: Color(0XFF2E7D32),

                               fontSize: height*0.016,
                               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                               fontWeight: FontWeight.normal,
                               height: 1
                           ),),
                           Text(' on this order', textAlign: TextAlign.left, style: TextStyle(
                               color: Color.fromRGBO(76, 76, 76, 1),
                               fontSize: 16,
                               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                               fontWeight: FontWeight.normal,
                               height: 1
                           ),),
                         ],
                       ),
                     SizedBox(height: height*0.005,),
                     Text('your items will be delivered from 5differnt stores', textAlign: TextAlign.center, style: TextStyle(
                         color: Color.fromRGBO(76, 76, 76, 1),
                         fontFamily: 'Inter',
                         fontSize: height*0.013,
                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                         fontWeight: FontWeight.normal,
                         height: 1
                     ),)

                   ],
                 )
               ],
             ),
           ),
         ),
         SizedBox(height: height*0.024,),
         Container(
           width: double.infinity,
           height: MediaQuery.of(context).size.height * 0.08,
           decoration: BoxDecoration(
             border: Border.all(color: Colors.green),
             borderRadius: BorderRadius.circular(10),
           ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Add item worth ₹200, to get free delivery ', textAlign: TextAlign.left, style: TextStyle(
                         color: Color.fromRGBO(76, 76, 76, 1),
                         fontFamily: 'Inter',
                         fontSize: height*0.0155,
                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                         fontWeight: FontWeight.normal,
                         height: 1
                     ),),
                    SizedBox(height: height*0.01,),
                    Container(
                      height: height*0.005,
                      width: width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Container(
                        height: height*0.005,
                        width: width*0.4,

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                          Container(
                            height: height*0.005,
                            width: width*0.3,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),

                          )

                        ]
                      ),
                    )



                   ],
                 ),
                 Spacer(),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.green),
                     borderRadius: BorderRadius.circular(8),
                   ),
                   child: Text(
                     'Add',
                     style: TextStyle(color: Colors.green, ),
                   ),
                 )

               ],
             ),
           )
         )
       ],
     ),
   );
 }
  Widget _buildCartItems(height,width,context)
  {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(9,12,9,12),
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5)
              )
            ),
           child: Padding(
             padding: const EdgeInsets.fromLTRB(9,9,12,9),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                      Container(
                         height: height*0.11,
                          width: width*0.22,
                          child: Image.asset("assets/images/iron_table.png")
                      ),
                     SizedBox(width: width*0.02,),
                     Container(
                       height: height*0.11,
                       //width: width*0.22,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Travel Steamer Iron for Clothes, 1250W....', textAlign: TextAlign.left, style: TextStyle(
                                   color: Color.fromRGBO(25, 25, 25, 1),
                                   fontFamily: 'Inter',
                                   fontSize: 12,
                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                   fontWeight: FontWeight.normal,
                                   height: 1.5
                               ),),
                               Container(
                                 decoration: BoxDecoration(
                                   borderRadius : BorderRadius.only(
                                     topLeft: Radius.circular(4),
                                     topRight: Radius.circular(4),
                                     bottomLeft: Radius.circular(4),
                                     bottomRight: Radius.circular(4),
                                   ),
                                   color : Color.fromRGBO(230, 230, 230, 1),
                                 ),
                                 padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                 child: Text('23 cenimeters', textAlign: TextAlign.left, style: TextStyle(
                                     color: Color.fromRGBO(102, 102, 102, 1),
                                     fontFamily: 'Inter',
                                     fontSize: height*0.012,
                                     letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                     fontWeight: FontWeight.normal,
                                     height: 1
                                 ),),
                               ),
                             ],
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                               Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                               Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                               Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                               Icon(Icons.star_border,color: Colors.orange,size: height*0.016,),
                               SizedBox(width: width*0.013,),
                               Text('4,764', textAlign: TextAlign.left, style: TextStyle(
                                   color: Color.fromRGBO(102, 102, 102, 1),
                                   //    fontFamily: 'regular',
                                   fontSize: height*0.011,
                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                   fontWeight: FontWeight.normal,
                                   height: 1
                               ),)
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text('₹189',
                                 style: TextStyle(
                                   fontSize: height*0.016,
                                   fontWeight: FontWeight.bold
                                   //    fontFamily: 'regular'
                                 ),
                               ),
                               SizedBox(width: width*0.02,),
                               Text('₹199',
                                 style: TextStyle(
                                   color: Colors.black.withOpacity(0.5),
                                   fontSize: height*0.016,
                                   //fontFamily: 'regular',
                                   decoration: TextDecoration.lineThrough,
                                 ),
                               ),

                             ],
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text('Free delivery Thu, 11 Apr', textAlign: TextAlign.left, style: TextStyle(
                             fontFamily: 'Inter',
                             fontSize: height*0.014,
                             letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                             fontWeight: FontWeight.normal,
                             height: 1
                         ),),
                         SizedBox(width: width*0.02,),

                         Container(
                             width: 3,
                             height: 3,
                             decoration: BoxDecoration(
                               color : Color.fromRGBO(0, 0, 0, 1),
                               borderRadius : BorderRadius.all(Radius.elliptical(3, 3)),
                             )
                         ),
                         SizedBox(width: width*0.02,),
                         Text('₹199',
                           style: TextStyle(
                             color: Colors.black.withOpacity(0.5),
                             fontSize: height*0.014,
                             //fontFamily: 'regular',
                             decoration: TextDecoration.lineThrough,
                           ),
                         ),
                         SizedBox(width: width*0.02,),
                         Text('Free', textAlign: TextAlign.left, style: TextStyle(
                             color: Color.fromRGBO(13, 118, 0, 1),
                             fontFamily: 'Inter',
                             fontSize: height*0.014,
                             letterSpacing: 0,
                             fontWeight: FontWeight.normal,
                             height: 1.5 /*PERCENT not supported*/
                         ),)

                       ],
                     ),
                     Spacer(),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.green),
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Icon(Icons.remove, color: Colors.green,size: height*0.025,),
                           SizedBox(width: width*0.03),
                           Text(
                             '1',
                             style: TextStyle(fontSize: height*0.018, fontWeight: FontWeight.bold,
                             color:Color(0xFF006400))
                           ),
                           SizedBox(width: width*0.03),
                           Icon(Icons.add, color: Colors.green,size: height*0.025,),
                         ],
                       ),
                     )

                   ],
                 )
               ],
             ),
           ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9,0,9,12),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(9,9,12,9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: height*0.11,
                          width: width*0.22,
                          child: Image.asset("assets/images/iron_table.png")
                      ),
                      SizedBox(width: width*0.02,),
                      Container(
                        height: height*0.11,
                        //width: width*0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Travel Steamer Iron for Clothes, 1250W....', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(25, 25, 25, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color : Color.fromRGBO(230, 230, 230, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                  child: Text('23 cenimeters', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                      fontFamily: 'Inter',
                                      fontSize: height*0.012,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star_border,color: Colors.orange,size: height*0.016,),
                                SizedBox(width: width*0.013,),
                                Text('4,764', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    //    fontFamily: 'regular',
                                    fontSize: height*0.011,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('₹189',
                                  style: TextStyle(
                                      fontSize: height*0.016,
                                      fontWeight: FontWeight.bold
                                    //    fontFamily: 'regular'
                                  ),
                                ),
                                SizedBox(width: width*0.02,),
                                Text('₹199',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: height*0.016,
                                    //fontFamily: 'regular',
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Free delivery Thu, 11 Apr', textAlign: TextAlign.left, style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: height*0.014,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                          SizedBox(width: width*0.02,),

                          Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                color : Color.fromRGBO(0, 0, 0, 1),
                                borderRadius : BorderRadius.all(Radius.elliptical(3, 3)),
                              )
                          ),
                          SizedBox(width: width*0.02,),
                          Text('₹199',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: height*0.014,
                              //fontFamily: 'regular',
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: width*0.02,),
                          Text('Free', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(13, 118, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: height*0.014,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                          ),)

                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.remove, color: Colors.green,size: height*0.025,),
                            SizedBox(width: width*0.03),
                            Text(
                                '1',
                                style: TextStyle(fontSize: height*0.018, fontWeight: FontWeight.bold,
                                    color:Color(0xFF006400))
                            ),
                            SizedBox(width: width*0.03),
                            Icon(Icons.add, color: Colors.green,size: height*0.025,),
                          ],
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9,0,9,12),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(9,9,12,9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: height*0.11,
                          width: width*0.22,
                          child: Image.asset("assets/images/iron_table.png")
                      ),
                      SizedBox(width: width*0.02,),
                      Container(
                        height: height*0.11,
                        //width: width*0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Travel Steamer Iron for Clothes, 1250W....', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(25, 25, 25, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color : Color.fromRGBO(230, 230, 230, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                  child: Text('23 cenimeters', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                      fontFamily: 'Inter',
                                      fontSize: height*0.012,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star_border,color: Colors.orange,size: height*0.016,),
                                SizedBox(width: width*0.013,),
                                Text('4,764', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    //    fontFamily: 'regular',
                                    fontSize: height*0.011,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('₹189',
                                  style: TextStyle(
                                      fontSize: height*0.016,
                                      fontWeight: FontWeight.bold
                                    //    fontFamily: 'regular'
                                  ),
                                ),
                                SizedBox(width: width*0.02,),
                                Text('₹199',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: height*0.016,
                                    //fontFamily: 'regular',
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Free delivery Thu, 11 Apr', textAlign: TextAlign.left, style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: height*0.014,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                          SizedBox(width: width*0.02,),

                          Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                color : Color.fromRGBO(0, 0, 0, 1),
                                borderRadius : BorderRadius.all(Radius.elliptical(3, 3)),
                              )
                          ),
                          SizedBox(width: width*0.02,),
                          Text('₹199',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: height*0.014,
                              //fontFamily: 'regular',
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: width*0.02,),
                          Text('Free', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(13, 118, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: height*0.014,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                          ),)

                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.remove, color: Colors.green,size: height*0.025,),
                            SizedBox(width: width*0.03),
                            Text(
                                '1',
                                style: TextStyle(fontSize: height*0.018, fontWeight: FontWeight.bold,
                                    color:Color(0xFF006400))
                            ),
                            SizedBox(width: width*0.03),
                            Icon(Icons.add, color: Colors.green,size: height*0.025,),
                          ],
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9,0,9,12),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(9,9,12,9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: height*0.11,
                          width: width*0.22,
                          child: Image.asset("assets/images/iron_table.png")
                      ),
                      SizedBox(width: width*0.02,),
                      Container(
                        height: height*0.11,
                        //width: width*0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Travel Steamer Iron for Clothes, 1250W....', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(25, 25, 25, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color : Color.fromRGBO(230, 230, 230, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                  child: Text('23 cenimeters', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                      fontFamily: 'Inter',
                                      fontSize: height*0.012,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star_border,color: Colors.orange,size: height*0.016,),
                                SizedBox(width: width*0.013,),
                                Text('4,764', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    //    fontFamily: 'regular',
                                    fontSize: height*0.011,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('₹189',
                                  style: TextStyle(
                                      fontSize: height*0.016,
                                      fontWeight: FontWeight.bold
                                    //    fontFamily: 'regular'
                                  ),
                                ),
                                SizedBox(width: width*0.02,),
                                Text('₹199',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: height*0.016,
                                    //fontFamily: 'regular',
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Free delivery Thu, 11 Apr', textAlign: TextAlign.left, style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: height*0.014,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                          SizedBox(width: width*0.02,),

                          Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                color : Color.fromRGBO(0, 0, 0, 1),
                                borderRadius : BorderRadius.all(Radius.elliptical(3, 3)),
                              )
                          ),
                          SizedBox(width: width*0.02,),
                          Text('₹199',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: height*0.014,
                              //fontFamily: 'regular',
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: width*0.02,),
                          Text('Free', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(13, 118, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: height*0.014,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                          ),)

                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.remove, color: Colors.green,size: height*0.025,),
                            SizedBox(width: width*0.03),
                            Text(
                                '1',
                                style: TextStyle(fontSize: height*0.018, fontWeight: FontWeight.bold,
                                    color:Color(0xFF006400))
                            ),
                            SizedBox(width: width*0.03),
                            Icon(Icons.add, color: Colors.green,size: height*0.025,),
                          ],
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
  Widget _buildWishlist(height,width,context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8,12,8,12),
          child: Text('Wishlist', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Inter',
              fontSize: height*0.02,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9,0,9,12),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(9,9,12,9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: height*0.11,
                          width: width*0.22,
                          child: Image.asset("assets/images/iron_table.png")
                      ),
                      SizedBox(width: width*0.02,),
                      Container(
                        height: height*0.11,
                        //width: width*0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Travel Steamer Iron for Clothes, 1250W....', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(25, 25, 25, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color : Color.fromRGBO(230, 230, 230, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                  child: Text('23 cenimeters', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                      fontFamily: 'Inter',
                                      fontSize: height*0.012,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star_border,color: Colors.orange,size: height*0.016,),
                                SizedBox(width: width*0.013,),
                                Text('4,764', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    //    fontFamily: 'regular',
                                    fontSize: height*0.011,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('₹189',
                                  style: TextStyle(
                                      fontSize: height*0.016,
                                      fontWeight: FontWeight.bold
                                    //    fontFamily: 'regular'
                                  ),
                                ),
                                SizedBox(width: width*0.02,),
                                Text('₹199',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: height*0.016,
                                    //fontFamily: 'regular',
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color : Colors.grey.withOpacity(0.15),
                        ),
                        width: width*0.43,
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12,0,12),
                          child: Center(
                            child: Text('Remove', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(25, 25, 25, 1),
                                fontFamily: 'Inter',
                                fontSize: height*0.016,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color.fromRGBO(13, 118, 0, 1),
                          )
                        ),
                        width: width*0.43,
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12,0,12),
                          child: Center(
                            child: Text('Move to cart', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(13, 118, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: height*0.016,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9,0,9,12),
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(9,9,12,9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: height*0.11,
                          width: width*0.22,
                          child: Image.asset("assets/images/iron_table.png")
                      ),
                      SizedBox(width: width*0.02,),
                      Container(
                        height: height*0.11,
                        //width: width*0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Travel Steamer Iron for Clothes, 1250W....', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(25, 25, 25, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5
                                ),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color : Color.fromRGBO(230, 230, 230, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                  child: Text('23 cenimeters', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                      fontFamily: 'Inter',
                                      fontSize: height*0.012,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  ),),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star,color: Colors.orange,size: height*0.016,),
                                Icon(Icons.star_border,color: Colors.orange,size: height*0.016,),
                                SizedBox(width: width*0.013,),
                                Text('4,764', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    //    fontFamily: 'regular',
                                    fontSize: height*0.011,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('₹189',
                                  style: TextStyle(
                                      fontSize: height*0.016,
                                      fontWeight: FontWeight.bold
                                    //    fontFamily: 'regular'
                                  ),
                                ),
                                SizedBox(width: width*0.02,),
                                Text('₹199',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: height*0.016,
                                    //fontFamily: 'regular',
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color : Colors.grey.withOpacity(0.15),
                        ),
                        width: width*0.43,
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12,0,12),
                          child: Center(
                            child: Text('Remove', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(25, 25, 25, 1),
                                fontFamily: 'Inter',
                                fontSize: height*0.016,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromRGBO(13, 118, 0, 1),
                            )
                        ),
                        width: width*0.43,
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12,0,12),
                          child: Center(
                            child: Text('Move to cart', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(13, 118, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: height*0.016,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),


      ]

    );
  }
  Widget  _buildCoupon(height,width,)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12,12,12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color : Colors.grey.withOpacity(0.07),
          border : Border.all(
            color: Color.fromRGBO(232, 232, 232, 1),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,10,10,10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/discount_star.svg"),
                  SizedBox(width: width*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Save ₹ 599 more on this order  ', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(13, 13, 13, 1),
                          fontFamily: 'Inter',
                          fontSize: height*0.016,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                      SizedBox(height: height*0.005,),
                      Text('Code : STE123', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(109, 109, 109, 1),
                          fontFamily: 'Inter',
                          fontSize: height*0.014,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(13, 118, 0, 1),
                        )
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 12,15,12),
                      child: Center(
                        child: Text('Apply', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(13, 118, 0, 1),
                            fontFamily: 'regular',
                            fontSize: height*0.016,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.bold,
                            height: 1
                        ),),
                      ),
                    ),
                  ),

                ],
              ),
              Divider(thickness: 0.6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('View all coupons', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: height*0.015,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                  SizedBox(width: width*0.02,),
                  Icon(Icons.chevron_right)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBillSummary(height,width,context)
  {
    var dashWidth=7.0;
    var dashHeight=1.0;
    var gap=4;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,16,8,8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Details', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
              fontFamily: 'Inter',
              fontSize: height*0.019,
              letterSpacing: 0 ,
              height: 1
          ),),
          SizedBox(height: height*0.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Price (32 items )', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(25, 25, 25, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.016,
                  letterSpacing: 0 ,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('₹1599',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: height*0.016,

                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: width*0.02,),
                    Text('₹1299',
                      style: TextStyle(
                          fontSize: height*0.016,
                          fontWeight: FontWeight.bold
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.01,),
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Discount', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.016,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Text('-₹300', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.016,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1
                ),),

              ],
            ),
          ),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Platform fee',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: height*0.016,
                    height: 1
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Text('₹02', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.016,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1
                ),),
              ),
            ],
          ),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Shipping fee',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: height*0.016,
                    height: 1.6
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Row(
                  children: [
                    Text('-40₹', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.016,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        height: 1
                    ),),
                    SizedBox(width: width*0.02,),
                    Text('Free', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(3, 153, 5, 1),
                        fontFamily: 'Inter',
                        fontSize: 14,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.02,),
          Container(
            width: width*0.91,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final boxCount = (constraints.maxWidth / (dashWidth + gap)).floor();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(boxCount, (_) {
                    return Container(
                      width: dashWidth,
                      height: dashHeight,
                      color: Colors.grey,
                    );
                  }),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,12,13,12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('TOTAL AMOUNT', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(13, 13, 13, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.02,
                    letterSpacing: 0 ,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),

                SizedBox(width: width*0.02,),
                Text('₹12999',
                  style: TextStyle(
                      fontSize: height*0.023,
                      fontWeight: FontWeight.bold
                  ),
                ),


              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildEnder(height,width,context)
  {
   return Padding(
     padding: const EdgeInsets.fromLTRB(0,12,0,12),
     child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset("assets/images/genuinee.svg"),
              SizedBox(height: height*0.01,),
              Text('Genuine products', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(109, 109, 109, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.015,
                  letterSpacing: 0 ,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),)
              ]
          ),
          Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color : Color.fromRGBO(109, 109, 109, 1),
                borderRadius : BorderRadius.all(Radius.elliptical(4, 4)),
              )
          ),
          Column(
              children: [
                SvgPicture.asset("assets/images/refund.svg"),
                SizedBox(height: height*0.01,),
                Text('100% Refundable', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(109, 109, 109, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.015,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
              ]
          ),
          Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color : Color.fromRGBO(109, 109, 109, 1),
                borderRadius : BorderRadius.all(Radius.elliptical(4, 4)),
              )
          ),
          Column(
              children: [
                SvgPicture.asset("assets/images/secure.svg"),
                SizedBox(height: height*0.01,),
                Text('Secure Payment', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(109, 109, 109, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.015,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
              ]
          ),

        ],
      ),
   );
  }
  Widget _buildProceedToBuy(height,width,context)
  {
    return Container(
      color: Colors.white,
      child: Column(
          children: [
            Container(
                color : Color.fromRGBO(228, 237, 226, 1),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/discount_star.svg"),
                      Text('Saved ₹12,000 on this order', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(76, 175, 80, 1),
                          fontFamily: 'Inter',
                          fontSize: height*0.015 ,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),)
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,12,16,12),
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('₹20000',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: height*0.016,

                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: width*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹14990',
                              style: TextStyle(
                                  fontSize: height*0.022,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            SvgPicture.asset("assets/images/instruct.svg")
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddressScreen()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF007E33),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10,15,10),
                          child: Text('Proceed to Buy', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: height*0.02,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
      ),
    );
  }


}