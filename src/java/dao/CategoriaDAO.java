/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import apoio.ConexaoBD;
import entidade.Categoria;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author pretto
 */
public class CategoriaDAO {

    public boolean salvar(Categoria c) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "insert into categoria values ("
                    + "default,"
                    + "'" + c.getDescricao() + "'"
                    + ")";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao salvar Categoria: " + e);
            return false;
        }
    }

    public ArrayList consultar() {
        ArrayList<Categoria> categorias = new ArrayList<>();

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "select * from categoria";

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                Categoria c = new Categoria();

                c.setCodigo(resultado.getInt("id"));
                c.setDescricao(resultado.getString("descricao"));

                categorias.add(c);
            }

        } catch (Exception e) {
            System.out.println("Erro ao consular Categoria: " + e);
        }

        return categorias;
    }

    public Categoria consultar(int codigo) {
        Categoria categoria = new Categoria();

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "select * from categoria "
                    + "where "
                    + "id = " + codigo;

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            resultado.next();
            
            categoria.setCodigo(resultado.getInt("id"));
            categoria.setDescricao(resultado.getString("descricao"));

        } catch (Exception e) {
            System.out.println("Erro ao consular UMA Categoria: " + e);
        }

        return categoria;
    }

    public boolean excluir(int codigo) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "delete from categoria "
                    + "where "
                    + "id = " + codigo;

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao excluir Categoria: " + e);
            return false;
        }
    }

    public boolean atualizar(Categoria c) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "update categoria "
                    + "set "
                    + "descricao = '" + c.getDescricao() + "' "
                    + "where id = " + c.getCodigo();

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao atualizar Categoria: " + e);
            return false;
        }
    }
}
