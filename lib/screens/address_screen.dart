import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_store/screens/Payment/payment_screen.dart';

class AddressScreen extends StatefulWidget
{
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = true;

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
            Center(
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
            SizedBox(height: height*0.03,),
            Center(
              child: Container(
                width: width*0.9,
                height: height*0.146,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 10,10,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.1,
                            height: height*0.03,
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
                          SizedBox(width: width*0.01,),
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
                          Spacer(),
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
                                  fontFamily: 'semibold',
                                  fontSize: height*0.017,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                            ),
                          )

                        ],
                      ),

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
                        Text('Phone number:9012890134 ', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(76, 76, 76, 1),
                            fontFamily: 'regular',
                            fontSize: height*0.015,
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
}
