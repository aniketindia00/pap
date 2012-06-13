package modelo;

public class Carro {
    private int id;
    private String modelo;
    private String ano;
    private String marca;
    private int idCliente;
    private Cliente cliente;

    public Carro() {
    }

    public Carro(int id, String modelo, String ano, String marca, int idCliente, Cliente cliente) {
        this.id = id;
        this.modelo = modelo;
        this.ano = ano;
        this.marca = marca;
        this.idCliente = idCliente;
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

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
