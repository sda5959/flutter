void main(){

  // *** Nullable $ Non-Nullable ***
  int num1 = 5; // null값을 허용하지 않는 변수로 선언.
  int? num2 = 2; // null값을 허용하는 변수. 값이 없으면 null이입력됨.

  // num1 = null; // 에러발생 :Non-Nullable
  num2 = null; // ok: Nullable

  // String str1 = null; // error : Non-Nullable
  String? str2 = null; // ok : Nullable

  print("1================================================");

  // *** Null Safety 규칙 *** null일때 안전하게 사용하기 위해

  // Non-Nullable 변수는 값 대입 없이 사용할때 error
  // int a1; print(a1); // 에러발생
  int? a2; print(a2);

  // a2 변수는 Nullable. 선언과 동시에 초기값이 null이 대입되어 초기화된다.
  // a1은 Non-Nullable.null로 자동 초기화 할 수 없다.

  // var타입에서의 Null Safety
  // int 타입으로 유추. Non-Nullable 변수이므로 Null 대입 불가능
  var a3 = 10;
  var a4 = null; // dynamic으로 유추
  var a5; // dynamic으로 유추
  // var? a6 = null;

  // var로 타입 선언시 Nullable과 Non-Nullable로 자동 유추 된다.
  // var 타입 뒤에는 ?를 추가할 수 없다.

  print("2====================================================");

  // ** Null Safety Operator ***

   int num3 = 5;
   int? num4;

   // ! : null check operator - runtime error throw
  // 변수뒤에 !을 추가하면 이 변수 값이 null 인경우 runtime error 발생

  num4 = 10;
  num3 = num4;
  num3 = num4!;
  print(num4);

  // ?.?[ ] ?.. - null aware operator
  // string name; // <- 값이 대입되지 않고 사용되면 null일 수 있다.
  String? name;

  // Null이 아닐 떄 메서드 실행
  // ?를 제거하면 에러발생됨. 객체가 null인 상태에서는 멤버메서드를 호출
  // 할 수 없기 때문이다.
  name = name?.toLowerCase();

  // Null 일때
  // n42는 정수가 아니므로 정수 변환시 에러발생됨. 따라서 val2는 -1로
  // 초기화 된다.
  int val2 = int.tryParse('n42') ?? -1;
  print('val2 = $val2');

  String? name1;

    // String text = name1;
    // 에러가 발생했을때 해결 방법
    String text = name1!; // 변수뒤에 !사용. 플러터에서 !가붙은 변수는
    //사용되는 시점에서 null값이 아니다라고 인식해서 에러가 발생하지 않는다.
    // String? text = name1;
}