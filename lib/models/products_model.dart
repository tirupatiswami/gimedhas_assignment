class AllProducts {
    List<Product>? products;
    int? total;
    int? skip;
    int? limit;

    AllProducts({
         this.products,
         this.total,
         this.skip,
         this.limit,
    });

    factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

   
}

class Product {
    String title;
   
    String price;
    String hp;
    String model;
    String? brand;
    String? power;
    String images;
    String? engineCc;
    String? productPower;
    String? desc;

    Product({
        required this.title,
       
        required this.price,
        required this.hp,
        required this.model,
        this.brand,
        this.power,
        required this.images,
        this.engineCc,
        this.productPower,
        this.desc,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
       
        price: json["price"],
        hp: json["HP"],
        model: json["model"],
        brand: json["brand"],
        power: json["power"],
        images: json["images"],
        engineCc: json["ENGINE CC"],
        productPower: json["power"],
        desc: json['desc'],
    );

   
}



