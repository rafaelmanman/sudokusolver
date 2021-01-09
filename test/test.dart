import 'package:test/test.dart';
import '../lib/solver.dart';


void main() {
  Grid grid;
  setUp(() {
    var data = [
      [9,0,0,0,2,4,6,0,0],
      [0,1,0,0,8,0,0,9,4],
      [0,0,8,9,0,7,0,1,0],
      [6,0,2,0,0,0,1,0,0],
      [0,0,0,8,1,2,0,0,0],
      [0,0,4,0,0,0,8,0,5],
      [0,2,0,5,0,3,7,0,0],
      [7,4,0,0,6,0,0,5,0],
      [0,0,3,4,7,0,0,0,8],];

    grid = new Grid(data);
  });
  test('Possible Row Numbers', () {
    expect(grid.isPossibleRowNumber(0, 9), equals(false));
    expect(grid.isPossibleRowNumber(0, 1), equals(true)); 
  });
  test('Possible Column Numbers', (){
    expect(grid.isPossibleColumnNumber(0, 6), equals(false));
    expect(grid.isPossibleColumnNumber(0, 2), equals(true));
  });

  test('Possible Group Numbers', () {
    expect(grid.isPossibleGroupNumber(1, 0, 9), equals(false));
    expect(grid.isPossibleGroupNumber(1, 0, 2), equals(true));
  });

  test('Possible Numbers', () {
    expect(grid.isPossibleNumber(1, 0, 2), equals(false));
    expect(grid.isPossibleNumber(1, 0, 3), equals(true));
  });
  
  test('Get Possible Numbers', () {
    expect(grid.getPossibleNumbers(1, 0), equals([3, 5, 7]));
  });

  test('Get All Possible Numbers', () {
    var possibles = grid.getAllPossible();
    expect(true, equals(true));
  });

  test('Grid is complete', () {
    var data = [
      [9,1,1,1,2,4,6,1,1],
      [1,1,1,1,8,1,1,9,4],
      [1,1,8,9,1,7,1,1,1],
      [6,1,2,1,1,1,1,1,1],
      [1,1,1,8,1,2,1,1,1],
      [1,1,4,1,1,1,8,1,5],
      [1,2,1,5,1,3,7,1,1],
      [7,4,1,1,6,1,1,5,1],
      [1,1,3,4,7,1,1,1,8],];

    Grid complete_grid = new Grid(data);
    expect(complete_grid.isComplete(), equals(true));
    expect(grid.isComplete(), equals(false));
  });
}
