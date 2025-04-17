import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrackOrderScreen extends StatefulWidget
{
  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  bool isSelected = true;

  final List<String> statuses = [
    "Order Confirmed, (Mar 13)",
    "Shipped",
    "Out for Delivery",
    "Out for Delivery",
  ];

  int currentStep = 2;

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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Text('Track order', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(25, 25, 25, 1),
            fontFamily: 'Inter',
            fontSize: height*0.025,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1
        ),),
        actionsPadding: EdgeInsets.only(right: 8),

        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            _buildOrderIdCard(height,width,context),
            _buildProducts(height,width,context),
            Divider(),
            _buildInstructions(height,width,context),
            Divider(),
            _buildNeedHelp(height,width,context,Colors.green),
            Divider(),
            _buildOrderTracking(height,width,context),
            Divider(),
            _buildOrderDetails(height,width,context),
            Divider(),
            _buildBillSummary(height,width,context),
            _buildPaymentMethod(height,width,context),
           // Divider(),
            _buildDownloadInvoice(height,width,context),
            _buildNeedHelp(height,width,context,Color.fromRGBO(113, 73, 225, 1)),
            Divider(),
            _buildTopPicksForYou(height, width, context),
            SizedBox(height: height*0.01,),



          ],
        ),
      ),

    );
  }

  Widget  _buildOrderIdCard(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,15,8,10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order ID: 3354654654526', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(52, 64, 84, 1),
              fontFamily: 'Inter',
              fontSize: height*0.016,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1
          ),),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/vehicle.svg",color:Color.fromRGBO(200, 3, 51, 1),),
              SizedBox(width: width*0.02,),
              Text('Estimated delivery: May 16, 2022', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(200, 3, 51, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.016,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),)
            ],
          ),
          SizedBox(height: height*0.025,),
          Divider()
        ],
      ),
    );
  }
  Widget  _buildProducts(height,width,context)
  {
    var size=height*0.07;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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

            ],
          ),
        ),

        SizedBox(height: height*0.008,),
        Center(
          child: Container(
            width: width*0.93,
            child: Divider(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width*0.15,
                  height: height*0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/iron_table.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: width*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Travel Steamer Iron for Clothes, 1200W Portable...', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.014,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Text('1kg', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.013,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('₹189',
                          style: TextStyle(
                              fontSize: height*0.015,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: width*0.02,),
                        Text('₹199',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: height*0.015,

                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                      ],
                    ),

                  ],
                )
              ]
          ),
        ),
        SizedBox(height: height*0.008,),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width*0.15,
                  height: height*0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/iron_table.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: width*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Travel Steamer Iron for Clothes, 1200W Portable...', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.014,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Text('1kg', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.013,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('₹189',
                          style: TextStyle(
                              fontSize: height*0.015,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: width*0.02,),
                        Text('₹199',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: height*0.015,

                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                      ],
                    ),

                  ],
                )
              ]
          ),
        ),
        SizedBox(height: height*0.008,),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width*0.15,
                  height: height*0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/iron_table.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: width*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Travel Steamer Iron for Clothes, 1200W Portable...', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.014,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Text('1kg', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.013,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('₹189',
                          style: TextStyle(
                              fontSize: height*0.015,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: width*0.02,),
                        Text('₹199',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: height*0.015,

                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                      ],
                    ),

                  ],
                )
              ]
          ),
        ),
        SizedBox(height: height*0.008,),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width*0.15,
                  height: height*0.08,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/iron_table.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: width*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Travel Steamer Iron for Clothes, 1200W Portable...', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.014,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Text('1kg', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'Inter',
                        fontSize:height*0.013,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.005,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('₹189',
                          style: TextStyle(
                              fontSize: height*0.015,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: width*0.02,),
                        Text('₹199',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: height*0.015,

                            decoration: TextDecoration.lineThrough,
                          ),
                        ),

                      ],
                    ),

                  ],
                )
              ]
          ),
        ),
        SizedBox(height: height*0.008,),
      ],
    );
  }
  Widget _buildOrderTracking(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
      child: Column(
        children: List.generate(statuses.length, (index) {
          final bool isCompleted = index < currentStep;
          final bool isCurrent = index == currentStep - 1;

          return Container(

            color:
            isCurrent ? Color.fromRGBO(13, 118, 0, 0.13) :
            Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isCompleted ? Color.fromRGBO(13, 118, 0, 1) : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: isCompleted
                              ? Color.fromRGBO(13, 118, 0, 1)
                              : Color.fromRGBO(109, 109, 109, 1),
                        ),
                      ),
                      child: isCompleted
                          ? Icon(Icons.check, color: Colors.white, size: 16)
                          : SizedBox.shrink(),
                    ),
                    if (index != statuses.length - 1)
                      Container(
                        width: 3,
                        height: height * 0.06,
                        color: index < currentStep
                            ? Color.fromRGBO(13, 118, 0, 1)
                            : Color.fromRGBO(109, 109, 109, 1),
                      ),
                  ],
                ),
                SizedBox(width: width*0.04),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4,0,0),
                      child: (index != 1)
                          ? Text(
                        statuses[index],
                        style: TextStyle(
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w500,
                          color: isCompleted
                              ? Colors.black
                              : Color.fromRGBO(109, 109, 109, 1),
                        ),
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            statuses[index],
                            style: TextStyle(
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w500,
                              color: isCompleted
                                  ? Colors.black
                                  : Color.fromRGBO(109, 109, 109, 1),
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            'Your items has left a Hellostore factory, Mon 17th Mar',
                            style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontFamily: 'Inter',
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget   _buildInstructions(height,width,context)
  {
    return Container(
      height: height*0.06,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Add delivery instruction', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(76, 76, 76, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),

              SizedBox(width: width*0.05,),
              Container(
                width: 1,
                height: 240,
                color: Colors.grey,
              ),
              SizedBox(width: width*0.05,),
              Text('Cancel Order', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(76, 76, 76, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(width: width*0.05,),
              Container(
                width: 1,
                height: 240,
                color: Colors.grey,
              ),
              SizedBox(width: width*0.05,),
              Text('Buy Again', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(76, 76, 76, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              SizedBox(width: width*0.05,),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetails(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,16,8,8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Details', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
              fontFamily: 'Inter',
              fontSize: height*0.02,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w800,
              height: 1
          ),),
          SizedBox(height: height*0.03,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Order ID', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                SizedBox(width: width*0.22,),
                Text('HS123456789', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                SizedBox(width: width*0.02,),
                Icon(Icons.copy,color:Color.fromRGBO(51, 51, 51, 1),size: height*0.018,)
              ],
            ),
          ),
          Container(
              width: width*0.8,
              child: Divider(
                thickness: 0.5,
              )
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Order Placed', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                SizedBox(width: width*0.13,),
                Text('11 Feb, 10:00 AM', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),

              ],
            ),
          ),
          Container(
              width: width*0.8,
              child: Divider(thickness: 0.5,)
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Arrived at', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                SizedBox(width: width*0.18,),
                Text('+91 1234567890', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),

              ],
            ),
          ),
          Container(
              width: width*0.8,
              child: Divider(thickness: 0.5,)
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivery address', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.017,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                SizedBox(width: width*0.07,),
                Text('GR homes, 23/12,  Bengaluru,\nBENGALURU , KARNATAKA \n560068 India, ', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.016,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.2
                ),),

              ],
            ),
          ),

        ],
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
          Text('Bill Summary', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
              fontFamily: 'Inter',
              fontSize: height*0.02,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w800,
              height: 1
          ),),
          SizedBox(height: height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Price (32 items )', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(25, 25, 25, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.016,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
            padding: const EdgeInsets.fromLTRB(0,12,13,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('TOTAL AMOUNT', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(13, 13, 13, 1),
                    fontFamily: 'Inter',
                    fontSize: height*0.02,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Text('₹199',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: height*0.016,

                    decoration: TextDecoration.lineThrough,
                  ),
                ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Incl. all taxes ad charges', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  fontFamily: 'Inter',
                  fontSize: height*0.013,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Container(
                  color : Color.fromRGBO(228, 237, 226, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Saved ₹12,000', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(76, 175, 80, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.015,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height*0.02,),
          Divider()
        ],
      ),
    );
  }
  Widget  _buildPaymentMethod(height,width,context)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,0,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Method', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
              fontFamily: 'Inter',
              fontSize: height*0.02,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.w800,
              height: 1
          ),),
          SizedBox(height: height*0.025,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: height*0.06,
                  width: width*0.12,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,  // You can change this to any color you want
                      width: 0.5,          // Thin border
                    ),
                  ),
                  child: Image.asset("assets/images/money 2.png")
              ),
              SizedBox(width: width*0.06,),
              Text('Pay on Delivery(Cash/UPI)', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(25, 25, 25, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),)
            ],
          ),
          SizedBox(height: height*0.02,),
          Divider()
        ],
      ),
    );
  }
  Widget  _buildNeedHelp(height,width,context,color)
  {
    return   Padding(
      padding: const EdgeInsets.fromLTRB(12,15,12,15),
      child: Container(
        decoration: BoxDecoration(

        ),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            Text('Need help?', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1),
                fontFamily: 'Inter',
                fontSize: height*0.019,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.bold,
                height: 1
            ),),
            SizedBox(width : width*0.04),
            Column(
              children: [
                Text('Contact Us', textAlign: TextAlign.left, style: TextStyle(
                    color: color,
                    fontFamily: 'Inter',
                    fontSize: height*0.019,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Container(
                  width: width*0.2,
                  height: 2,
                  color:color,
                ),
              ],
            ),

          ],
        ),
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
 Widget  _buildDownloadInvoice(height,width,context)
 {
   return Padding(
     padding: const EdgeInsets.fromLTRB(10,15,0,0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Download Invoice', textAlign: TextAlign.left, style: TextStyle(
             color: Color.fromRGBO(22, 22, 22, 1),
             fontFamily: 'Inter',
             fontSize: height*0.02,
             letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
             fontWeight: FontWeight.w800,
             height: 1
         ),),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,20,20,20),
          child: Container(
            height: height*0.07,
            width: width,
            decoration: BoxDecoration(
              borderRadius : BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color : Color.fromRGBO(245, 245, 245, 1),
              border : Border.all(
                color: Color.fromRGBO(232, 232, 232, 1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Download Invoice', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(25, 25, 25, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                  Spacer(),
                  Image.asset("assets/images/download.png")
                ],
              ),
            ),
          ),
        ),
         Divider()
       ],
     ),
   );
 }
}