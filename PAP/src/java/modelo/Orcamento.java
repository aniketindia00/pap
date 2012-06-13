package modelo;

import java.util.ArrayList;

public class Orcamento {
    private int id;
    private String data;
    private double valor;
    private Cliente cliente;
    private ArrayList<Produto> produtos;

    public Orcamento() {
    }

    public Orcamento(int id, String data, double valor, Cliente cliente, ArrayList<Produto> produtos) {
        this.id = id;
        this.data = data;
        this.valor = valor;
        this.cliente = cliente;
        this.produtos = produtos;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(ArrayList<Produto> produtos) {
        this.produtos = produtos;
    }
}
