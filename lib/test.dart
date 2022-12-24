void main(){
  var p = Person(22, 'Khomsuea','Nattanon' );
  var p2 = Person(55, 'xxxx', 'sompong');

  print(p.firstName);
  print(p2.lastName);
  print(p.age.toString());
  //p.firstName = 'xxxx';
}
class Person{
  final String firstName;
  final String lastName;
  final int age;

  Person(this.age,this.lastName,this.firstName);
}