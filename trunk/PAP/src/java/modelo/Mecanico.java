package modelo;

/**
 *
 * @author DaviDBL
 */
public class Mecanico extends Pessoa{
    private String cpf;
    private String oficina;

    public Mecanico() {
    }

    public Mecanico( String cpf, String oficina,String nome, String telefone) {
        super(nome,telefone);
        this.cpf = cpf;
        this.oficina = oficina;
    }



    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getOficina() {
        return oficina;
    }

    public void setOficina(String oficina) {
        this.oficina = oficina;
    }
}
