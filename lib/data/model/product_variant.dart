import 'package:ecommerce_project/data/model/variant.dart';
import 'package:ecommerce_project/data/model/variant_type.dart';

class ProductVariant {
  VariantTypeItems variantTypeItems;
  List<Variant> variants;

  ProductVariant(this.variantTypeItems, this.variants);
}
