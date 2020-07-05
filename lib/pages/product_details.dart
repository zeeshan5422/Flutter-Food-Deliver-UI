import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdelivery/appconfig/AppTheme.dart';
import 'package:flutterdelivery/appconfig/app_constants.dart';
import 'package:flutterdelivery/models/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productItem;
  final List<ProductModel> productList;

  ProductDetails({this.productItem, this.productList});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _totalItems = 1;

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(240, 240, 240, 240),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: default_padding * 10,
                left: default_padding * 5,
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              Center(
                child: Hero(
                  tag: "${widget.productItem.imageUrl}_tag",
                  child: Image.asset(
                    widget.productItem.imageUrl,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color.fromARGB(240, 240, 240, 240),
          child: Container(
            padding: EdgeInsets.all(default_padding * 3),
            height: 500,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(default_padding * 7),
                topRight: Radius.circular(default_padding * 7),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 50,
                      child: Text(
                        "${widget.productItem.title}",
                        style: AppTheme.titleTextSimple(context),
                      ),
                    ),
                    _itemCounterButton(context),
                  ],
                ),
                Text(
                  "\$${widget.productItem.price}",
                  style: AppTheme.titleText(context),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${widget.productItem.description}",
                  style: AppTheme.tinyText(context)
                      .copyWith(color: Colors.grey, letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Related Items",
                  style: AppTheme.titleTextSimple(context),
                ),
                _relatedItems(context),
                _addToCartButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _itemCounterButton(BuildContext context) {
    return Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: 30,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_totalItems > 1) {
                                    _totalItems--;
                                  }
                                });
                              },
                              child: Text(
                                "-",
                                textAlign: TextAlign.center,
                                style: AppTheme.titleText(context).copyWith(
                                    fontSize: 25, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 40,
                            height: 25,
                            color: Colors.white,
                            child: Text(
                              "${_totalItems}",
                              textAlign: TextAlign.center,
                              style: AppTheme.titleText(context).copyWith(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 30,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _totalItems++;
                                });
                              },
                              child: Text(
                                "+",
                                textAlign: TextAlign.center,
                                style: AppTheme.titleText(context).copyWith(
                                    fontSize: 25, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
  }

  Center _addToCartButton(BuildContext context) {
    return Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(default_padding * 5)),
                      color: Colors.green),
                  margin: const EdgeInsets.symmetric(
                      horizontal: default_padding * 4),
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: AppTheme.titleText(context)
                          .copyWith(color: Colors.white, letterSpacing: 1.0),
                    ),
                  ),
                ),
              );
  }

  Container _relatedItems(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.productList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(default_padding * 5)),
                color: background_color),
            margin: const EdgeInsets.symmetric(horizontal: default_padding * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  widget.productList[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.productList[index].tinyTitle}",
                      style: AppTheme.tinyText(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "${widget.productList[index].price}",
                      style: AppTheme.tinyText(context)
                          .copyWith(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
