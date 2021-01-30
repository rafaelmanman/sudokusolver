part of sudoku_ui;

class Cursor{
  int x;
  int y;
  int previous_x;
  int previous_y;

  int max_x;
  int max_y;

  Cursor(int size) {
    this.x = 0;
    this.y = 0;
    this.previous_x = 0;
    this.previous_y = 0;
    this.max_x = size - 1;
    this.max_y = size - 1;
  }

  void savePrevious() {
    previous_x = x;
    previous_y = y;
  }

  void moveUp() {
    if (y>0) {
      savePrevious();
      y -= 1;
    }
  }

  void moveDown() {
    if (y<max_y) {
      savePrevious();
      y += 1;
    }
  }

  void moveLeft() {
    if(x>0) {
      savePrevious();
      x -= 1;
    }
  }
  
  void moveRight() {
    if(x<max_x) {
      savePrevious();
      x += 1;
    }
  }
}
