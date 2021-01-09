library solver;

part 'grid.dart';
part 'possible.dart';
part 'tree.dart';

class Solver {
  Grid grid;
  Solver(grid) {
    this.grid = grid;
  }

  Grid solve() {
    Node root = Node(grid);
    root.addChildren();
    var queue = root.children;
    var current_node = root;
    
    while (current_node.grid.isComplete() == false) {
      current_node = queue[0];
      queue.remove(current_node);
      current_node.addChildren();
      queue += current_node.children;
    }
    
    return current_node.grid;
  }
}
