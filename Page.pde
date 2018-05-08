public class Page {
    
    protected final int ID;
    private boolean active;
    public ArrayList<GUIElement> elements = new ArrayList<GUIElement>();
    
    Page(int id) {
        ID = id;
    }
    
    
    public void addElement(GUIElement element) {
        elements.add(element);
    }
    
    
    public void draw() {
        for(GUIElement element : elements) {
          element.draw();
        }
    }
    
    
    public int countElements(){
        return elements.size(); 
    }
        
    
    public void click(int x, int y) {
      for(GUIElement e : elements) e.click(x, y);
    }
    
    
    public boolean isActive() {
      return active;
    } 
    
    
}
