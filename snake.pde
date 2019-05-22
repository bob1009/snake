// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
private int x;
private int y;
  // 3. Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
this.x=x;
this.y=y;
}
  // 4. Add getter and setter methods for both the x and y member variables.
  int getX(){
     return x; 
  }
  
  void setX(int x){
    this.x = x;
  }
  
  int getY(){
    return y;
  }
 void setY(int y){
 this.y = y;
 }
}
// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;
// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String direction="up";
// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int foodcount=1;
// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX=(int)random(50)*10;
int foodY=(int)random(50)*10;
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

//int foodX = ((int)random(50)*10);



void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
head=new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {

  background(0);
drawSnake();
drawFood();
move();
collision();
manageTail();


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  fill(#F52C2C);
  
rect(foodX,foodY,10,10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  fill(#67BF36);
rect(head.getX(),head.getY(),10,10);


  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
 
  switch(direction) {
  case "up":
 head.setY(head.getY()-10);
    break;
  case "down":
     head.setY(head.getY()+10);
    break;
  case "left":
   head.setX(head.getX()-10);
    break;
  case "right":
    head.setX(head.getX()+10);
    break;
  }
  checkBoundaries();
}
 


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.



// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
if(keyCode==UP){
  if(!direction.equals("down")){
direction="up";
  }
}
if(keyCode==DOWN){
  if(!direction.equals("up")){
direction="down";
}}
if(keyCode==LEFT){
  if(!direction.equals("right")){
direction="left";
}}
if(keyCode==RIGHT){
  if(!direction.equals("left")){
direction="right";
  }
}
  }
// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(head.getX()<0){
  head.setX(500);
  }
  if(head.getX()>500){
  head.setX(0);
  }
   if(head.getY()>500){
  head.setY(0);
  }
   if(head.getY()<0){
  head.setY(500);
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {
if(head.getX()==foodX&&head.getY()==foodY){
foodcount+=1;
foodX=(int)random(50) * 10;
foodY=(int)random(50) * 10;
}
  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment>tail = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {
  drawTail();
checkTailCollision();
  //Call the drawTail and checkTailCollision methods.

  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
Segment tailseg=new Segment(head.getX(),head.getY());
tail.add(tailseg);
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
while(tail.size()>foodcount){
tail.remove(0);
}
}


void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for (int i = 0; i <tail.size(); i++) {
      fill(#67BF36);
      rect(tail.get(i).getX(),tail.get(i).getY(),10,10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
 for (int i = 0; i <tail.size(); i++){
   Segment seg=tail.get(i);
if(head.getX()==seg.getX()&&head.getY()==seg.getY()){
foodcount=0;
}}}
  // reset your food variable

  //Call this method at the beginning of your manageTail method.
