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
