PGraphics canvas;

int currentPage = 0;
Page p0, p1, p2;

SenderSwitcherButton abm, solar;
SwitcherButton back;



void setup(){
  fullScreen();
  
  canvas = createGraphics(width, height);
  
  p0 = new Page(0);
  p1 = new Page(1);
  p2 = new Page(2);
  
  abm = new SenderSwitcherButton(this, "abm", 1, "data/icons/telecom.png", 2*width/5, height/2, 170);
  solar = new SenderSwitcherButton(this, "solar", 2, "data/icons/solar.png", 3*width/5, height/2, 170);
  back = new SwitcherButton(this, "back", 0, "data/icons/back.png", 30, 30, 25);
  
  p0.addElement(abm);
  p0.addElement(solar);
  p1.addElement(back);
  p2.addElement(back);
  
}


void draw(){
  
  if(currentPage == 0){
      canvas.beginDraw();
      canvas.background(255);
      p0.draw(canvas);
      canvas.endDraw();
      image(canvas, 0, 0);
      
  }else if(currentPage == 1){
      canvas.beginDraw();
      canvas.background(255);
      p1.draw(canvas);
      canvas.endDraw();
      image(canvas, 0, 0);
    
  }else if(currentPage == 2){
      canvas.beginDraw();
      canvas.background(255);
      p2.draw(canvas);
      canvas.endDraw();
      image(canvas, 0, 0);
  }
  
}
