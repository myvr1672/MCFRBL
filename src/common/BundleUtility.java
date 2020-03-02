package common;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
public class BundleUtility {
	 public BundleUtility()
	    {
	    }

	    public static String getValue(String filename, String key)
	        throws Exception
	    {
	        String s = "";
	        try
	        {
	            ResourceBundle rb = ResourceBundle.getBundle(filename);
	            s = rb.getString(key);
	        }
	        catch(MissingResourceException e)
	        {
	            s = "";
	            throw new Exception(e);
	        }
	        return s;
	    }
}
