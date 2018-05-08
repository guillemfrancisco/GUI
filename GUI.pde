int currentPage = 0;
Page p0, p1, p2;
ArrayList<Page> pages = new ArrayList();



void setup() {
  fullScreen(P3D);
    
  Page p0 = new Page(0);
  p0.active = true;
  pages.add(p0);
  Page p1 = new Page(1);
  pages.add(p1);
  Page p2 = new Page(2);
  pages.add(p2);
  
  SenderSwitcherButton abm = new SenderSwitcherButton(this, p0, "abm", 1, "data/icons/antenna.svg", 2*width/5, height/2, 170);
  SenderSwitcherButton solar = new SenderSwitcherButton(this, p0, "solar", 2, "data/icons/sun.svg", 3*width/5, height/2, 170);
  SwitcherButton backAbm = new SwitcherButton(this, p1, "back", 0, "data/icons/back.svg", 30, 30, 25);
  SwitcherButton backSolar = new SwitcherButton(this, p2, "back", 0, "data/icons/back.svg", 30, 30, 25);
  
}


void draw() {
  
  background(255);
  pages.get(currentPage).draw();
  
  
  
}



void mousePressed() {
  Page active = pages.get(currentPage);
  active.click(mouseX, mouseY);
  active.active = false;
  pages.get(currentPage).active = true;
  
}
