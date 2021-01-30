part of sudoku_ui;

class Puzzle{
  TableElement puzzle;
  Cursor cursor;
  Puzzle() {
    this.cursor = new Cursor(9);
    //this.puzzle = new TableElement();
    this.puzzle = querySelector('sudoku_grid');
  }

  void createPuzzle() {

  }

  void solvePuzzle() {
    var data = getPuzzleData();
    Grid grid = new Grid(data);
    Solver solver = new Solver(grid);
    Grid solved_puzzle = solver.solve();
    addDataToPuzzle(solved_puzzle);
  }

  void updateCell(String value) {
    var current_cell = puzzle.rows[cursor.y].cells[cursor.x];
    current_cell.innerHtml = value;
  }

  void updatePuzzleCursor() {
    var current_cell = puzzle.rows[cursor.y].cells[cursor.x];
    var previous_cell = puzzle.rows[cursor.previous_y].cells[cursor.previous_x];

    previous_cell.classes.remove("selected");
    current_cell.classes.add("selected");
  }

  List<List<int>> getPuzzleData() {
    return puzzle.rows.map((row) {
      return row.cells.map((cell) {
        return cell.innerHtml == "" ? 0 : int.parse(cell.innerHtml);
      }).toList();
    }).toList();
  }

  void addDataToPuzzle(Grid grid) {
    var gridData = grid.data;
    for(int i=0; i<puzzle.rows.length; i++){
      for(int j=0; j<puzzle.rows[i].cells.length; j++) {
        puzzle.rows[i].cells[j].innerHtml = gridData[i][j].toString(); 
      }
    }
  }

  void handleKeyboardInput(KeyboardEvent keyboard_event){
    switch (keyboard_event.keyCode) {
      case KeyCode.LEFT:
        cursor.moveLeft();
        break;
      case KeyCode.RIGHT:
        cursor.moveRight();
        break;
      case KeyCode.UP:
        cursor.moveUp();
        break;
      case KeyCode.DOWN:
        cursor.moveDown();
        break;

      case KeyCode.ONE:
        updateCell("1");
        break;

      case KeyCode.TWO:
        updateCell("2");
        break;

      case KeyCode.THREE:
        updateCell("3");
        break;

      case KeyCode.FOUR:
        updateCell("4");
        break;

      case KeyCode.FIVE:
        updateCell("5");
        break;

      case KeyCode.SIX:
        updateCell("6");
        break;

      case KeyCode.SEVEN:
        updateCell("7");
        break;

      case KeyCode.EIGHT:
        updateCell("8");
        break;

      case KeyCode.NINE:
        updateCell("9");
        break;

      case KeyCode.BACKSPACE:
        updateCell("");
        break;

      case KeyCode.ENTER:
        solvePuzzle();
        break;
    }

    updatePuzzleCursor();
  }
}
