class Marine{
  // 앞에서 했던방식. 이것을 간단하게 사용한 것이 아래방법
  // late int health;
  // late int attack;
  // Marine(int health, int attack)
  // {
  //   this.health = health;
  //   this.attack = attack;
  // }

  final int health;
  final int attack;

  // 상수 생성자 : with final 변수
  // 자바로 보면 static 선언한것과 비슷
  const Marine(this.health, this.attack);
/*
    하나의 객체로 여러번 사용하고 싶다면 const 생성자를 이용하여
    객체를 생성해야 한다. 플러터의 모든개체에 다양하게 사용되고 있다.
 */
}
void main(){
  Marine unit1 = Marine(10, 1);
  Marine unit2 = Marine(10, 1); // 새로 만들어진 것임. 변수명이 다름
  Marine unit3 = const Marine(10, 1);
  Marine unit4 = const Marine(10, 1); // const = 같은것을 사용. 메모리 절약
  Marine unit5 = new Marine(10, 1);
  Marine unit6 = new Marine(10, 1);
  /*
      identical(객체1, 객체2)
        : 인자로 주어진 두개의 객체의 주소값을 비교하여 동일하면 true를
        반환하는 메서드
   */

  print( identical(unit1, unit2) ); // false
  print( identical(unit1, unit3) ); // false
  print("========================");

  print( identical(unit1, unit3) ); // false
  print( identical(unit3, unit4) ); // true
  print("========================");

  print( identical(unit1, unit5) ); // false
  print( identical(unit3, unit5) ); // false
  print( identical(unit5, unit6) ); // false
}