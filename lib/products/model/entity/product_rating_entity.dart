class ProductRatingEntity {
  int? average;
  int? total;

  ProductRatingEntity.fromJson(Map<String, dynamic> map) {
    average = map["average"];
    total = map["total"];
  }
}
