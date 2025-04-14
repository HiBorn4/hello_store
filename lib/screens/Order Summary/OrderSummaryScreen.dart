import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_store/screens/Track%20Order/TrackOrderScreen.dart';

class OrderSummaryScreen extends StatefulWidget
{
  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: Text(
          'Order Summary', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(25, 25, 25, 1),
            fontFamily: 'regular',
            fontSize: height * 0.022,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderPlaced(height, width, context),
              _buildExpectedDelivery(height, width, context),
              Divider(),
              _buildShippingtoCustomer(height,width,context),
              Divider(),
              _buildContinueShopping(height,width,context),
              Divider(),
              _buildTopPicksForYou(height,width,context)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildOrderPlaced(height, width, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Container(
                width: width * 0.1,
                height: height * 0.03,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: height * 0.02,
                  ),
                ),
              ),
            ),
            SizedBox(width: width * 0.05,),
            Text('Order Placed, Thank You', textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(22, 22, 22, 1),
                  fontFamily: 'inter',
                  fontSize: height * 0.024,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                  height: 1
              ),)

          ],
        ),
        SizedBox(height: height * 0.007,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: width * 0.15,),
            Text(
              'you’ll receive the confirmation text with your\norder number.',
              textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                //fontFamily: 'regular',
                fontSize: height * 0.017,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.2
            ),)
          ],
        ),
        SizedBox(height: height*0.03,),
        Divider(),

      ],
    );

  }

  Widget _buildExpectedDelivery(height, width, context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0,15),
      child: Center(
        child: Container(
          height: height*0.07,
          width: width*0.93,
          color: Color(0xFFE7F9ED),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SvgPicture.asset("assets/images/vehicle.svg"),
              ),
              SizedBox(width: width*0.04,),
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
                  fontFamily: 'semibold',
                  fontSize: 12,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              Text(' on this order', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(76, 76, 76, 1),
                  fontFamily: 'regular',
                  fontSize: 12,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
            ],
          ),
        ),

      ),
    );
  }
  Widget _buildShippingtoCustomer(height, width, context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,8,8,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping to Rubika, ', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
              // fontFamily: 'semibold',
              fontSize: height*0.024,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Rubi', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(25, 25, 25, 1),
                  // fontFamily: 'regular',
                  fontSize: height*0.022,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(width: width*0.04,),
              Text('Home', textAlign: TextAlign.center, style: TextStyle(
                  color: Color.fromRGBO(25, 25, 25, 1),
                  // fontFamily: 'regular',
                  fontSize: height*0.017,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),


            ],
          ),
          SizedBox(height: height*0.02,),
          Text('GR homes, 23/12,  Bengaluru, BENGALURU , KARNATAKA 560068 India, ', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(76, 76, 76, 1),
              // fontFamily: 'regular',
              fontSize: height*0.016,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.24
          ),),
          SizedBox(height: height*0.02,),
          Text('Phone number: 9012890134', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(76, 76, 76, 1),
              //    fontFamily: 'regular',
              fontSize: height*0.016,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1
          ),),
          SizedBox(height: height*0.04,),
          InkWell(
            onTap: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackOrderScreen()),
              );
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
                    Text('Track Order', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        // fontFamily: 'semibold',
                        fontSize: height*0.022,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.bold,
                        height: 1
                    ),),
                    SizedBox(width: width*0.015,),
                    Icon(Icons.chevron_right,color: Colors.white,)
                  ],
                ),
              ),
            ),
          )
        ],

      ),
    );
  }
  Widget _buildContinueShopping(height, width, context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,10,8,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Continue Shopping', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              //  fontFamily: 'semibold',
              fontSize: height*0.02,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w800,
              height: 1.1428571428571428
          ),),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height*0.18,
                            width: width*0.36,
                            child: Image.asset("assets/images/iron_table.png")
                        ),
                        SizedBox(height: height*0.01,),
                        Text('Travel Steamer Iron for Clothe...', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        SizedBox(height: height*0.004,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹189',
                              style: TextStyle(
                                fontSize: height*0.016,
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
                        SizedBox(height: height*0.003,),
                        Text('- 10% Off', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(200, 3, 51, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.012,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star_border,color: Colors.orange,size: height*0.02,),
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
                        SizedBox(height: height*0.006,),
                        Text('50+ bought in past month', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)

                      ],
                    ),
                  ),
                ),
                SizedBox(width: width*0.013,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height*0.18,
                            width: width*0.36,
                            child: Image.asset("assets/images/iron_table.png")
                        ),
                        SizedBox(height: height*0.01,),
                        Text('Travel Steamer Iron for Clothe...', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        SizedBox(height: height*0.004,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹189',
                              style: TextStyle(
                                fontSize: height*0.016,
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
                        SizedBox(height: height*0.003,),
                        Text('- 10% Off', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(200, 3, 51, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.012,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star_border,color: Colors.orange,size: height*0.02,),
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
                        SizedBox(height: height*0.006,),
                        Text('50+ bought in past month', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)

                      ],
                    ),
                  ),
                ),
                SizedBox(width: width*0.013,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height*0.18,
                            width: width*0.36,
                            child: Image.asset("assets/images/iron_table.png")
                        ),
                        SizedBox(height: height*0.01,),
                        Text('Travel Steamer Iron for Clothe...', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        SizedBox(height: height*0.004,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹189',
                              style: TextStyle(
                                fontSize: height*0.016,
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
                        SizedBox(height: height*0.003,),
                        Text('- 10% Off', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(200, 3, 51, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.012,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star_border,color: Colors.orange,size: height*0.02,),
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
                        SizedBox(height: height*0.006,),
                        Text('50+ bought in past month', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)

                      ],
                    ),
                  ),
                ),
                SizedBox(width: width*0.013,),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildTopPicksForYou(height, width, context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,10,8,15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Picks For You', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              // fontFamily: 'semibold',
              fontSize: height*0.02,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w800,
              height: 1.1428571428571428
          ),),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height*0.18,
                            width: width*0.36,
                            child: Image.asset("assets/images/iron_table.png")
                        ),
                        SizedBox(height: height*0.01,),
                        Text('Travel Steamer Iron for Clothe...', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        SizedBox(height: height*0.004,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹189',
                              style: TextStyle(
                                fontSize: height*0.016,
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
                        SizedBox(height: height*0.003,),
                        Text('- 10% Off', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(200, 3, 51, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.012,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star_border,color: Colors.orange,size: height*0.02,),
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
                        SizedBox(height: height*0.006,),
                        Text('50+ bought in past month', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)

                      ],
                    ),
                  ),
                ),
                SizedBox(width: width*0.013,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height*0.18,
                            width: width*0.36,
                            child: Image.asset("assets/images/iron_table.png")
                        ),
                        SizedBox(height: height*0.01,),
                        Text('Travel Steamer Iron for Clothe...', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        SizedBox(height: height*0.004,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹189',
                              style: TextStyle(
                                fontSize: height*0.016,
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
                        SizedBox(height: height*0.003,),
                        Text('- 10% Off', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(200, 3, 51, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.012,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star_border,color: Colors.orange,size: height*0.02,),
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
                        SizedBox(height: height*0.006,),
                        Text('50+ bought in past month', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)

                      ],
                    ),
                  ),
                ),
                SizedBox(width: width*0.013,),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height*0.18,
                            width: width*0.36,
                            child: Image.asset("assets/images/iron_table.png")
                        ),
                        SizedBox(height: height*0.01,),
                        Text('Travel Steamer Iron for Clothe...', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        SizedBox(height: height*0.004,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('₹189',
                              style: TextStyle(
                                fontSize: height*0.016,
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
                        SizedBox(height: height*0.003,),
                        Text('- 10% Off', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(200, 3, 51, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.012,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star,color: Colors.orange,size: height*0.02,),
                            Icon(Icons.star_border,color: Colors.orange,size: height*0.02,),
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
                        SizedBox(height: height*0.006,),
                        Text('50+ bought in past month', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            // fontFamily: 'regular',
                            fontSize: height*0.011,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)

                      ],
                    ),
                  ),
                ),
                SizedBox(width: width*0.013,),

              ],
            ),
          )
        ],
      ),
    );
  }


}