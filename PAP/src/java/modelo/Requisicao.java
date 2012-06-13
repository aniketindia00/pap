package modelo;

import java.util.ArrayList;

/**
 *
 * @author DaviDBL
 */
public class Requisicao {
    private int id;
    private String data;
    private double valor;
    private String cpfMecanico;
    private Mecanico mecanico;
    private ArrayList<Produto> produtos;

    public Requisicao() {
    }

    public Requisicao(int id, String data, double valor, Mecanico mecanico, ArrayList<Produto> produtos) {
        this.id = id;
        this.data = data;
        this.valor = valor;
        this.mecanico = mecanico;
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

    public Mecanico getMecanico() {
        return mecanico;
    }

    public void setMecanico(Mecanico mecanico) {
        this.mecanico = mecanico;
    }

    public ArrayList<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(ArrayList<Produto> produtos) {
        this.produtos = produtos;
    }

    public String getCpfMecanico() {
        return cpfMecanico;
    }

    public void setCpfMecanico(String cpfMecanico) {
        this.cpfMecanico = cpfMecanico;
    }

    
}
