// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:gimedhas_assignment/language.dart';
import 'package:gimedhas_assignment/models/currency_model.dart';
import 'package:gimedhas_assignment/models/products_model.dart';

class TractorDetails extends StatefulWidget {
  TractorDetails(
      {this.allProducts, this.currencyInfo, this.index, this.type, super.key});
  CurrencyInfo? currencyInfo;
  AllProducts? allProducts;
  int? index;
  String? type;
  @override
  State<TractorDetails> createState() => _TractorDetailsState();
}

class _TractorDetailsState extends State<TractorDetails> {
  FlutterLocalization localization = FlutterLocalization.instance;
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.network(
                widget.allProducts!.products![widget.index!].images,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(widget.allProducts!.products![widget.index!].title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Divider(
                color: Colors.amber,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3)
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Info",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          DropdownButton(
                            value: selectedLanguage,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: [
                              'English',
                              'Telugu',
                            ].map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLanguage = newValue!;
                                selectedLanguage == "English"
                                    ? localization.translate("en")
                                    : localization.translate("te");
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocale.brand.getString(context),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45)),
                                  SizedBox(height: 15),
                                  Text(
                                      widget.allProducts!
                                          .products![widget.index!].brand!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              )),
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocale.model.getString(context),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45)),
                                  SizedBox(height: 15),
                                  Text(
                                      widget.allProducts!
                                          .products![widget.index!].model,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocale.enginecc.getString(context),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45)),
                                  SizedBox(height: 15),
                                  Text(
                                      widget.allProducts!
                                          .products![widget.index!].engineCc!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              )),
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocale.power.getString(context),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45)),
                                  SizedBox(height: 15),
                                  Text(
                                      widget.allProducts!
                                          .products![widget.index!].power!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocale.hp.getString(context),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45)),
                                  SizedBox(height: 15),
                                  Text(
                                      widget.allProducts!
                                          .products![widget.index!].hp,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              )),
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocale.price.getString(context),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black45)),
                                  SizedBox(height: 15),
                                  Text(
                                      widget.allProducts!
                                          .products![widget.index!].price
                                          .split('L')
                                          .first,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${AppLocale.price.getString(context)} in INR",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45)),
                          SizedBox(height: 15),
                          Text(
                              "₹ ${double.parse(widget.allProducts!.products![widget.index!].price.split("\$").last.replaceAll(",", "")) * widget.currencyInfo!.indianRupee!.roundToDouble()}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
