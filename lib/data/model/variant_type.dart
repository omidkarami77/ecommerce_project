class VariantType {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<VariantTypeItems>? items;

  VariantType({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  VariantType.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <VariantTypeItems>[];
      json['items'].forEach((v) {
        items!.add(new VariantTypeItems.fromJson(v));
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

class VariantTypeItems {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;
  String? updated;

  VariantTypeItems({
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.name,
    this.title,
    this.type,
    this.updated,
  });

  VariantTypeItems.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    type = _getVariantTypeEnum(json['type']);
    updated = json['updated'];
  }

  VariantTypeEnum _getVariantTypeEnum(String type) {
    switch (type) {
      case "COLOR":
        return VariantTypeEnum.COLOR;
      case "STORAGE":
        return VariantTypeEnum.STORAGE;
      case "VOLTAGE":
        return VariantTypeEnum.VOLTAGE;

      default:
        return VariantTypeEnum.COLOR;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionId'] = this.collectionId;
    data['collectionName'] = this.collectionName;
    data['created'] = this.created;
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['type'] = this.type;
    data['updated'] = this.updated;
    return data;
  }
}

enum VariantTypeEnum { COLOR, STORAGE, VOLTAGE }
