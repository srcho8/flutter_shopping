import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/cart.dart';
import 'package:flutter_shopping/model/catalog.dart';
import 'package:flutter_shopping/ui/catalog_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        // 시간이 지남에 따라 변하는 변수를 객체에 전달하려면 proxyProvider
        // ChangeNotifier 가 두개라면 이렇게 묶어서 써야하는구나...
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        home: Catalog_Page(),
      ),
    );
  }
}
