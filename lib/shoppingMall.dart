import 'dart:io';

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

  // void addToCart(int index) {
  //   if (index > products.length || index < 0) {
  //     print('잘못된 인덱스 임다');
  //   } else {
  //     cart.add(products[index]);
  //   }
  // }
  void addToCart() {
    stdout.write('상품 이름을 입력해 주세요 !\n');
    // print('상품 이름을 입력해 주세요 !');
    String? name = stdin.readLineSync()?.trim();
    var product = products.firstWhere(
      (p) => p.name == name,
      orElse: () => Product('', 0),
    );

    if (product.name.isEmpty) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    stdout.write('상품 개수를 입력해 주세요 !\n');
    // print('상품 개수를 입력해 주세요 !');
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
    print('장바구니에 ${names.join(', ')} 담겨있네요. 총 ${total}원 입니다!');
  }
}
