//Fathan Pebrilliestyo Ridwan / 20072
void main(List<String> args) {

  //String
  String isString = "Ini String"; 
  print(isString);

  //Int
  int isInteger = 17;
  print(isInteger);

  //Numb
  num isNumber = 99.5;
  print(isNumber);

  //Double
  double isDouble = 0.25;
  print(isDouble);

  //Dynamic (Bisa Mereplace/mengganti valuenya dengan value tipe apapun)
  dynamic isDynamic = 95;
  isDynamic = "Sembilan Puluh Lima";
  print(isDynamic);

  //Boolean
  bool isBoolean = true;
  print(!isBoolean);

  //Runes (Digunakan untuk mengakses Unit Kode String, dart sendiri mewakili string sebagai urutan unit kode UTF-16)
  const nama = 'Fathan';
  final isRunes = nama.runes.toList();
  print(isRunes);

  //Symbol (Tambahkan # pada identifier untuk menggunakan symbol dart)
  Symbol isSymbol=new Symbol("Ini Simbol");
  print(isSymbol);
  print(#Fathan);

  //Null (Null-Safety berguna untuk mencegah adanya sebuah variabel bernilai null dan mencegah error pada compiler)
  String? isNull; //
  print("$isNull");

}