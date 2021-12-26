
package commonutility;
import com.puja.customer.utils.Constants;
import java.sql.*;
public class CommonUtility 
{
    public static Connection getCon()
    {
        Connection con=null;
        try
        {
            con=DriverManager.getConnection("jdbc:mysql://localhost:"+Constants.DB_Port+"/"+Constants.DB_Name,Constants.DB_User,Constants.DB_Password);
        }
        catch(Exception ex)
        {
            System.out.println(ex.toString());
        }
        return con;
    }
}
