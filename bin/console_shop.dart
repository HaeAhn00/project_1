import 'dart:io';
import 'package:project_1/shoppingMall.dart';

void main(List<String> arguments) {
  var mall = ShoppingMall([
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ]);

  bool running = true;
  while (running) {
    print('\n==== 메뉴 ====👇');
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / '
        '[3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화');
    // print(
    // "----------------------------------------------------------------------------------------------------------------------------");

    stdout.write('번호 입력: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        stdout.write('정말 종료하시겠습니까? 종료하려면 [5]를 입력하세요: ');
        String? confirm = stdin.readLineSync();
        if (confirm == '5') {
          print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
          running = false;
        } else {
          print('종료하지 않습니다.');
        }
        break;
      case '6':
        mall.resetCart();
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
        break;
    }
  }
}
