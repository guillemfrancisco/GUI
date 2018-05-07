public class Page {
    
    final int ID;
    public ArrayList<GUIElement> elements = new ArrayList<GUIElement>();
    
    Page(int id) {
        ID = id;
    }
    
    public void addElement(GUIElement element) {
        elements.add(element);
    }
    
    public void draw(PGraphics canvas){
        for(GUIElement element : elements){
          element.draw(canvas);
        }
    }
    
}
