package modelo;
public class Usuario extends Pessoa{
    private int id;
    private int id_perfil;
    private Perfil perfil;
    private String login;
    private String senha;

    public Usuario() {
    }

    public Usuario(int id, int id_perfil, Perfil perfil, String login, String senha, String nome, String telefone) {
        super(nome,telefone);
        this.id = id;
        this.id_perfil = id_perfil;
        this.perfil = perfil;
        this.login = login;
        this.senha = senha;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPerfil() {
        return id_perfil;
    }

    public void setIdPerfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    
}
