/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

/**
 *
 * @author Daniel
 */
public class Produto {
    private int id;
    private String nome;
    private String codBarras;
    private double preco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodBarras() {
        return codBarras;
    }

    public void setCodBarras(String codBarras) {
        this.codBarras = codBarras;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Produto() {
    }

    public Produto(int id, String nome, String codBarras, double preco) {
        this.id = id;
        this.nome = nome;
        this.codBarras = codBarras;
        this.preco = preco;
    }

    

}
