# Dart_FlutterSurvivalCoding

다트문법
=======

1. 변수
 - int와 double은 num 타입에 포함된다
 - double타입에 int를 집어 넣는 자동 형변환 지원X
 - 하지만 num타입에는 int와 double 타입 모두 대입 가능
 - var의 타입추론 지원
 - final 키워드 : 상수, 한번만 값 할당 가능
 - const 키워드 : 값 할당 불가
 
2. 산술연산자
 - ~/ : 몫(int 타입 변환)
 
     assert(5 ~/ 2 == 2);
     
3. 타입검사
 - is : 같은 타입이면 true
 - is! : 다른 타입이면 true
 
    int a = 10;
    if(a is int){
        print('정수');
    }
    
    String text = 'Hello';
    if(text is! int){
        print('숫자 아님');
    }

4. 형변환
 - 상위개념으로 변환 가능
   int, double => num 가능
   but num => int 또는 int => double 불가능
   
5. 메서드
 - 반환타입을 타입 추론에 의하여 생략 가능
   아래의 두 메소드는 같다
 
    void greeting(String greet){
        print('hello $greet');
    }
    
    greeting(String greet){
        print('hello $greet');
    }
    
6. 변수 앞에 $를 붙여 문자열 내 변수 삽입 가능
 - 또 $기호 뒤에 {}를 삽입하여 표현식 사용 가능
 
    print('$name은 $age살입니다');
    print('${_name.length} 글자수입니다.');
    
7. 익명함수
 - ([인수명]) { [동작 또는 반환값] }
 
    (number) {
        return number % 2 == 0;
    }
    
8. 람다식
 - ([인수명]) => { [동작 또는 반환값] }
 
    (number) => number % 2 == 0;
    
9. 선택 매개변수
 - 함수 정의에서 {}로 감싸주면 됨
 - named parameter라고도 부름
 - 만약 필수 매개변수와 선택 매개변수를 함께 사용하고 싶을때는 앞쪽에 필수 매개변수를 써줌
 
    void something({String name, int age}){ }
    
    void main(){
        something(name: '홍길동', age: 10);
        something(name: '홍길동');
        something(age: 10);
        something();
    }
    
    void something(String name, {int age});


10. 클래스
 - 변수명 앞에 언더라인(_)을 붙이면 private이 된다.
 - 생성자에 선택 매개변수를 주어 할당 할 수 있다.
 - 생성자에서 private 변수를 선택매개변수로 할당 할 수 없다.
 - getter와 setter 사용 가능
 
 
void main() {
  var person = new Person(20);
  
  var person2 = Person(30, name: '홍길동');
  
  print(person.name);
  print(person.age);
  
  print('${person2.name}: ${person2.age}살');
  
  person2.age = 35;
  print('${person2.age}');
}

class Person{
  String name;
  int _age; // 변수명 앞에 언더라인(_)을 붙이면 private가 된다.
  int get age => _age; // getter
  set age(int value) => _age = value;
  
  Person(int age, {this.name}){
    this._age = age;
  }
  
  void addOneYear(){
    _age++;
  }
}


// getter setter 예시

class Rectangle{
  num left, right, width, height;
  
  Rectangle(this.left, this.right, this.width, this.height);
  
  num get right => left + width; // right getter 
  set right(num value) => left = value - width; // right setter
  
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
  
}


11. 상속
 - extends 키워드를 통하여 상속
 - @override 어노테이션을 이용하여 재정의 하여 사용
 - super 키워드를 사용하여 슈퍼클래스에 접근 가능
 
 
 void main() {
  var hero = new SuperHero();
  hero.name = '콩길동';
  
  hero.run();
}


class Hero{
  String name='영웅';
  
  // Hero({this.name});
  
  void run(){
    print('Run $name');
  }
}

class SuperHero extends Hero{
  
  
  @override
  void run(){
    super.run();
    this.fly();
  }
  
  void fly(){
    print('Fly $name');
  }
}



12. 추상클래스
 - 선언만 되고 정의가 없는 추상메서드를 포함하는 클래스
 
 
void main() {
  var monster = new Goblin();
  
  monster.attack();
}

abstract class Monster{
  void attack();
}

class Goblin implements Monster{
  
  String name;
  
  Goblin(){
    this.name = '고블린';
  }
  
  @override
  void attack(){
    print('${this.name} attack');
  }
}


13. 믹스인
 - with 키워드를 사용하여 상속하지 않고 다른 클래스의 기능을 가져오거나 오버라이드 한다.
 
 
class DarkGoblin extens Goblin with Hero{
  
}


14. 컬렉션
 - List<T> : 같은 타입의 자료형을 담음, 인덱스 접근 가능
 - Map<K, V> : Key로 접근 가능
   만약 key에 해당하는 값이 없으면 null 반환
 - Set<T> : 중복이 허용되지 않는 자료형을 담음
   add()로 추가 remove()로 삭제 contains()로 있느지 체크
 - 빈 Set이나 빈 Map을 작성할 때에는 문법 조심. 값 없이 그냥 {}만 작성하면 Map으로 인식
   빈 Set 설정하기 : var mySet = <String>{}; // Set<String>
   빈 Map 설정하기 : var myMap = {} // Map<dynamic, dynamic>
 
 
void main() {
  
  List<String> items = ['짜장', '짬뽕', '탕수육'];
  // spread 연산자, 다른 컬렉션 안에 컬렉션을 삽입할 때 사용
  
  var itmes2 = ['우동', '잡채', ...items];
  
  // spread연산자를 통하여 list를 set에 담게 되면 중복제거 가능
  final fruits = ['banana', 'apple', 'orange', 'banana'];
  final myFruits = {...fruits, 'grape'};
 
  myFruits.forEach(print);
  
  var cityMap = {
    '한국': '부산',
    '남아공': '케이프타운',
    '호주': '케언즈'
  };
  
  print(cityMap['남아공']);
  
  cityMap['미국'] = '고담';
  print(cityMap['미국']);
  
  
  var animals = {'고양이', '멍멍이'};
  animals.add('염소');
  animals.remove('멍멍이');
  if(animals.contains('염소')){
    animals.forEach((a) => print('$a $a'));
  }
}


15. 일급객체
 - 함수를 매개변수로 넘기기, 수정하기, 대입하기가 가능한 것을 일급객체(first-class object)라 한다.
 - 다트는 함수형 프로그래밍을 지원하며 일급객체이다.


void main() {
  var f = gretting; // 함수를 변수에 대입 할 수 있음.
  f('hello');
}

void gretting(String text){
  print(text);
}


void main() {
  something(myPrintFunction);
  something((i) => myPrintFunction(i));
  something((i) => print(i));
  something(print);
}

void something(Function(int i) f){
  f(10);
}

void myPrintFunction(int i){
  print('출력 $i');
}


16. forEach

void main() {
  
  final items = [1, 3, 5, 2, 4, 2, 56,6 ];
  
  for(int i=0; i<items.length; i++){
    print(items[i]);
  }
  
  items.forEach(print);
  items.forEach((i) {
    print(i);
    print(i);
  });
}


16. 람다식
 - where() : 조건 필터링
 - map() : 다른 형태로 변환(c#에서의 select)
 - toList() : 리스트로
 - toSet() : Set으로
 - any() : 요소가있는지 체크
 - reduce() : 반복 요소를 줄여가면서 결과를 만들때 사용
   함수의 연산 결과를 다음 요소와 연산
   매개변수 2개: (e, v) => 함수(e, v)
   
 import 'dart:math';

void main() {
  
  final items = [1, 3, 5, 2, 4, 2, 56,6 ];
  
  for(int i=0; i<items.length; i++){
    print(items[i]);
  }
  
  items.forEach(print);
  items.forEach((i) {
    print(i);
    print(i);
  });
  
  items.forEach((i) => print(i));
  
  items.where((i) => i % 2 == 0).forEach(print);
  
  items.where((i) => i % 2 == 0).map((i) => '숫자 $i').forEach(print);
  
  //var newItems = items.where((i) => i % 2 == 0).map((i) => '숫자 $i').toList();
  
  var newItems = items.where((i) => i % 2 == 0).map((i) => '숫자 $i').toSet().toList();
  
  print(items.any((i) => i % 3 == 0));
  
  print(items.reduce((i, n) => max(i, n)));
  
}

17. 계단식 표기법
 - ..연산자를 사용하면 메서드를 수행한 객체의 참조를 반환
 - print(items..add(6)..remove(3));
 
18. 컬렉션 if, for
 - 컬렉션 내부에 if나 for문 사용이 가능하다. 하지만 중괄호'{}'는 사용 불가
 
void main() {
  
  bool isAdd = true;
  print([1, 2, 3, 4, 5, if(isAdd) 6]);
  
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for(var i in listOfInts)
      '#$i'
  ];
  
  for(var s in listOfStrings){
    print(s);
  }
}


19. null 처리
 - dart에서는 int, double, bool 등도 모두 클래스타입이다.
   따라서 null일 수 있다
 - ?연산자를 붙일 경우 exception이 뜨는 것이 아니라, 객체가 null일 경우, null을 반환한다.
 - ?? 연산자를 사용하면, null일 경우의 처리 가능
 
void main() {
  
  String name = null;
  
  print(name?.length);
  
  print(name?.length ?? "이름 없음"); // null일 경우의 처리 간단하게 함
}
 
