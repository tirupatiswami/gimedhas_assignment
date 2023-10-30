class CarsInfo {
    int count;
    String message;
    dynamic searchCriteria;
    List<Result> results;

    CarsInfo({
        required this.count,
        required this.message,
        required this.searchCriteria,
        required this.results,
    });

    factory CarsInfo.fromJson(Map<String, dynamic> json) => CarsInfo(
        count: json["Count"],
        message: json["Message"],
        searchCriteria: json["SearchCriteria"],
        results: List<Result>.from(json["Results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Count": count,
        "Message": message,
        "SearchCriteria": searchCriteria,
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String country;
    String? mfrCommonName;
    int mfrId;
    String mfrName;

    Result({
        required this.country,
        required this.mfrCommonName,
        required this.mfrId,
        required this.mfrName,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        country: json["Country"],
        mfrCommonName: json["Mfr_CommonName"],
        mfrId: json["Mfr_ID"],
        mfrName: json["Mfr_Name"],
    );

    Map<String, dynamic> toJson() => {
        "Country": country,
        "Mfr_CommonName": mfrCommonName,
        "Mfr_ID": mfrId,
        "Mfr_Name": mfrName,
    };
}