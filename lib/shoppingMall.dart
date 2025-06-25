import 'dart:io';
import 'dart:convert';

class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  final List<Product> products;
  // final List<Product> cart = List.empty();
  final Map<String, int> cart = {};

  ShoppingMall(this.products);

  void showProducts() {
    for (var p in products) {
      print('${p.name} / ${p.price}원');
    }
  }

  void addToCart() {
    stdout.write('상품 이름을 입력해 주세요 !\n');
    String? name = stdin.readLineSync(encoding: utf8)?.trim();
    var product = products.firstWhere(
      (p) => p.name == name,
      orElse: () => Product('', 0),
    );

    if (product.name.isEmpty) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    stdout.write('상품 개수를 입력해 주세요 !\n');
    String? countStr = stdin.readLineSync();
    try {
      int count = int.parse(countStr ?? '');
      if (count <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
        return;
      }
      cart[product.name] = (cart[product.name] ?? 0) + count;
      print('장바구니에 상품이 담겼어요 !');
    } catch (e) {
      print('입력값이 올바르지 않아요 !');
      return;
    }
  }

  void showTotal() {
    if (cart.isEmpty) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }
    int total = 0;
    List<String> names = [];
    for (var entry in cart.entries) {
      final productName = entry.key;
      final quantity = entry.value;
      for (var product in products) {
        if (product.name == productName) {
          total += product.price * quantity;
          names.add(productName);
        }
      }
    }
    print('장바구니에 ${names.join(', ')}이(가) 담겨있네요. 총 ${total}원 입니다!');
  }

  void resetCart() {
    if (cart.isEmpty) {
      print('이미 장바구니가 비어있습니다.');
    } else {
      cart.clear();
      print('장바구니를 초기화합니다.');
    }
  }
}
