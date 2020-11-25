import 'dart:math';

import 'package:flutter/material.dart';

class CatalogModel {
  final List<Item> _items = [
    Item(0, '갤럭시 s20', 77),
    Item(1, '아이폰11', 90),
    Item(2, '아이폰11 pro', 80),
    Item(3, '아이폰12', 92),
    Item(4, '아이폰12 mini', 78),
    Item(5, '아이폰12 pro max', 91),
    Item(6, '갤럭시 s10', 40),
    Item(7, '갤럭시 s20', 77),
    Item(8, '아이폰11', 90),
    Item(9, '아이폰11 pro', 60),
    Item(10, '아이폰12', 92),
    Item(11, '아이폰12 mini', 78),
    Item(12, '아이폰12 pro max', 91),
    Item(13, '갤럭시 s10', 40),
  ];

  Item getById(int id) => Item(id, _items[id].name, _items[id].price);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price;

  Item(this.id, this.name, this.price)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
