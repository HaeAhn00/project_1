import 'dart:io';
import 'dart:convert'; // utf8 인코딩 처리를 위한 라이브러리 (중요)

/// 상품 정보를 나타내는 클래스
class Product {
  final String name;
  final int price;

  Product(this.name, this.price);
}

/// 쇼핑몰 클래스 - 상품 목록과 장바구니 기능을 포함
class ShoppingMall {
  final List<Product> products;
  final Map<String, int> cart = {};

  ShoppingMall(this.products);

  /// [1] 상품 목록 출력
  void showProducts() {
    for (var p in products) {
      print('${p.name} / ${p.price}원');
    }
  }

  /// [2] 장바구니에 상품 추가
  void addToCart() {
    stdout.write('상품 이름을 입력해 주세요: ');
    String? name =
        stdin.readLineSync(encoding: utf8)?.trim(); // UTF-8로 입력받고 공백 제거
    // 입력한 상품명이 존재하는지 확인
    var product = products.firstWhere(
      (p) => p.name == name,
      orElse: () => Product('', 0),
    );

    if (product.name.isEmpty) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    stdout.write('상품 개수를 입력해 주세요: ');
    String? countStr = stdin.readLineSync();

    try {
      // 입력 문자열을 정수로 변환
      int count = int.parse(countStr ?? '');
      if (count <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
        return;
      }
      cart[product.name] = (cart[product.name] ?? 0) + count;
      print('장바구니에 상품이 담겼어요 !');
    } catch (e) {
      print('입력값이 올바르지 않아요 !'); // 예외 처리
      return;
    }
  }

  /// [3] 장바구니 총 금액 출력
  void showTotal() {
    if (cart.isEmpty) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }
    int total = 0; // 총 가격
    List<String> names = []; // 담긴 상품 이름 리스트

    for (var entry in cart.entries) {
      final productName = entry.key; // 상품 이름
      final quantity = entry.value; // 수량

      for (var product in products) {
        if (product.name == productName) {
          total += product.price * quantity; // 가격 × 수량 더하기
          names.add(productName); // 이름 리스트에 추가
        }
      }
    }
    print('장바구니에 ${names.join(', ')}이(가) 담겨있네요. 총 ${total}원 입니다!');
  }

  /// [6] 장바구니 초기화
  void resetCart() {
    if (cart.isEmpty) {
      print('이미 장바구니가 비어있습니다.');
    } else {
      cart.clear();
      print('장바구니를 초기화합니다.');
    }
  }
}
