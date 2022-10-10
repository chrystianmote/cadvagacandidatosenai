
package controle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Candidato;
import modelo.Vaga;
import util.BancoDados;

/**
 *
 * @author Chrystian
 */
public class CandidatoControle {
    
     public static Candidato BuscarPorID(long cod) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM candidato c WHERE c.id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, cod);
            final ResultSet rs = ps.executeQuery();

            Candidato c = new Candidato();
            if (rs.next()) {
                c.setId(rs.getLong("id"));
                c.setEmail(rs.getString("email"));                
                c.setNomeCandidato(rs.getString("nome_candidato"));
                c.setRg(rs.getString("nome"));
                Vaga v = new Vaga();
                v.setCodigo(rs.getLong("vaga_codigo"));
                c.setVaga(v);                
            }
            return c;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static boolean Cadastrar(Candidato c) {
        try {
            Connection conn = BancoDados.getConexao(); 
            String sql = "INSERT INTO candidato (`email`, `nome_candidato`, `rg`, `vaga_codigo`) VALUES (?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, c.getEmail());
            ps.setString(2, c.getNomeCandidato());
            ps.setString(3, c.getRg());
            ps.setLong(4, c.getVaga().getCodigo());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final int lastId = rs.getInt(1);
                    System.out.println("O id do Candidato é:"
                            + lastId);
                    return true;

                } else {
                    return false;
                }
            } else {
                return false;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static boolean Atualizar(Candidato c) {
        try {
            Connection conn = BancoDados.getConexao(); 
            String sql = "UPDATE candidato ";
            sql += " SET nome_candidato = ?, ";
            sql += " email = ?, ";
            sql += " rg = ? ";
            sql += " vaga_codigo = ? ";
            sql += " WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getNomeCandidato());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getRg());
            ps.setLong(4, c.getVaga().getCodigo());
            ps.setLong(5, c.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

    public static List<Candidato> ListarCandidatos() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM candidato; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Candidato> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Candidato c = new Candidato();
                c.setId(rs.getLong("id"));
                c.setEmail(rs.getString("email"));
                c.setNomeCandidato(rs.getString("nome_candidato"));
                c.setRg(rs.getString("rg"));
                
                Vaga v = new Vaga();
                v.setCodigo(rs.getLong("vaga_codigo"));
                c.setVaga(v);                    
                lista.add(c);
            }
            return lista;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public static List<Candidato> ListarCandidatosPorVaga(long cod) {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM candidato WHERE vaga_codigo = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
             ps.setLong(1, cod);
             
            List<Candidato> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Candidato c = new Candidato();
                c.setId(rs.getLong("id"));
                c.setEmail(rs.getString("email"));
                c.setNomeCandidato(rs.getString("nome_candidato"));
                c.setRg(rs.getString("rg"));
                
                Vaga v = new Vaga();
                v.setCodigo(rs.getLong("vaga_codigo"));
                c.setVaga(v);                    
                lista.add(c);
            }
            return lista;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static boolean Excluir(long cod) {
        try {
            Connection conn = BancoDados.getConexao(); 
            String sql = "DELETE FROM candidato WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, cod);
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("Apagou!!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
    
}
