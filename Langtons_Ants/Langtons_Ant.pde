float speed = 20;

class Ant{
float X, Y;
color pixelColor;
int dir;
color antColor;

Ant(float posX, float posY, int d, color aC){
  X = posX;
  Y = posY;
  dir = d;
  antColor = aC;
  //&antColor = GetAntColor(d);
}

color GetAntColor(color d){
  switch(dir){
    case 0: return color(0,0,0);
    case 1: return color(255,0,0);
    case 2: return color(0,255,0);
    case 3: return color(0,0,255);
    default: return color(125, 125, 125);
  }
}

void Process(){
  pixelColor = GetColor();
}

void Change(){
  set((int)X, (int)Y, GetOther());
}

void Move(){
  if(pixelColor == color(255))
    dir++;
  else
    dir--;
    
  if(dir == -1)
    dir = 3;
    
  if(dir == 4)
    dir = 0;
  
  switch(Dir.values()[dir]){
    case Up: Y--; break;
    case Right: X++; break;
    case Down: Y++; break;
    case Left: X--; break;
  }
}

color GetColor(){
  return get((int)X, (int)Y);
}

color GetOther(){
  if(pixelColor == antColor)
    return color(255);
  else
    return antColor;
}

}

Ant[] ants = new Ant[100];

void setup(){
  noStroke();
  background(255);
  size(800, 600);
  
  for(int idx = 0; idx < ants.length; idx++){
    ants[idx] = new Ant(random(width), random(height), (int)random(4), AntColor());
  }
}

void draw(){
  for(int idx = 0; idx < ants.length; idx++){
    for(int idx2 = 0; idx2 < speed; idx2++){
    ants[idx].Process();
    ants[idx].Change();
    ants[idx].Move();
    }
  }
}

color AntColor(){
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  return color(r, g, b);
}

//void SetColor(){
//  set((int)lastX, (int)lastY, GetOther());
//}

//void Start(){
//  lastX = X;
//  lastY = Y;
//  Y--;
//  dir = 0;
//}

enum Dir{
  Up,
  Right,
  Down,
  Left
}
