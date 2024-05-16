package sv.edu.udb.www.desafio03_productos.model;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import sv.edu.udb.www.desafio03_productos.entities.ProductosEntity;

public class ProductosModel {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public int insertarProducto(ProductosEntity producto) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.persist(producto);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
    }

    public List<ProductosEntity> listarProductos(){
        SessionFactory sesFac = HibernateUtil.getSessionFactory();
        Session ses = sesFac.openSession();
        ArrayList<ProductosEntity> listaProductos = new ArrayList<ProductosEntity>();
        String sql = "from ProductosEntity ";
        listaProductos = (ArrayList<ProductosEntity>) ses.createQuery(sql).list();
        return listaProductos;
    }

    public ProductosEntity obtenerProducto(String codigo) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ProductosEntity producto = (ProductosEntity) ses.find(ProductosEntity.class, codigo);
            tran.commit();
            return producto;
        } catch(Exception e){
            e.printStackTrace();
            return null;
        } finally {
            ses.close();
        }
    }

    public int modificarProducto(ProductosEntity producto) {
        Session ses = factory.openSession();
        try {
            Transaction tran = ses.beginTransaction();
            ses.update(producto);
            tran.commit();
            ses.close();
            return 1;
        } catch (Exception e) {
            ses.close();
            return 0;
        }
    }

    public int eliminarProducto(String codigo) {
        int filasAfectadas = 0;
        Session ses = factory.openSession();
        try {
            ProductosEntity producto = (ProductosEntity) ses.find(ProductosEntity.class, codigo);
            if (producto != null) {
                Transaction tran = ses.beginTransaction();
                ses.delete(producto);
                tran.commit();
                filasAfectadas = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ses.close();
        }
        return filasAfectadas;
    }

    // Método para buscar productos por nombre
    public List<ProductosEntity> buscarProductosPorNombre(String nombre) {
        try (Session ses = factory.openSession()) {
            String hql = "FROM ProductosEntity WHERE nombreProducto LIKE :nombre";
            Query<ProductosEntity> query = ses.createQuery(hql, ProductosEntity.class);
            query.setParameter("nombre", "%" + nombre + "%");
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
