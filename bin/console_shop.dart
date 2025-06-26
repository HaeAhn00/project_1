import 'dart:io'; //입출력 라이브러리
import 'package:project_1/shoppingMall.dart'; // shoppingMall 라이브러리

void main(List<String> arguments) {
  // 프로그램 시작점, arguments는 실행 시 전달받는 인자
  var mall = ShoppingMall([
    // 쇼핑몰 객체 생성, Product 리스트를 초기 상품 목록으로 전달
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ]);

  bool running = true; // 논리형 타입 running, true일 때 계속 실행
  while (running) {
    // running이 true인 동안 무한 루프 실행
    print('\n==== 메뉴 ====👇');
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / '
        '[3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화');

    stdout.write('번호 입력: '); // 사용자 입력 요청
    String? input = stdin.readLineSync(); // 사용자로부터 한 줄 입력을 받음

    switch (input) {
      // 그냥 뭐.. 스위치문
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
