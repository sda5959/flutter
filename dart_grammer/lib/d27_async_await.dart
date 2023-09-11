import 'dart:io';

// async, await는 pair : await는 async내부에서만 사용 가능하다.
Future<void> myRequest1() async{ // 미래에 <int> 반환한다.
    print("myRequest1() 작업 시작");
    // 1초씩 딜레이 시켜준다.(10초가 소요되는 매우 긴~ 작업)
    for (int i = 0; i <10; i++) {
      stdout.write('$i ');
      // await은 함수에만 사용 가능. 1초 쉬라는 것
      await Future.delayed(Duration(seconds: 1));
    }
    print('\nmyRequest1() 작업끝');
}
// Future<int>객체를 반환하는 메서드
Future<int> myRequest2(num) {

  // 결과가 미래에 생김. 기다리지 않음.
  var req = Future((){
    print('myRequest2(num) 작업시작');
    int rNum = 0;
    for (int i = 0; i <num; i++) {
      rNum += 1;
    }
    print('myRequest2(num) 작업끝');
    return rNum; // 이 결과는 나중에 생김.
});
  // 위의 결과가 생성되기 전에 리턴하는 것이므로 잘못된 사용법. 시간차 공격
  return req;
}

// 바로 위 메서드와 동일한 형태로 정의
Future<int> myRequest3(num) {

  return Future((){
    print('myRequest3(num) 작업시작');
    int rNum = 0;
    for (int i = 0; i <num; i++) {
      rNum += 1;
    }
    print('myRequest3(num) 작업끝');
    return rNum;
  });
}
void main() async{ // async를 제거하면 아래에서 에러발생
  // 비동기를 위한 async와 await는 반드시 같이 사용되어야 한다.
  print('main 시작 01');
  myRequest1();
  print('main 끝 01');

  print('main 시작 02');
  /*
    Future와 then절을 함께 사용하거나 (방법1)
    async와 await을 함께 사용해야한다(방법2)
   */
  var val2 = await myRequest2(10); // await가 있어서 위에 async가 있음.
  var val3 = myRequest3(20);
  val3.then((value){
    print('then절에서 출력:$value');
  }, onError: (error){
    print(error);
  });

  print('val2 : $val2');
  print('val3 : $val3');
  print('main 끝 02');
}

