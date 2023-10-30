import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/utils.dart';
import 'package:gimedhas_assignment/homescreen/currency_value.dart';
import 'package:gimedhas_assignment/homescreen/loan_details.dart';
import 'package:gimedhas_assignment/homescreen/market_details.dart';
import 'package:gimedhas_assignment/language.dart';
import 'package:gimedhas_assignment/local_storage.dart';

String name = '';
getName() async {
  await SecureStorage.readData('name').then((value) {
    if (value != null) {
      name = value;
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getName();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    print(name);
    localization.init(mapLocales: const [
      MapLocale("en", AppLocale.EN),
      MapLocale("te", AppLocale.TE),
    ], initLanguageCode: "en");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MarketList(),
      //  name != '' ? const LoanDetails() : CurrencyValue(),
    );
  }
}
