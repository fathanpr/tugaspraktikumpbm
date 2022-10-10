//list,Map,Set
//Fathan Pebrilliestyo Ridwan / 20072
void main(List<String> args) {

  //List (Biasa kita sebut Array dalam bahasa pemrograman lain)
  var isList = [0,8,9,"cihuy"];
  print(isList);

  //Map (Biasa dikenal sebagai array Assosiatif dan output seperti JSON)
  var isMap = Map<String, dynamic>();
  isMap['Nama'] = 'Fathan Pebrilliestyo Ridwan';
  isMap['NPM'] = '2010631170072';
  isMap['Target IPK'] = 3.9;
  print(isMap);

  //Set (Jenis array yang value nya tidak boleh duplikat, kalo duplikat nanti dibuang salah satunya)
  var isSet = {
    'Data 1', 
    'Data 2', 
    'Data 4', //Data 4 diduplikat sebanyak 3x, namun di output hanya ada 1x
    'Data 4',
    'Data 4'
    };
  print(isSet);
    
}