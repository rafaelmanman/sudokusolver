part of solver;

class Grid{
  List<List<int>> data;
  Grid(var data){
    this.data = data;
  }

  bool isPossibleRowNumber(y, possible_number) {
    for(int i=0; i<9; i++){
      if(data[y][i] == possible_number) {
        return false;
      }
    }
    return true;
  }

  bool isPossibleColumnNumber(x, possible_number) {
    for(int i=0; i<9; i++){
      if(data[i][x] == possible_number) {
        return false;
      }
    }
    return true;
  }

  bool isPossibleGroupNumber(x, y, possible_number) {
    int x0 = (x ~/ 3) * 3;
    int y0 = (y ~/ 3) * 3;
    for(int i=0; i<3; i++){
      for(int k=0; k<3; k++){
        if(data[y0+i][x0+k] == possible_number) {
          return false;
        }
      }
    }
    return true;
  }

  bool isPossibleNumber(x, y, possible_number) {
    bool is_row = isPossibleRowNumber(y, possible_number);
    bool is_column = isPossibleColumnNumber(x, possible_number);
    bool is_group = isPossibleGroupNumber(x, y, possible_number);
    return is_row && is_column && is_group;
  }

  List<int> getPossibleNumbers(x, y) {
    List<int> test_numbers = [1,2,3,4,5,6,7,8,9];
    var result = test_numbers.where((pn) => isPossibleNumber(x,y,pn)).toList();
    return result;
  }

  List<Possible> getAllPossible() {
    List<Possible> results = [];
    for(int y=0; y<9; y++){
      for(int x=0; x<9; x++){
        if (data[y][x] == 0) {
          results.add(Possible(x,y,getPossibleNumbers(x,y)));
        }
      }
    }
    results.sort((prev,next) => prev.numbers.length.compareTo(next.numbers.length));
    return results;
  }

  Grid copy() {
    List<List<int>> new_data = this.data.map((row){
      return List<int>.from(row);
    }).toList();

    return new Grid(new_data);
  }
  
 void update(coord, number) {
   int x = coord[0];
   int y = coord[1];
   data[y][x] = number;
 }

 bool isComplete() {
   bool result = true;
   data.forEach((row){
     if (row.contains(0)) {
       result = false;
     }
   });

   return result;
 }

 void printGrid() {
  data.forEach((row){
    print(row);
  });
 }
}
