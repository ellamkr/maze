import java.util.Arrays;

// columms and rows number
int columns, rows;

// size of one square in canvas
int size = 30;

// two dimensional array to save cells
//ArrayList<Cell> grid = new ArrayList<Cell>();
Cell[][] grid = new Cell[columns][rows];

// cell that is currently being visited  
Cell current;

Stack<Cell> stack = new Stack<Cell>();

int numberOfVisitedCells = 1;
boolean generated = false;

void setup(){
  size (390, 390);
  
  // int(400/30)=13 number of columns and rows
  columns = int(width/size);
  rows = int(height/size);
  
  // add 8 frames per second
  frameRate(8);
  
  grid = new Cell[columns][rows];
  
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < columns; i++){
      grid[i][j] = new Cell(i, j);
    }
  }
  current = grid[0][0];
}

void draw(){
  
  if(!generated){
    if(numberOfVisitedCells == columns*rows && current.i == 0 && current.j == 0){
      println("Maze generation is finished");
      generated = true;
    }
    
    background (50);
    for(int j = 0; j < rows; j++){
      for(int i = 0; i < columns; i++){
        grid[i][j].show();
      }
    }
  
    current.visited = true;
    current.drawCurrentCell(255, 255, 0);
    
    // STEP 1: Randomly choose one of the unvisited neighbours
    Cell next = current.chooseRandomNeighbour();
  
    if(next != null){
   
      next.visited = true;
      numberOfVisitedCells++;
    
      // STEP 2: Push the current cell to the stack
      stack.push(current);
    
      //STEP 3: Remove the wall between the current cell and the chosen cell
      removeWalls(current, next);
    
      // STEP 4: Make the chosen cell the current cell
      current = next;
    }
    else if(stack.size() > 0){
      current = stack.pop();
    }
  }
  //else{
  //   fill(29, 41, 81);
  //   circle((columns-1) * size + size/2, (rows-1) * size + size/2, size/2);
  //   rect(((columns-1) * size) + 5, ((rows-1) * size) + 5, ((columns-1) * size + size) - 10, ((rows-1) * size + size) - 10);
  //}
}

void removeWalls(Cell current, Cell neighbour){
  int x = current.i - neighbour.i;
    
  // neighbour is on the left side of current cell
  if(x == 1){
    // remove current cell's left wall and neighbour's right wall
    current.walls[3] = false;
    neighbour.walls[1] = false;
  }
  // neighbour is on the right side of current cell
  else if(x == -1){
    // remove current cell's right wall and neighbour's left wall
    current.walls[1] = false;
    neighbour.walls[3] = false;
  }
    
  int y = current.j - neighbour.j;
    
  // neighbour is on the top side of current cell
  if(y == 1){
    // remove current cell's top wall and neighbour's bottom wall
    current.walls[0] = false;
    neighbour.walls[2] = false;
  }
  // neighbour is on the bottom side of current cell
  else if(y == -1){
    // remove current cell's bottom wall and neighbour's top wall
    current.walls[2] = false;
    neighbour.walls[0] = false;
  }
}

void keyPressed(){

  if (keyCode == DOWN){
    if(current.j < rows-1){
      if(grid[current.i][current.j].walls[2] == false){
      
        //current.drawCurrentCell(130, 30,130);
        current.drawCurrentCell(167, 79, 187);
        current.j++;
        current.drawCurrentCell(255, 255, 0);
        current.isMazeCompleted();
      }
    }
  }
  else if (keyCode == UP){
    if(current.j >0){
      if(grid[current.i][current.j].walls[0] == false){
        
       // current.drawCurrentCell(130, 30,130);
        current.drawCurrentCell(167, 79, 187);
        current.j--;
        current.drawCurrentCell(255, 255, 0);
      }
    }
  }
  else if (keyCode == RIGHT){
    if(current.i < columns-1){
       if(grid[current.i][current.j].walls[1] == false){
         
        //current.drawCurrentCell(130, 30,130);
        current.drawCurrentCell(167, 79, 187);
        current.i++;
        current.drawCurrentCell(255, 255, 0);
        current.isMazeCompleted();
       }
    }
  }
  else if (keyCode == LEFT){
    if(grid[current.i][current.j].walls[3] == false){
      if(current.i > 0){
        
        //current.drawCurrentCell(130, 30,130);
        current.drawCurrentCell(167, 79, 187);
        current.i--;
        current.drawCurrentCell(255, 255, 0);
      }
    }
  }
}
