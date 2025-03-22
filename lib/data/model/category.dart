class Categoryy {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<Items>? items;

  Categoryy({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  Categoryy.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
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

class Items {
  String? collectionId;
  String? collectionName;
  String? color;
  String? created;
  String? icon;
  String? id;
  String? thumbnail;
  String? title;
  String? updated;

  Items({
    this.collectionId,
    this.collectionName,
    this.color,
    this.created,
    this.icon,
    this.id,
    this.thumbnail,
    this.title,
    this.updated,
  });

  Items.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    color = json['color'];
    created = json['created'];
    icon = json['icon'];
    id = json['id'];
    thumbnail =
        'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}';
    title = json['title'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['color'] = this.color;
    data['created'] = this.created;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['updated'] = this.updated;
    return data;
  }
}
