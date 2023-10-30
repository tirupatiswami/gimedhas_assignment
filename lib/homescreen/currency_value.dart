import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:gimedhas_assignment/homescreen/loan_form.dart';
import 'package:gimedhas_assignment/homescreen/tractor_info.dart';
import 'package:gimedhas_assignment/main.dart';
import 'package:gimedhas_assignment/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyValue extends StatefulWidget {
  const CurrencyValue({super.key});

  @override
  State<CurrencyValue> createState() => _CurrencyValueState();
}

class _CurrencyValueState extends State<CurrencyValue> {
  List countries = [
    "USD",
    "Australia",
    "Bulgaria",
    "Brazil",
    "Canada",
    "Swiss",
    "China",
    "CZech Koruna",
    "Danish Krone",
    "European Union",
    "United Kingdom",
    "Hong Kong",
    "Croatian",
    "Hungartia",
    "Indonesia",
    "Israel",
    "India",
    "Kingdom of Sweden",
    "Japan",
    "South Korean",
    "Mexico",
    "Malaysia",
    "Kingdom of Norway",
    "New Zealand",
    "Philippine",
    "Poland",
    "Roman",
    "Russian",
    "Swedan",
    "Singapore",
    "Thailand",
    "Turkey",
    "United States",
    "South Africa",
  ];

  CurrencyInfo currencyInfo = CurrencyInfo();
  Future<void> currencyApi() async {
    final response = await http.get(
      Uri.parse(
          'https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_Vs0FF5pN46y70lNxlkbag1NaTDIJXf0fpgsITTBY'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      printInfo(info: data['data'].toString());
      setState(() {
        currencyInfo = CurrencyInfo.fromJson(data['data']);
      });
    } else {
      printInfo(info: response.body.toString());
    }
  }
  @override
  void dispose() {
    name ==""?
    currencyApi():null;
    super.dispose();
  }

  @override
  void initState() {
    currencyApi();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Currency value in Different Countires",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    Text(
                      'Value in \$',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                currentValueWidget(0, currencyInfo.usd),
                currentValueWidget(1, currencyInfo.australianDolor),
                currentValueWidget(2, currencyInfo.brazilianReal),
                currentValueWidget(3, currencyInfo.bulgarianCurrency),
                currentValueWidget(4, currencyInfo.canadianDollar),
                currentValueWidget(5, currencyInfo.swissCurrency),
                currentValueWidget(6, currencyInfo.chineseYuan),
                currentValueWidget(7, currencyInfo.czechKoruna),
                currentValueWidget(8, currencyInfo.danishKrone),
                currentValueWidget(9, currencyInfo.euro),
                currentValueWidget(10, currencyInfo.pound),
                currentValueWidget(11, currencyInfo.hongKongDollar),
                currentValueWidget(12, currencyInfo.kuna),
                currentValueWidget(13, currencyInfo.hungarianForint),
                currentValueWidget(14, currencyInfo.indonesianRupiah),
                currentValueWidget(15, currencyInfo.israeliNewShekel),
                currentValueWidget(16, currencyInfo.indianRupee),
                currentValueWidget(17, currencyInfo.krona),
                currentValueWidget(18, currencyInfo.japaneseYen),
                currentValueWidget(19, currencyInfo.koreanWon),
                currentValueWidget(20, currencyInfo.mexicanPeso),
                currentValueWidget(21, currencyInfo.malaysianRinggit),
                currentValueWidget(22, currencyInfo.norwegianKrone),
                currentValueWidget(23, currencyInfo.newZealandDollar),
                currentValueWidget(24, currencyInfo.philippinePeso),
                currentValueWidget(25, currencyInfo.polishZloty),
                currentValueWidget(26, currencyInfo.romanianLeu),
                currentValueWidget(27, currencyInfo.rbu),
                currentValueWidget(28, currencyInfo.swedishKrona),
                currentValueWidget(29, currencyInfo.singaporeDollar),
                currentValueWidget(30, currencyInfo.thaiBaht),
                currentValueWidget(31, currencyInfo.turkishLira),
                currentValueWidget(32, currencyInfo.usd),
                currentValueWidget(33, currencyInfo.southAfricanRand),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoanForm(
                              currencyInfo: currencyInfo,
                            );
                          },
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 12.0,
                          textStyle: const TextStyle(color: Colors.white)),
                      child: const Text('Apply for Loan'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
        ),
      )),
    );
  }

  Widget currentValueWidget(int index, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                countries[index],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "\$ $value",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
