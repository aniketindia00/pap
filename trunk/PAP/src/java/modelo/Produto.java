package modelo;

/**
 *
 * @author DaviDBL
 */
public class Produto {
    private int id;
    private String nome;
    private String cod_barras;
    private double preco;

    public Produto() {
    }

    public Produto(int id, String nome, String cod_barras, double preco) {
        this.id = id;
        this.nome = nome;
        this.cod_barras = cod_barras;
        this.preco = preco;
    }



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

    public String getCod_barras() {
        return cod_barras;
    }

    public void setCod_barras(String cod_barras) {
        this.cod_barras = cod_barras;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
}
