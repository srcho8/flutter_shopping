import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/catalog.dart';

class CartModel extends ChangeNotifier {
  CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  // 아이템 카트 리스트 넣기
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // 가격 합하기
  // reduce, fold
  int get totalPrice =>
      items.fold(0, (prev, next) => prev + next.price);

  // 아이템 추가
  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  // 아이템 제거
  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}