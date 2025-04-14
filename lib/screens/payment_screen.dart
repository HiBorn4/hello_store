import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'OrderSummaryScreen.dart';


class PaymentScreen extends StatefulWidget
{
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Text('Payment', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(25, 25, 25, 1),
            fontFamily: 'bold',
            fontSize: height*0.022,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 1,),
              SizedBox(height: height*0.01,),
              _buildPayByUpi(context,height,width),
              Divider(height: 10,thickness: 2,),
              _buildCreditCard(context,height,width),
              Divider(height: 10,thickness: 2,),
              _buildMorePaymentOptions(context,height,width),
              Divider(height: 10,thickness: 2,),
              _buildPreferredPayment(context,height,width),
              SizedBox(height: height*0.02,),
              _buildPlaceOrder(context,height,width),
              SizedBox(height: height*0.02,)





            ],
          ),
        ),
      ),

    );
  }
  Widget _buildPayByUpi (BuildContext context,var height , var width)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pay by UPI app', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(25, 25, 25, 1),
              fontFamily: 'semibold',
              fontSize: height*0.021,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: SvgPicture.asset("assets/images/phonepay_logo.svg"),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Text('PhonePe', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'regular',
                    fontSize: height*0.019,
                    letterSpacing: 0 ,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Radio<bool>(
                  value: true,
                  // groupValue: isSelected,
                  onChanged: (value) {
                    setState(() {
                      //   isSelected = value!;
                    });
                  }, groupValue: null,
                ),

              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: SvgPicture.asset("assets/images/googlepay_logo.svg"),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Text('Google Pay', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'regular',
                    fontSize: height*0.019,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Radio<bool>(
                  value: true,
                  // groupValue: isSelected,
                  onChanged: (value) {
                    setState(() {
                      //   isSelected = value!;
                    });
                  }, groupValue: null,
                ),

              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: Image.asset("assets/images/Frame 758535030.png"),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Text('Paytm', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'regular',
                    fontSize: height*0.019,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Radio<bool>(
                  value: true,
                  
                  // groupValue: isSelected,
                  onChanged: (value) {
                    setState(() {
                      //   isSelected = value!;
                    });
                  }, groupValue: null,
                ),

              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Text('Add New UPI ID', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'regular',
                    fontSize: height*0.019,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.chevron_right),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildCreditCard(BuildContext context,var height , var width)
  {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8,8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Credit and Debit Cards', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(25, 25, 25, 1),
            //  fontFamily: 'semibold',
              fontSize: height*0.021,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Text('Add New UPI ID', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'regular',
                    fontSize: height*0.019,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(Icons.chevron_right),
                )

              ],
            ),
          ),


        ],
      ),
    );
  }
  Widget _buildMorePaymentOptions(BuildContext context, var height, var width)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8,8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More Payment Options', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(25, 25, 25, 1),
             // fontFamily: 'semibold',
              fontSize: height*0.021,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
          SizedBox(height: height*0.01,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: Image.asset("assets/images/Wallet_duotone_line.png"),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add New UPI ID', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'regular',
                        fontSize: height*0.019,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.013,),
                    Text('Paytm, PhonePe, Amazon Pay & more ', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(109, 109, 109, 1),
                        fontFamily: 'regular',
                        fontSize: height*0.015,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(Icons.chevron_right),
                )

              ],
            ),
          ),
          SizedBox(height: height*0.01,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: Image.asset("assets/images/Saving-Bank-1--Streamline-Ultimate.svg.png"),
                  ),
                ),

                SizedBox(width: width*0.03,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Net Banking', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'regular',
                        fontSize: height*0.019,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.013,),
                    Text('Select from list of banks', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(109, 109, 109, 1),
                        fontFamily: 'regular',
                        fontSize: height*0.015,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(Icons.chevron_right),
                )

              ],
            ),
          ),
          SizedBox(height: height*0.01,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: EdgeInsets.all(6),
                    child: Image.asset("assets/images/Union.png"),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Text('EMI', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(25, 25, 25, 1),
                    fontFamily: 'regular',
                    fontSize: height*0.019,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(Icons.chevron_right),
                )

              ],
            ),
          ),




        ],
      ),
    );
  }
  Widget _buildPreferredPayment(BuildContext context, var height, var width)
  {
    return Padding(
      padding:  const EdgeInsets.fromLTRB(8, 15, 8,8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preferred Payments', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(25, 25, 25, 1),
              fontFamily: 'semibold',
              fontSize: height*0.021,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.08,
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
                    padding: EdgeInsets.all(6),
                    child: Image.asset("assets/images/money 2.png"),
                  ),
                ),
                SizedBox(width: width*0.03,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pay on Delivery(Cash/UPI)', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(25, 25, 25, 1),
                        fontFamily: 'regular',
                        fontSize: height*0.019,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    SizedBox(height: height*0.008,),
                    Text('Pay ₹100 online as advance now, and\n the '
                        'rest ₹10000 on delivery. Delivery \ncharge of₹72 applicable ', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(109, 109, 109, 1),
                        fontFamily: 'regular',
                        fontSize: height*0.014,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child:  Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color:
                        //  isSelected ?
                        Color(0XFF2E7D32)
                        //    : Colors.transparent,
                        ,shape: BoxShape.circle,
                        border: Border.all(color:  Color(0XFF2E7D32), width: 2),
                      ),
                      child:
                      //isSelected
                      //  ?
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    //: null,
                  ),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildPlaceOrder(BuildContext context, var height, var width)
  {
    return InkWell(
      onTap: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderSummaryScreen()),
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
              Text('Place Order', textAlign: TextAlign.left, style: TextStyle(
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
    );
  }
}