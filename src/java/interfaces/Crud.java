
package interfaces;

import java.util.List;
import modelo.persona;

public interface Crud {
    
    public List listar();
    public persona list(int id);
    public boolean add(persona per);
    public boolean edit(persona per);
    public boolean eliminar(int id);
}
