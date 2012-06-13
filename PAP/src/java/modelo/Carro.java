package modelo;

public class Carro {
    private int id;
    private String modelo;
    private String ano;
    private String marca;
    private int id_cliente;
    private Cliente cliente;

    public Carro() {
    }

    public Carro(int id, String modelo, String ano, String marca, int id_cliente, Cliente cliente) {
        this.id = id;
        this.modelo = modelo;
        this.ano = ano;
        this.marca = marca;
        this.id_cliente = id_cliente;
        this.cliente = cliente;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
