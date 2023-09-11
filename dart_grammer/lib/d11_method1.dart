void main()
{
  something1('홍길동');

  something2('전우치');
  something2(30);

  // ** Named parameters *** : 매개변수를 이름을 통해 부여할 수 있다.
  //         따라서 순서를 변경할 수 있다. set{}처럼 키값으로 찾아간다.

  // 파라미터를 옵션처리하기
  something3(); // 선택형 매개변수 이기 때문에 이렇게 {}있는 것은 사용해도 되고 안해도됨.
  // 뒤의 파라미터만 이름을 주어 값을 전할 수 있다.
  something3(name: '손오공');

  // 옵션이 있는 것은 아래와 같이 사용하면 됨. 하나만 사용해도 된다.형식은 (key : value)
  // 만 지키면 된다.
  something4(age : 20);
  something4(age : 20, name : "장비"); // 순서를 지키지 않아도 된다.{}이므로

  something5('해리포터');
  something5('멀린', age : 20);

  something6('이순신');
  something6('강감찬', age : 20);

  something7('권율' , age : 30);
}
// 자바와 같이 사용할 수 있다.
void something1(String name){
  print(name);
}
// 파라미터 타입을 생략하면 dynamic 타입이 됨.
// 어떤 타입(숫자,문자)이든 전달 가능
void something2(name){
  print(name);
}
// 파라미터 옵션처리. {}있는 것은 데이터를 사용해도되고, 안해도된다.
// 사용할때는 name : 값을 넣어야 한다.
void something3({String? name}){ // null 체크
  print('name : $name');
}
/*
    메서드 오버로딩 : 오버로딩이란 메서드를 정의할 때 동일한 이름으로 정의하되 매개변수에
    갯수나 타입을 다르게 해서 서로 다른 메서드처럼 정의하는 기법을 말한다.
    예) myFunc(int a) , myFunc(int a, int b) , myFunc(double a, String b)
    위 3가지 메서드는 모두 다르다.
 */

// 여러가지 파라미터를 처리하기 위해 오버로딩할 필요가 없다.{}옵션
void something4({String? name, int? age}){
  print('name : $name age : $age');
}
// 필수 + 옵션. 필수는 반드시 사용해야 한다. {}은 사용해도되고 안해도됨.
// 이렇게 헷갈리기 때문에 나중에는 다 옵션으로 많이 사용함.
void something5(String? name, {int? age}){
  print('name : $name age : $age');
}
// 파라미터의 디폴트값.int age = 10 이기때문에 ? 빠진다.
void something6(String? name, {int age = 10}){
  print('name : $name age : $age');
}
// 반드시 필요한 파라미터라면... 이전방식 @required
void something7(String? name, {required int age}){
  print('name : $name age : $age');
}