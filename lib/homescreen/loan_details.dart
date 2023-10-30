import 'package:flutter/material.dart';
import 'package:gimedhas_assignment/homescreen/currency_value.dart';
import 'package:gimedhas_assignment/local_storage.dart';

class LoanDetails extends StatefulWidget {
 const LoanDetails({super.key});

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  String name = "";
  String email = "";
  String price = "";
  String tractordetails = "";
  String phonenumber = "";
  getdetails() {
    SecureStorage.readData("name").then((value) {
      setState(() {
        if(value !=null){name = value;

        }
        
      });
    });
    SecureStorage.readData("email").then((value) {
      setState(() {
        email = value;
      });
    });
    SecureStorage.readData("price").then((value) {
      setState(() {
        price = value;
      });
    });
    SecureStorage.readData("tracorname").then((value) {
      setState(() {
        tractordetails = value;
      });
    });
    SecureStorage.readData("phonenumber").then((value) {
      setState(() {
        phonenumber = value;
      });
    });
    print(name);
  }

  @override
  void initState() {
    getdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Confirm your Details again",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Name:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                    text: name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ])),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Email:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                    text: email,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ])),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Mobile number:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                    text: phonenumber,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ])),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "tractor details:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                    text: tractordetails,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ])),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Loan ammount",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45)),
                const WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                    text: " ₹ ${price}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ])),
              const SizedBox(
                height: 300,
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      SecureStorage.deleteAll();
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return CurrencyValue();
                     },));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 12.0,
                        textStyle: const TextStyle(color: Colors.white)),
                    child: const Text('Back'),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
