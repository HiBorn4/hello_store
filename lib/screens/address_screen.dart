import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_store/screens/add_new_address.dart';
import 'package:hello_store/screens/payment_screen.dart';

class AddressScreen extends StatefulWidget
{
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

      var height = MediaQuery
          .of(context)
          .size
          .height;
      var width = MediaQuery
          .of(context)
          .size
          .width;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          title: Text('Address', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(25, 25, 25, 1),
              fontFamily: 'semibold',
              fontSize: height*0.022,
              letterSpacing: 0 ,
              fontWeight: FontWeight.normal,
              height: 1
          ),),
        ),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 0.4,),
            SizedBox(height: height*0.016,),
            InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAdressScreen()),
                );
              },
              child: Center(
                child: Container(
                  width: width*0.9,
                  height: height*0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(Icons.add,color: Color.fromRGBO(13, 118, 0, 1),),
                      ),
                      SizedBox(width: width*0.03,),
                      Text('Add a new address', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(13, 118, 0, 1),
                       //   fontFamily: 'semibold',
                          fontSize: 16,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.03,),
            Center(
              child: Container(
                width: width*0.9,
               // height: height*0.146,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.1,
                            height: height*0.027,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                            child: isSelected
                                ? Center(
                              child: Container(
                                width: height*0.05,
                                height: height*0.015,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                                : null,
                          ),
                          SizedBox(width: width*0.02,),
                          Text('Rubi', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(25, 25, 25, 1),
                              fontFamily: 'regular',
                              fontSize: height*0.02,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                          SizedBox(width: width*0.02,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.black.withOpacity(0.06)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(25, 25, 25, 1),
                                  fontFamily: 'regular',
                                  fontSize: height*0.015,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                            ),
                          ),



                        ],
                      ),
                      SizedBox(height: height*0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width*0.12,),
                          Text('GR homes, 23/12,  Bengaluru, BENGALURU,\nKARNATAKA 560068 India, ', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(76, 76, 76, 1),
                              fontFamily: 'regular',
                              fontSize: height*0.015,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                        ],
                      ),
                      SizedBox(height: height*0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width*0.12,),
                          Text('Phone number  : 9012890134 ', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(76, 76, 76, 1),
                              fontFamily: 'regular',
                              fontSize: height*0.015,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),)
                        ],
                      ),
                      SizedBox(height: height*0.014,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: width*0.12,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Edit', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(13, 118, 0, 1),
                                  //fontFamily: 'semibold',
                                  fontSize: height*0.017,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                            ),
                          ),
                          SizedBox(width: width*0.05,),
                          InkWell(
                            onTap: ()
                            {
                              _showCustomPopup(context,height,width);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Remove', textAlign: TextAlign.center, style: TextStyle(
                                    color: Colors.black54,
                                    //fontFamily: 'semibold',
                                    fontSize: height*0.017,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.05,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Set as Default', textAlign: TextAlign.center, style: TextStyle(
                                  color: Colors.black54,
                                  //fontFamily: 'semibold',
                                  fontSize: height*0.017,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),

              ),
            ),
            Spacer(),
            InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
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
                      Text('Continue', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'semibold',
                          fontSize: height*0.022,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                      SizedBox(width: width*0.015,),
                      Icon(Icons.chevron_right,color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.03,),
          ],
        ),
      );
  }
  void _showCustomPopup(BuildContext context, double height, double width) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              //height: height * 0.25,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,10 ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Confirm delete?',
                          style: TextStyle(
                            color: Color.fromRGBO(237, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: height*0.02,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/images/cross.svg")
                      ],
                    ),
                    SizedBox(height: height*0.015,),
                    Text('Are you sure you want to delete this address?', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(76, 76, 76, 1),
                        fontFamily: 'Inter',
                        fontSize: height*0.016,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.017,),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color.fromRGBO(76, 76, 76, 1),
                            fontFamily: 'Inter',
                            fontSize: height * 0.016,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                              text: 'Please note : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                              'Deleting this address will not delete any pending orders being shipped to this address. To ensure uninterrupted fulfilment of future orders, please update any Wishlist using the updated address.',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height*0.017,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0XFF2E7D32),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Color(0XFF2E7D32),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: width*0.06,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0XFF2E7D32),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
        );
      },
    );
  }

}
