class product {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<ProductItems>? items;

  product({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  product.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <ProductItems>[];
      json['items'].forEach((v) {
        items!.add(new ProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['perPage'] = this.perPage;
    data['totalItems'] = this.totalItems;
    data['totalPages'] = this.totalPages;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductItems {
  String? category;
  String? collectionId;
  String? collectionName;
  String? created;
  String? description;
  int? discountPrice;
  String? id;
  String? name;
  String? popularity;
  int? price;
  int? quantity;
  String? thumbnail;
  String? updated;

  ProductItems({
    this.category,
    this.collectionId,
    this.collectionName,
    this.created,
    this.description,
    this.discountPrice,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
    this.updated,
  });

  ProductItems.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    description = json['description'];
    discountPrice = json['discount_price'];
    id = json['id'];
    name = json['name'];
    popularity = json['popularity'];
    price = json['price'];
    quantity = json['quantity'];
    thumbnail =
        'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}';
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['created'] = this.created;
    data['description'] = this.description;
    data['discount_price'] = this.discountPrice;
    data['id'] = this.id;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['thumbnail'] = this.thumbnail;
    data['updated'] = this.updated;
    return data;
  }
}
