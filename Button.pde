public abstract class Button implements GUIElement{
    
    private final PApplet PARENT;
    protected final String LABEL; 
    private final int X, Y, WDTH;
    private final PImage IMG;
    protected boolean selected = false;
   
    public Button(PApplet parent, String label, String pathImage, int x, int y, int wdth) {
      PARENT = parent;
      parent.registerMethod("mouseEvent", this);
      
      LABEL = label;
      X = x;
      Y = y;
      WDTH = wdth;
      
      IMG = loadImage(pathImage);
      IMG.resize(0, WDTH);
    }
    
   
    public void draw(PGraphics canvas) {
      canvas.imageMode(CENTER);
      canvas.image(IMG, X, Y);
    }
    
    
    public void mouseEvent(MouseEvent e) {
          switch(e.getAction()) {
              case MouseEvent.PRESS:
                  if(mouseX > (X-IMG.width/2) && mouseX < (X+IMG.width/2) && mouseY > (Y-IMG.height/2) && mouseY < (Y+IMG.height/2)){
                     selected = true;
                     whenSelected();
                  }
                  break;
          }
      }
    
    
    protected abstract void whenSelected();
    
}



public class SwitcherButton extends Button{
    
    int switchTo;
    
    SwitcherButton(PApplet parent, String label, int switchTo, String pathImage, int x, int y, int wdth){
      super(parent, label, pathImage, x, y, wdth);
      this.switchTo = switchTo;
    }
    
    
    protected void whenSelected(){
      setPage();
    }
    
      
    private void setPage() {
      currentPage = switchTo;
    }
  
}



public class SenderButton extends Button {
  
    SenderButton(PApplet parent, String label, String pathImage, int x, int y, int wdth) {
      super(parent, label, pathImage, x, y, wdth);
    }
    
    protected void whenSelected() {
      sendMessage();
    }
      
    private void sendMessage() {            //ToDo implement method to send message through UDP
      println(LABEL + ":" + selected);
    }
  
}



public class SenderSwitcherButton extends Button {
    
    int switchTo;
    
    SenderSwitcherButton(PApplet parent, String label, int switchTo, String pathImage, int x, int y, int wdth) {
      super(parent, label, pathImage, x, y, wdth);
      this.switchTo = switchTo;
    }
    
    
    protected void whenSelected() {
      setPage();
      sendMessage();
    }
    
      
    private void setPage() {               
      currentPage = switchTo;
    }
    
    
    private void sendMessage() {           //ToDo implement method to send message through UDP
      println(LABEL + ":" + selected);
    }
  
}
