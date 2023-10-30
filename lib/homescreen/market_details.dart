import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:gimedhas_assignment/homescreen/market_info.dart';
import 'package:gimedhas_assignment/models/market_model.dart';
import 'package:http/http.dart' as http;


class MarketList extends StatefulWidget {
  const MarketList({super.key});

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  MarketDetails marketDetails = MarketDetails();
  List<List<Market>> totalMarkets = [];
  List<Market> equityList = <Market>[];
  List<Market> cryptocurrencyList = <Market>[];
  List<Market> forexList = <Market>[];
  Future<void> currencyApi() async {
    final response = await http.get(
      Uri.parse(
          'https://www.alphavantage.co/query?function=MARKET_STATUS&apikey=demo'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      printInfo(info: data.toString());
      setState(() {
        marketDetails = MarketDetails.fromJson(data);

        for (var d in marketDetails.markets!) {
          if (d.marketType == "Equity") {
            equityList.add(d);
          } else if (d.marketType == "Cryptocurrency") {
            cryptocurrencyList.add(d);
          } else {
            forexList.add(d);
          }
        }
        totalMarkets.addAll([equityList, cryptocurrencyList, forexList]);
      });
    } else {
      printInfo(info: response.body.toString());
    }
  }

  @override
  void initState() {
    currencyApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Details',
            style: TextStyle(fontSize: 15, color: Colors.black87)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: totalMarkets.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MarketInfo(typeList: totalMarkets[index]);
                        },
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: "Market Type:",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black45,
                                )),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 10,
                            )),
                            TextSpan(
                                text: totalMarkets[index][0].marketType,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400))
                          ])),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}