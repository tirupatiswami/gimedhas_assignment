// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gimedhas_assignment/homescreen/loan_form.dart';
import 'package:gimedhas_assignment/homescreen/tractor_details.dart';
import 'package:gimedhas_assignment/models/currency_model.dart';
import 'package:gimedhas_assignment/models/products_json.dart';
import 'package:gimedhas_assignment/models/products_model.dart';

class TractorInfo extends StatefulWidget {
  TractorInfo({this.currencyInfo, super.key});
  CurrencyInfo? currencyInfo;

  @override
  State<TractorInfo> createState() => _TractorInfoState();
}

class _TractorInfoState extends State<TractorInfo> {
  AllProducts allProducts = AllProducts();
  String selectedTractor = '';

  @override
  void initState() {
    allProducts = AllProducts.fromJson(jsonDecode(productsDetails));
    printInfo(info: allProducts.limit.toString());
    printInfo(info: "${allProducts.total}total");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(title: Text("Tractors Information")),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: allProducts.products!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RadioListTile(
                  value: allProducts.products![index].title,
                  groupValue: selectedTractor,
                  onChanged: (value) {
                    setState(() {
                      selectedTractor = value!;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoanForm(
                            allProducts: allProducts,
                            index: index,
                            currencyInfo: widget.currencyInfo,
                          );
                        },
                      ));
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TractorDetails(
                            allProducts: allProducts,
                            index: index,
                            currencyInfo: widget.currencyInfo,
                          );
                        },
                      ));
                    },
                    child: Row(
                      children: [
                        Image.network(
                          allProducts.products![index].images,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allProducts.products![index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  allProducts.products![index].model,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text((allProducts.products![index].price),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
