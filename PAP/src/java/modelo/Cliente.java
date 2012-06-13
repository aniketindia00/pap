package modelo;

import java.util.ArrayList;

public class Cliente extends Pessoa{

    private int id;
    private ArrayList<Carro> carros;
    
    public Cliente() {
    }

    public Cliente(int id, ArrayList<Carro> carros, String nome, String telefone) {
        super(nome, telefone);
        this.id = id;
        this.carros = carros;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<Carro> getCarros() {
        return carros;
    }

    public void setCarros(ArrayList<Carro> carros) {
        this.carros = carros;
    }

    
}
