public abstract class Button implements GUIElement{
    
    //private final PApplet PARENT;
    protected final Page PAGE;
    protected final String LABEL; 
    private final int X, Y, WDTH;
    private final PShape SHP;
    protected boolean selected = false;
   
    public Button(PApplet parent, Page page, String label, String pathImage, int x, int y, int wdth) {
      //PARENT = parent;
      //parent.registerMethod("mouseEvent", this);
      PAGE = page;
      page.addElement(this);
      
      LABEL = label;
      X = x;
      Y = y;
      WDTH = wdth;
      
      SHP = loadShape(pathImage);
    }
    
   
    public void draw() {
      shapeMode(CENTER);
      if(!selected){
        SHP.disableStyle();
        fill(#FF0000);
        stroke(#FF0000);
        shape(SHP, X, Y, WDTH, WDTH);
      }else if(selected){
        SHP.enableStyle();
        shape(SHP, X, Y, WDTH, WDTH);
      }
      
    }
    
    public void click(int x, int y) {
         println("in");
         if(PAGE.isActive() && mouseX > (X-SHP.width/2) && mouseX < (X+SHP.width/2) && mouseY > (Y-SHP.height/2) && mouseY < (Y+SHP.height/2)){
           selected = true;
           whenSelected();
         } else {
           selected = false;
         }
    }
    /*
    public void mouseEvent(MouseEvent e) {
          switch(e.getAction()) {
              case MouseEvent.PRESS:
                  if(PAGE.isActive() && mouseX > (X-SHP.width/2) && mouseX < (X+SHP.width/2) && mouseY > (Y-SHP.height/2) && mouseY < (Y+SHP.height/2)){
                     selected = true;
                     whenSelected();
                  }else{
                     selected = false;
                  }
                  break;
          }
    }
    */
    
    public boolean isSelected(){
        return selected;
    }
    
    
    public void unselect(){
        selected = false;
    }
    
    protected abstract void whenSelected();
    
}



public class SwitcherButton extends Button{
    
    int switchTo;
    
    SwitcherButton(PApplet parent, Page page, String label, int switchTo, String pathImage, int x, int y, int wdth){
      super(parent, page, label, pathImage, x, y, wdth);
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
  
    SenderButton(PApplet parent, Page page, String label, String pathImage, int x, int y, int wdth) {
      super(parent, page, label, pathImage, x, y, wdth);
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
    
    SenderSwitcherButton(PApplet parent, Page page, String label, int switchTo, String pathImage, int x, int y, int wdth) {
      super(parent, page, label, pathImage, x, y, wdth);
      this.switchTo = switchTo;
    }
    
    
    public boolean isSelected(){
        return selected;
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
