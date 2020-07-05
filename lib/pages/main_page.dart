import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdelivery/appconfig/AppTheme.dart';
import 'package:flutterdelivery/appconfig/app_constants.dart';
import 'package:flutterdelivery/components/generic_card.dart';
import 'package:flutterdelivery/components/list_header.dart';
import 'package:flutterdelivery/data/AppData.dart';
import 'package:flutterdelivery/models/model_category.dart';
import 'package:flutterdelivery/pages/sub_categories.dart';
import 'package:flutterdelivery/utils/app_utils.dart';

class MainPage extends StatelessWidget {
  List<CategoryModel> _listOfCategories = AppData.getListOfCategories();

  @override
  Widget build(BuildContext context) {
//    AppUtils.changeStatusBarColor(Colors.green);

    return Container(
      color: background_color,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            width: double.infinity,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(default_padding * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Colors.white60,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white60,
                  )
                ],
              ),
            ),
          ),
          ListHeader(
            heading: "All Categories",
            moreOptions: "View Items",
            topPadding: default_padding * 4,
          ),
          _categoriesItems(context),
          _offers(context),
          SubCategories(mProducts: AppData.getProducts()),
        ],
      ),
    );
  }

  Container _categoriesItems(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listOfCategories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: default_padding * 4),
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                GenericCard(
                  child: Image.asset(
                    _listOfCategories[index].imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "${_listOfCategories[index].name}",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(default_padding * 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("All Categories", style: AppTheme.titleTextSimple(context)),
            Text(
              "View Items",
              style: AppTheme.tinyText(context).copyWith(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _offers(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(left: left_padding, top: default_padding),
        child: Text(
          "Offers",
          style: AppTheme.subTitleText(context),
        ),
      ),
    );
  }
}
