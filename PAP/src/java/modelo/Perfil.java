package modelo;

import java.util.ArrayList;

public class Perfil {
    private int id;
    private String perfil;
    private ArrayList<Menu> menus;


    public Perfil() {
    }

    public Perfil(int id, String perfil) {
        this.id = id;
        this.perfil = perfil;
    }

    

    public Perfil(int id, String perfil, ArrayList<Menu> menus) {
        this.id = id;
        this.perfil = perfil;
        this.menus = menus;
    }



    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public ArrayList<Menu> getMenus() {
        return menus;
    }

    public void setMenus(ArrayList<Menu> menus) {
        this.menus = menus;
    }
    
}
