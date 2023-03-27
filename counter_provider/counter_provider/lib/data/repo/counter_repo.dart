class CounterRepo{
  int incrementCounter(int count) {
    return ++count;
  }

  int descrementCounter(int count) {
    if(count != 0){
      return --count;
    } else {
      return 0;
    }
  }
}