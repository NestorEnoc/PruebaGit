
package modeloDao;

import confi.conexion;
import interfaces.Crud;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.sql.Connection;
import java.util.ArrayList;
import modelo.persona;

public class personaDao implements Crud{

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    persona p = new persona();
    @Override
    public List listar() {
            
        ArrayList<persona>List = new ArrayList<>();
        String sql="select * from persona";
        try{
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                persona per = new persona();
                per.setId(rs.getInt("Id"));
                per.setDni(rs.getString("Dni"));
                per.setNom(rs.getString("Nombres"));
                List.add(per);
            }
        }catch(Exception e){
            
        }
        return List;
    }

    @Override
    public persona list(int id) {
        String sql="select * from persona where Id="+id;
        try{
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                persona per = new persona();
                p.setId(rs.getInt("Id"));
                p.setDni(rs.getString("Dni"));
                p.setNom(rs.getString("Nombres"));
            }
        }catch(Exception e){
            
        }
        return p;
    }
    @Override
    public boolean add(persona per) {
        String sql="insert into persona(Dni, Nombres)values('"+per.getDni()+"','"+per.getNom()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(persona per) {
        String sql="update persona set Dni='"+per.getDni()+"',Nombres='"+per.getNom()+"'where Id="+per.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="delete from persona where Id="+id;  
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
