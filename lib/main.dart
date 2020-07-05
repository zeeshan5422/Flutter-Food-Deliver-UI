import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdelivery/appconfig/AppTheme.dart';
import 'package:flutterdelivery/pages/main_page.dart';
import 'package:flutterdelivery/pages/product_details.dart';
import 'package:flutterdelivery/utils/app_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    AppUtils.changeStatusBarColor(Colors.green);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.green
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.current(),
      home: Scaffold(
        body: MainPage(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _getNavBarItems,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
//      initialRoute: "",
//      routes: {
//        '/product_details': (context) => ProductDetails(),
//      },
    );
  }

  List<BottomNavigationBarItem> _getNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(''),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_travel),
      title: Text(''),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      title: Text(''),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.insert_emoticon),
      title: Text(''),
    ),
  ];

  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Flutter Delivery",
          ),
          centerTitle: true,
          elevation: 0,
          leading: Icon(Icons.drag_handle),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // show snack bar
              },
            )
          ],
        ),
      ),
    );
  }
}
