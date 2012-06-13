package modelo;

import java.util.ArrayList;

/**
 *
 * @author DaviDBL
 */
public class Requisicao {
    private int id;
    private String dataEmissao;
    private String horaEmissao;
    private double valor;
    private String cpfMecanico;
    private Mecanico mecanico;
    private ArrayList<Produto> produtos;

    public Requisicao() {
    }

    public Requisicao(int id, String dataEmissao, String horaEmissao, double valor, Mecanico mecanico, ArrayList<Produto> produtos) {
        this.id = id;
        this.dataEmissao = dataEmissao;
        this.horaEmissao = horaEmissao;
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

    public String getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(String dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public String getHoraEmissao() {
        return horaEmissao;
    }

    public void setHoraEmissao(String horaEmissao) {
        this.horaEmissao = horaEmissao;
    }



    
}
