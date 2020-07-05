import 'package:flutterdelivery/models/model_category.dart';
import 'package:flutterdelivery/models/model_sub_categories.dart';
import 'package:flutterdelivery/models/product_model.dart';

class AppData {
  static List<CategoryModel> getListOfCategories() {
    List<CategoryModel> categoriesList = new List();
    categoriesList.add(new CategoryModel(
        name: "Fruits", imageUrl: "assets/images/fruits.jpg"));
    categoriesList.add(new CategoryModel(
        name: "Vegetables", imageUrl: "assets/images/vegs.jpg"));
    categoriesList.add(new CategoryModel(
        name: "Drink", imageUrl: "assets/images/drinks.png"));
    categoriesList.add(new CategoryModel(
        name: "Bakery", imageUrl: "assets/images/bake.png"));
    categoriesList.add(new CategoryModel(
        name: "Fruits", imageUrl: "assets/images/fruits.jpg"));
    categoriesList.add(new CategoryModel(
        name: "Vegetables", imageUrl: "assets/images/vegs.jpg"));
    categoriesList.add(new CategoryModel(
        name: "Drink", imageUrl: "assets/images/drinks.png"));
    categoriesList.add(new CategoryModel(
        name: "Bakery", imageUrl: "assets/images/bake.png"));
    return categoriesList;
  }

  static List<SubCategoriesModel> getProducts() {
    List<SubCategoriesModel> mProductList = new List();

    mProductList.add(new SubCategoriesModel(
        typeName: "Fresh Produce", productList: _getFreshProduceList()));

    mProductList.add(
        new SubCategoriesModel(typeName: "Snacks", productList: _getSnacks()));

    return mProductList;
  }

  static List<ProductModel> _getFreshProduceList() {
    List<ProductModel> mList = new List();

    mList.add(new ProductModel(
        title: "Organic Hass Avocado",
        tinyTitle: "Avocado",
        price: "23.65",
        imageUrl: "assets/images/avacoda.png",
        description:
            "Avocado is a green, pear-shaped fruit often called an “alligator pear.” It is loaded with healthy fats, fiber and various important nutrients."
                "This is coming with 160 calories, 2 grams of protein and 15 grams of healthy fats. Although it contains 9 grams of carbs, 7 of those are fiber, so there are only 2 net carbs, making this a low-carb friendly plant food.Avocados do not contain any cholesterol or sodium and are low in saturated fat. This is why they are favored by some experts who believe these substances are harmful"));

    mList.add(new ProductModel(
        title: "Organic Banana (each)",
        tinyTitle: "Banana",
        price: "15.00",
        imageUrl: "assets/images/banana.png",
        description:
            "Ever wondered what goodness is in a banana? Other than being rich in vitamin B6, bananas are a good source of vitamin C, dietary fibre and manganese. Bananas are also fat-free, cholesterol-free and virtually sodium-free. So what do these mean for your health? "
                "Vitamin B6 from bananas is easily absorbed by your body and a medium-sized banana can provide about a quarter of your daily vitamin B6 needs."
                "You may not associate bananas with vitamin C but a medium-sized banana will provide about 10% of your daily vitamin C needs."));

    mList.add(new ProductModel(
        title: "Peeled Carrots",
        tinyTitle: "Carrots",
        price: "16.00",
        imageUrl: "assets/images/carrot.png",
        description:
            "Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits. They're a weight-loss-friendly food and have been linked to lower cholesterol levels and improved eye health"
                "Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits. They're a weight-loss-friendly food and have been linked to lower cholesterol levels and improved eye health"));

    return mList;
  }

  static List<ProductModel> _getSnacks() {
    List<ProductModel> mList = new List();

    mList.add(new ProductModel(
        title: "Yummy pack - All in one",
        tinyTitle: "Yummy pack",
        price: "45.65",
        imageUrl: "assets/images/snack1.png",
        description:
            "It’s no secret that improved health makes people happier and more productive.In fact, supporting the good health of your company’s employees can be a key factor in attracting, retaining, and nurturing the very best talent for your team. By providing employees with healthy office snacks for their palates and well-being, you can go a long way toward increasing engagement, innovation, and morale at a surprisingly low cost."));

    mList.add(new ProductModel(
        title: "Super PopCorn",
        tinyTitle: "PopCorn",
        price: "23.00",
        imageUrl: "assets/images/snack2.png",
        description:
            "It’s no secret that improved health makes people happier and more productive.In fact, supporting the good health of your company’s employees can be a key factor in attracting, retaining, and nurturing the very best talent for your team. By providing employees with healthy office snacks for their palates and well-being, you can go a long way toward increasing engagement, innovation, and morale at a surprisingly low cost."));

    mList.add(new ProductModel(
        title: "Lays",
        tinyTitle: "Lays",
        price: "11.00",
        imageUrl: "assets/images/snack3.png",
        description:
            "It’s no secret that improved health makes people happier and more productive.In fact, supporting the good health of your company’s employees can be a key factor in attracting, retaining, and nurturing the very best talent for your team. By providing employees with healthy office snacks for their palates and well-being, you can go a long way toward increasing engagement, innovation, and morale at a surprisingly low cost."));

    return mList;
  }
}
