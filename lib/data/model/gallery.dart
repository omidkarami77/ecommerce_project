class ProductImage {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<ProductImageItems>? items;

  ProductImage({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  ProductImage.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <ProductImageItems>[];
      json['items'].forEach((v) {
        items!.add(new ProductImageItems.fromJson(v));
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

class ProductImageItems {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? image;
  String? productId;
  String? updated;

  ProductImageItems({
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.image,
    this.productId,
    this.updated,
  });

  ProductImageItems.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    image =
        'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['image']}';
    productId = json['product_id'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['created'] = this.created;
    data['id'] = this.id;
    data['image'] = this.image;
    data['product_id'] = this.productId;
    data['updated'] = this.updated;
    return data;
  }
}
