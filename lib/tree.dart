part of solver;

class Node {
  Grid grid;
  List<Possible> possibles;
  List<Node> children;
  Node(grid){
    this.grid = grid.copy();
    this.children = [];
    this.possibles = grid.getAllPossible();
  }

  void addChild(Node child) {
    children.add(child);
  }

  void addChildren() {
    if (containsEmpty() != true && possibles.isEmpty != true) {
      var possible = possibles.first;
      possible.numbers.forEach((number) {
        Grid newGrid = grid.copy();
        newGrid.update(possible.coord, number);
        Node new_node = Node(newGrid);
        addChild(new_node);
      });
    }
  }

  bool containsEmpty() {
    possibles.forEach((possible) {
      if (possible.isEmpty()) {
        return true;
      }
    });
    return false;
  }
  
}

