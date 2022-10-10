
package controle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Vaga;
import util.BancoDados;

/**
 *
 * @author Chrystian
 */
public class VagaControle {
    
     public static Vaga BuscarPorID(long cod) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT v.codigo, v.data, v.descricao,v.nome, v.salario FROM vaga v WHERE v.codigo = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, cod);
            final ResultSet rs = ps.executeQuery();

            Vaga vg = new Vaga();
            if (rs.next()) {
                vg.setCodigo(rs.getLong("codigo"));
                vg.setData(rs.getDate("data"));                
                vg.setDescricao(rs.getString("descricao"));
                vg.setNome(rs.getString("nome"));
                vg.setSalario(rs.getDouble("salario"));                
            }
            return vg;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static boolean Cadastrar(Vaga vg) {
        try {
            Connection conn = BancoDados.getConexao(); 
            String sql = "INSERT INTO vaga (`data`, `descricao`, `nome`, `salario`) VALUES (?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, vg.getData());
            ps.setString(2, vg.getDescricao());
            ps.setString(3, vg.getNome());
            ps.setDouble(4, vg.getSalario());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final int lastId = rs.getInt(1);
                    System.out.println("O numero do codigo é:"
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

    public static boolean Atualizar(Vaga vg) {
        try {
            Connection conn = BancoDados.getConexao(); 
            String sql = "UPDATE vaga ";
            sql += " SET nome = ?, ";
            sql += " descricao = ?, ";
            sql += " data = ? ";
            sql += " salario = ? ";
            sql += " WHERE codigo = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, vg.getNome());
            ps.setString(2, vg.getDescricao());
            ps.setDate(3, vg.getData());
            ps.setDouble(4, vg.getSalario());
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

    public static List<Vaga> ListarVagas() {
        try {

            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM vaga; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Vaga> lista = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Vaga vg = new Vaga();
                vg.setCodigo(rs.getLong("codigo"));
                vg.setNome(rs.getString("nome"));
                vg.setDescricao(rs.getString("descricao"));
                vg.setData(rs.getDate("data"));
                vg.setSalario(rs.getDouble("salario"));
                lista.add(vg);
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
            String sql = "DELETE FROM vaga WHERE codigo = ?; ";
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
