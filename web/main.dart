import 'sudoku_ui.dart';
import 'dart:html';

Puzzle puzzle;

void captureKeystroke(Event e) {
  if (e is KeyboardEvent) {
    KeyboardEvent keyboard_event = e as KeyboardEvent;
    puzzle.handleKeyboardInput(keyboard_event);
  }
}


void main() {
  window.onKeyUp.listen(captureKeystroke);
  puzzle = new Puzzle();
}
