import 'lib/solver.dart';

void main(){
  var data = [
    [0,0,0,0,0,5,9,7,0],
    [4,0,0,7,0,1,0,8,2],
    [0,3,0,2,9,0,0,6,0],
    [0,0,4,0,0,9,2,0,0],
    [9,0,0,3,2,6,0,0,7],
    [0,0,6,4,0,0,5,0,0],
    [0,4,0,0,7,3,0,5,0],
    [5,7,0,1,0,8,0,0,9],
    [0,8,1,9,0,0,0,0,0],];

  var grid = new Grid(data);
  var solver = new Solver(grid);
  var solution = solver.solve();
  solution.printGrid();
}
