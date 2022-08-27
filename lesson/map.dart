//code by erenincesu10
//Map data structure declaration and example

void main() {
    var name1 = Map();
    name1["eren"]="name";
    var name2 = {"name" : "eren",//key-value
                       "surname":"incesu",
                      };
    name2["age"]="34";
  
  print(name2);
  
  
  name2.remove("yas");
  print(name2);
  
  for(var key in name2.keys){
    print(key);
    print(name2[key]);
  }
  for(var value in name2.values){
    print(value);
  }
  print(name2.containsKey("numara"));//returns true-false
  
  name2.forEach((k,v)=>{
     print(k + " " + v)
  });
}
