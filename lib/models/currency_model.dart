class CurrencyInfo {
  double? australianDolor;
  double? brazilianReal;
  double? bulgarianCurrency;
  double? canadianDollar;
  double? swissCurrency;
  double? chineseYuan;
  double? czechKoruna;
  double? danishKrone;
  double? euro;
  double? pound;
  double? hongKongDollar;
  double? kuna;
  double? hungarianForint;
  double? indonesianRupiah;
  double? israeliNewShekel;
  double? indianRupee;
  double? krona;
  double? japaneseYen;
  double? koreanWon;
  double? mexicanPeso;
  double? malaysianRinggit;
  double? norwegianKrone;
  double? newZealandDollar;
  double? philippinePeso;
  double? polishZloty;
  double? romanianLeu;
  double? rbu;
  double? swedishKrona;
  double? singaporeDollar;
  double? thaiBaht;
  double? turkishLira;
  int? usd;
  double? southAfricanRand;

  CurrencyInfo(
      {this.australianDolor,
      this.brazilianReal,
      this.bulgarianCurrency,
      this.canadianDollar,
      this.chineseYuan,
      this.czechKoruna,
      this.danishKrone,
      this.euro,
      this.hongKongDollar,
      this.hungarianForint,
      this.indianRupee,
      this.indonesianRupiah,
      this.israeliNewShekel,
      this.japaneseYen,
      this.koreanWon,
      this.krona,
      this.kuna,
      this.malaysianRinggit,
      this.mexicanPeso,
      this.newZealandDollar,
      this.norwegianKrone,
      this.philippinePeso,
      this.polishZloty,
      this.pound,
      this.rbu,
      this.romanianLeu,
      this.singaporeDollar,
      this.southAfricanRand,
      this.swedishKrona,
      this.swissCurrency,
      this.thaiBaht,
      this.turkishLira,
      this.usd});

  factory CurrencyInfo.fromJson(Map<String, dynamic> json) {
    return CurrencyInfo(
      australianDolor: json['AUD'],
      brazilianReal: json['BRL'],
      bulgarianCurrency: json['BGN'],
      canadianDollar: json['CAD'],
      swissCurrency: json['CHF'],
      chineseYuan: json['CNY'],
      czechKoruna: json['CZK'],
      danishKrone: json['DKK'],
      euro: json['EUR'],
      pound: json['GBP'],
      hongKongDollar: json['HKD'],
      kuna: json['HRK'],
      hungarianForint: json['HUF'],
      indonesianRupiah: json['IDR'],
      israeliNewShekel: json['ILS'],
      indianRupee: json['INR'],
      krona: json['ISK'],
      japaneseYen: json['JPY'],
      koreanWon: json['KRW'],
      mexicanPeso: json['MXN'],
      malaysianRinggit: json['MYR'],
      norwegianKrone: json['NOK'],
      newZealandDollar: json['NZD'],
      philippinePeso: json['PHP'],
      polishZloty: json['PLN'],
      romanianLeu: json['RON'],
      rbu: json['RUB'],
      swedishKrona: json['SEK'],
      singaporeDollar: json['SGD'],
      thaiBaht: json['THB'],
      turkishLira: json['TRY'],
      usd: json['USD'],
      southAfricanRand: json['ZAR'],
    );
  }
}
