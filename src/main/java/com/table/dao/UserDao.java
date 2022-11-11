
package com.table.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.table.entities.User;
import com.table.helper.ConnectionProvider;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
    public boolean saveUser(User user){
        boolean f=false;
        try{
            //user-->database
            String query="INSERT INTO user(name,email,password,gender) VALUES (?,?,?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="SELECT* FROM user WHERE email =? and password =?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
           // System.out.println(email+" "+password);
            if(rs.next())
            {
                user=new User();
                //data from db
                String name=rs.getString("name");
                
                //set to user object
                user.setName(name);
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
        System.out.println(user);
         return user;
        
    }
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        try{
            String query="update user set name =? , email =? , password =?, gender =?,where id=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setInt(5, user.getId());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean createNewTable( String tableName, List<String> newTableColumns,String email) {
    
    //ArrayList to string separated by comma
    
    String tColumNames = String.join(",",newTableColumns );
     boolean f=false;
        try{
            Statement stmt = ConnectionProvider.getStatement();
            String query = "CREATE TABLE "+tableName+"( "+tColumNames+";";
            System.out.println("query : "+query);
            stmt.execute(query);
            String q="INSERT INTO userInfo(email,tablename) VALUES (?,?)";
            PreparedStatement pstmt= this.con.prepareStatement(q);
            
            pstmt.setString(1, email);
            pstmt.setString(2, tableName);
            
            System.out.println(q);
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f; 
}
    public ArrayList<String> getFields(String tableName)
    {
        ArrayList<String> tfields=new ArrayList<String>();
        try{
        Statement st = ConnectionProvider.getStatement();
        ResultSet rs = st.executeQuery("desc "+tableName);
            
            while(rs.next())
            {
                tfields.add(rs.getString(1));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return tfields;
    }
    public ArrayList<String> getTables(String email)
    {
        ArrayList<String> tNames=new ArrayList<String>();
        try{
        Statement st = ConnectionProvider.getStatement();
        ResultSet rs = st.executeQuery("Select tablename from userInfo where email ="+email);
            
            while(rs.next())
            {
                tNames.add(rs.getString(1));
                System.out.println(rs.getString(1));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return tNames;
    }
    public ArrayList<String> getFieldTypes(String tableName)
    {
        ArrayList<String> tType=new ArrayList<String>();
        try{
        Statement st = ConnectionProvider.getStatement();
        ResultSet rs = st.executeQuery("desc "+tableName);
            
            while(rs.next())
            {
                tType.add(rs.getString(2));
                System.out.println(rs.getString(2));
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return tType;
    }
    public boolean deleteData(String pkvalue,String pkfield,String tableName){
        
        boolean f=false;
        try{
            
            String query="DELETE FROM "+tableName+" WHERE "+pkfield+"='"+pkvalue+"'";
//                    String query="DELETE FROM tmp WHERE email ='amss@gmail.com'";
            System.out.println(query);
            Statement st= ConnectionProvider.getStatement();
            st.executeUpdate(query);
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean insertData(ArrayList<String> tdata,String tableName){
        
        boolean f=false;
        try{
            
            
            
            
            String q="";
            int c=0;
            for(String s:tdata)
            {
                
                q+="'"+s+"'";
                c++;
                if(c==tdata.size())q+=")";
                else q+=",";
            }
            System.out.println("q = "+q);
            String query="INSERT INTO "+tableName+" VALUES("+q;
            System.out.println(query);
            Statement st= ConnectionProvider.getStatement();
            st.executeUpdate(query);
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
