class Cell {
  
  int i, j;
  
  // top, right, bottom, left
  boolean[] walls = {true, true, true, true};
  
  boolean visited = false;
  
  Cell(int i, int j) {
    this.i = i;
    this.j = j;
  }
  
  void show(){
    
    int x = this.i * size;
    int y = this.j * size;
    stroke(255);
    strokeWeight(2);
    
    //top
    if(this.walls[0]){
      line(x, y, x+size, y);
    }
    
    //right
    if(this.walls[1]){
      line(x+size, y, x+size, y+size);
    }
    
    //bottom
    if(this.walls[2]){
      line(x+size, y+size, x, y+size);
    }
    
    //left
    if(this.walls[3]){
      line(x, y+size, x, y);
    }
    
    if(this.visited){
      noStroke();
      
      //fill(255, 0,255, 100);
      fill(225, 93, 255, 170);
      rect(x,y,size,size);
    }
  }
  
  
  Cell chooseRandomNeighbour(){
    ArrayList<Cell> neighbours = new ArrayList<Cell>();
    
    Cell top = null;
    Cell right = null;
    Cell bottom = null;
    Cell left = null;
    
    if(j > 0){
      top = grid[i][j-1];
    }
    
    if(i < columns-1){
      right = grid[i+1][j];
    }
    
    if(j < rows-1){
      bottom = grid[i][j+1];
    }
    
    if(i > 0){
      left = grid[i-1][j];
    }
    
    if(top != null && !top.visited){
      neighbours.add(top);
    }
    
    if(right != null && !right.visited){
      neighbours.add(right);
    }
    
    if(bottom != null && !bottom.visited){
      neighbours.add(bottom);
    }
    
    if(left != null && !left.visited){
      neighbours.add(left);
    }
    if(neighbours.size() > 0){
      // the index of random neighbour
      int index = int(random(0, neighbours.size()));
      return neighbours.get(index);
    }
    else{
      return null;
    }
  }
  
  void drawCurrentCell(int r, int g, int b){
    int x = this.i * size;
    int y = this.j * size;
    
    noStroke();
    fill(r, g, b);
    rect(x+5,y+5,size-10,size-10);
  }
  
  void isMazeCompleted(){
    if(current.i == columns-1 && current.j == rows-1){
      textFont(createFont("Bitstream Vera Sans Bold", 30));
      textAlign(CENTER);
      text("MAZE COMPLETED", columns/2 * size, rows/2 * size);
      noLoop();
    }
  }
}
