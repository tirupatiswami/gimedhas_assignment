import 'package:flutter/material.dart';
import 'package:gimedhas_assignment/models/market_model.dart';


class MarketInfo extends StatefulWidget {
  MarketInfo({required this.typeList, super.key});
  List<Market> typeList;

  @override
  State<MarketInfo> createState() => _MarketInfoState();
}

class _MarketInfoState extends State<MarketInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        title: Text(widget.typeList[0].marketType!,
            style: const TextStyle(fontSize: 15, color: Colors.black87)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: widget.typeList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          marketDetailsWidget(
                              "Region:", widget.typeList[index].region!),
                          const SizedBox(
                            height: 10,
                          ),
                          marketDetailsWidget("primary Exchange:",
                              widget.typeList[index].primaryExchanges!),
                          const SizedBox(
                            height: 10,
                          ),
                          marketDetailsWidget(
                              "Local open:", widget.typeList[index].localOpen!),
                          const SizedBox(
                            height: 10,
                          ),
                          marketDetailsWidget("Local close:",
                              widget.typeList[index].localClose!),
                          const SizedBox(
                            height: 10,
                          ),
                          marketDetailsWidget("Current status:",
                              widget.typeList[index].currentStatus!),
                        ],
                      ));
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

  Widget marketDetailsWidget(String hint, String title) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: hint,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black45,
          )),
      const WidgetSpan(
          child: SizedBox(
        width: 10,
      )),
      TextSpan(
          text: title,
          style: const TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w400))
    ]));
  }
}