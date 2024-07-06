class ProductModel
{
  late int id;
  late final String name,desc;
  late final num price;

  ProductModel({required this.name, required this.desc, required this.price});

  ProductModel.formJson(Map<String,dynamic> json){
    id = json["id"]??0;
    name = json["name"]??"";
    desc = json["desc"]??"";
    price = json["price"]??0;
  }

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "desc":desc,
      "price":price
    };
  }
}