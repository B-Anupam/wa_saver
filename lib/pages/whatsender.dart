import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SendDirect extends StatefulWidget {
  const SendDirect({Key key}) : super(key: key);

  @override
  _SendDirectState createState() => _SendDirectState();
}

class _SendDirectState extends State<SendDirect> {
  TextEditingController numcontroller = new TextEditingController();
  TextEditingController messagecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String fullnumber;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('WhatsApp Send Direct'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/sendmessage.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.35,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Send Direct Message without saving contact',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 40),
            IntlPhoneField(
              decoration: InputDecoration(
                //decoration for Input Field
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN', //default contry code, NP for Nepal
              onChanged: (phone) {
                //when phone number country code is changed
                print(phone.completeNumber); //get complete number
                // print(phone.countryCode); // get country code only
                // print(phone.number);
                fullnumber = phone.completeNumber; // only phone number
              },
            ),
            // TextField(
            //   controller: numcontroller,
            //   textAlign: TextAlign.left,
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'Enter phone number',
            //     hintStyle: TextStyle(color: Colors.grey),
            //   ),
            // ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MaterialButton(
                  onPressed: () async =>
                      await launch("https://wa.me/$fullnumber?text=hello"),
                  child: Text('Open Whatsapp'),
                  elevation: 2,
                  color: Colors.green.shade400),
            ),

            // FlutterOpenWhatsapp.sendSingleMessage(numcontroller.toString());
          ],
        ),
      )),
    );
  }
}
