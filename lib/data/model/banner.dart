class Banner {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<BannerItems>? items;

  Banner({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  Banner.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <BannerItems>[];
      json['items'].forEach((v) {
        items!.add(new BannerItems.fromJson(v));
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

class BannerItems {
  String? categoryId;
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? thumbnail;
  String? updated;

  BannerItems({
    this.categoryId,
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.thumbnail,
    this.updated,
  });

  BannerItems.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    thumbnail =
        'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}';
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['created'] = this.created;
    data['id'] = this.id;
    data['thumbnail'] = this.thumbnail;
    data['updated'] = this.updated;
    return data;
  }
}
