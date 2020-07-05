class ProductModel {
  final String title;
  final String tinyTitle;
  final String price;
  final String description;
  final String imageUrl;
  bool isFavorite = false;

  ProductModel({this.title,this.tinyTitle, this.price, this.imageUrl, this.description});
}
