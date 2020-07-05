import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdelivery/appconfig/AppTheme.dart';
import 'package:flutterdelivery/appconfig/app_constants.dart';
import 'package:flutterdelivery/components/generic_card.dart';
import 'package:flutterdelivery/components/list_header.dart';
import 'package:flutterdelivery/models/model_sub_categories.dart';
import 'package:flutterdelivery/pages/product_details.dart';

class SubCategories extends StatefulWidget {
  final List<SubCategoriesModel> mProducts;

  SubCategories({this.mProducts});

  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.mProducts.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              ListHeader(
                heading: widget.mProducts[i].typeName,
                moreOptions: "View More",
                topPadding: i == 0 ? 5.0 : 20.0,
              ),
              Container(
                height: 210,
                padding: EdgeInsets.all(default_padding * 2),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.mProducts[i].productList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                      productItem: widget
                                          .mProducts[i].productList[index],
                                      productList:
                                          widget.mProducts[i].productList,
                                    )));
                      },
                      child: Container(
                        width: 140,
                        margin: EdgeInsets.all(2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GenericCard(
                              child: Stack(
                                children: <Widget>[
                                  Hero(
                                    tag:
                                        "${widget.mProducts[i].productList[index].imageUrl}_tag",
                                    child: Image.asset(
                                      widget.mProducts[i].productList[index]
                                          .imageUrl,
                                      alignment: Alignment.center,
                                      width: 110,
                                      fit: BoxFit.cover,
                                      height: 110,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: InkWell(
                                      child: Icon(
                                        widget.mProducts[i].productList[index]
                                                .isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      onTap: () {
                                        print("tapped");
                                        setState(() {
                                          var isFavorite = widget.mProducts[i]
                                              .productList[index].isFavorite;
                                          widget.mProducts[i].productList[index]
                                              .isFavorite = !isFavorite;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${widget.mProducts[i].productList[index].title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "\$ ${widget.mProducts[i].productList[index].price}",
                              style: AppTheme.subTitleText(context),
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },

        /* children: <Widget>[
          ListHeader(
            heading: mProducts[0].typeName,
            moreOptions: "View More",
            topPadding: 4.0,
          ),
          Container(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mProducts[0].productList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      GenericCard(
                        child: Image.asset(
                          mProducts[0].productList[index].imageUrl,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        "${mProducts[0].productList[index].title}",
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          ListHeader(
            heading: mProducts[1].typeName,
            moreOptions: "View More",
            topPadding: 4.0,
          ),
          Container(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mProducts[1].productList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      GenericCard(
                        child: Image.asset(
                          mProducts[1].productList[index].imageUrl,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        "${mProducts[1].productList[index].title}",
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],*/
      ),
    );
  }
}
