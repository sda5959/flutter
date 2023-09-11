void main()
{
  
  var map1 = {
    'key1' : "홍길동",
    'key2' : 2,
    'key3' : true
  }; // 중복허용 하지않음 중괄호 사용.
  print(map1);

  /*
      Map컬렉션 생성시 key는 문자열로 , value는 정수값을 사용하겠다는 선언.
      Map은 이와같이 key와 value의 쌍으로 이루어진다.
   */
  
  Map<String, int> map2 = Map(); // new생략
  map2['홍길동'] = 20;
  map2['전우치'] = 25;
  map2['손오공'] = 30;
  print(map2);
  
  map2['멀린'] = 35; // 추가(기존의 key가 없기 때문
  map2['홍길동']= 21; // 수정(동일한 key는 존재할 수 없으므로 수정됨.)
  print(map2);
  
  map2.remove('홍길동'); // 데이터 삭제
  print(map2);

  // ** 값 빠르게 찾아오는 것이 목적 **
  int? val1 = map2['홍길동']; // 찾는 값이 없으면 null 반환
  print(val1);

  // Dart의 삼항연산자로 앞의 값이 null 이면 뒤의 값이 할당된다.
  // 이래서 앞에 ? 이 없음
  int val2 = map2['홍길동'] ??-1;
  print(val2);

  // var연산자의 경우 입력된 데이터에 따라 타입이 결정된다.
  // 단 타입이 결정된 이후에는 다른 타입으로 변경할 수 없다.
  var val3 = map2['홍길동']; // null이므로 타입이 정해지지 않는다.
  print(val3); // null 출력
  val3 = 1; // null이 입력되면 아직 타입이 정해진게 아니다. 입력가능
  print(val3);

  // 해당 map이 해당 key값을 가지고 있는지 점검
  var bCheck = map2.containsKey('멀린');
  if (bCheck) {
    print("멀린은 존재하는 값입니다.");
  }
  print("=============================");
  for(var key in map2.keys){
    print('$key : ${map2[key]}');
  }
  print("=============================");
  for(var e in map2.entries){
    print("${e.key} : ${e.value}");
  }
  print("=============================");

  var map3 = {
    ...map1,
    'key4' :'전우치'
  };
  print(map3);
}