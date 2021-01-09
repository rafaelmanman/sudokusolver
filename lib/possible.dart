part of solver;
class Possible {
  int x;
  int y;
  List<int> coord;
  List<int> numbers;

  Possible(x,y,numbers){
    this.x = x;
    this.y = y;
    this.coord = [x,y];
    this.numbers = numbers;
  }

  bool isEmpty() {
    return numbers == [];
  }
}
