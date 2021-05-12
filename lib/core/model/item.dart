class ItemModel {
  ItemModel(
      {this.name, this.id, this.body, this.image, this.price, this.soldBy});

  String name;
  int id;
  String body;
  String image;
  String soldBy;
  String price;

  ItemModel.fromJson(dynamic json) {
    id = json['id'] as int;
    name = json['name'] as String;
    body = json['body'] as String;
    image = json['image'] as String;
    soldBy = json['soldBy'] as String;
    price = json['price'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['body'] = body;
    data['image'] = image;
    data['soldBy'] = soldBy;
    data['price'] = price;
    return data;
  }
}

List<ItemModel> allItems = <ItemModel>[
  ItemModel(
      id: 1,
      name: 'Paracetamol',
      soldBy: 'Emzor Pharmaceuticals',
      price: '300',
      body: 'Suspension 100mg',
      image: 'images/para1.png'),
  ItemModel(
      id: 2,
      name: 'Maldox',
      soldBy: 'Emzor Pharmaceuticals',
      price: '3000',
      body: 'Maldox Tablet 300mg',
      image: 'images/maldox1.png'),
  ItemModel(
      id: 3,
      name: 'Flagyne',
      soldBy: 'Emzor Pharmaceuticals',
      price: '290',
      body: 'Falgine Tablet 300mg',
      image: 'images/Emzoclav.png'),
  ItemModel(
      id: 4,
      name: 'Azithromycin QS',
      soldBy: 'Emzor Pharmaceuticals',
      body: 'Tablet *6',
      price: '900',
      image: 'images/Azithromycin.png'),
  ItemModel(
    id: 5,
    name: 'Emzifix',
    body: 'Cefixime Oral Suspension 100mg',
    image: 'images/emzifix1.png',
    price: '800',
    soldBy: 'Emzor Pharmaceuticals',
  ),
  ItemModel(
      id: 6,
      name: 'Lokmal QS_Combi',
      soldBy: 'Emzor Pharmaceuticals',
      body: 'Suspension',
      price: '1000',
      image: 'images/lokmal1.png'),
  ItemModel(
    id: 7,
    name: 'ClotriVag',
    body: 'Clotrimazole Vaginal 200 B.P',
    image: 'images/Clotrivag.png',
    price: '1300',
    soldBy: 'Emzor Pharmaceuticals',
  ),
  ItemModel(
    id: 8,
    name: 'Kezitil',
    body: 'Cefuroxime Axetil Tablets USP 500mg',
    image: 'images/Kezitil.png',
    price: '1200',
    soldBy: 'Emzor Pharmaceuticals',
  ),
  ItemModel(
    id: 9,
    name: 'Zoglobin Syrup',
    body: 'Zoglobin Syrup USP 500 B.P',
    image: 'images/ZOGLOBIN.png',
    price: '1600',
    soldBy: 'Emzor Pharmaceuticals',
  ),
  ItemModel(
    id: 10,
    name: 'Emprofen E ',
    body: '400mg Soft Gel 1*10',
    image: 'images/Emzoclav.png',
    price: '3000',
    soldBy: 'Emzor Pharmaceuticals',
  ),
];
