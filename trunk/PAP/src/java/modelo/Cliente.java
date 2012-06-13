package modelo;

public class Cliente extends Pessoa{

    private int id;

    public Cliente() {
    }

    public Cliente(int id, String nome, String telefone) {
        super(nome,telefone);
        this.id = id;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
}
