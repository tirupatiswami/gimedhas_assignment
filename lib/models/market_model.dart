class MarketDetails {
  String? endpoint;
  List<Market>? markets;

  MarketDetails({
    this.endpoint,
    this.markets,
  });

  factory MarketDetails.fromJson(Map<String, dynamic> json) => MarketDetails(
        endpoint: json["endpoint"],
        markets:
            List<Market>.from(json["markets"].map((x) => Market.fromJson(x))),
      );
}

class Market {
  String? marketType;
  String? region;
  String? primaryExchanges;
  String? localOpen;
  String? localClose;
  String? currentStatus;
  String? notes;

  Market({
    this.marketType,
    this.region,
    this.primaryExchanges,
    this.localOpen,
    this.localClose,
    this.currentStatus,
    this.notes,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        marketType: json['market_type'],
        region: json["region"],
        primaryExchanges: json["primary_exchanges"],
        localOpen: json["local_open"],
        localClose: json["local_close"],
        currentStatus: json["current_status"],
        notes: json["notes"],
      );
}