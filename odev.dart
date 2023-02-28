void main() {
  List<String> phoneNumbers = [
    "+540123456789",
    "+900123456789",
    "+541234567891",
    "+400123456789",
    "+901234567891",
    "+123456789123",
    "+542345678912",
    "+611234299853",
    "+541112223334"
  ];
  print(getNumberCount("+54",phoneNumbers));
}

int getNumberCount(String start,List<String> numbers){
  var count = 0;
  /*for(var i = 0;i<numbers.length;i++){
    if(numbers[i].startsWith(start)){
      count++;
    
    }
  }*/
  
  numbers.forEach((i) {
    if(i.startsWith(start)){
      count++;
    }
  });
  
  return count;
}
