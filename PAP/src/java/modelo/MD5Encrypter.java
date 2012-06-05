/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encrypter {
    
    String senha ="";

    public String encryptMD5(String pass) {
        try  {
         MessageDigest md = MessageDigest.getInstance( "MD5" );

         md.update( pass.getBytes() );
         BigInteger hash = new BigInteger( 1, md.digest() );
         senha = hash.toString( 16 );
      }

      catch(NoSuchAlgorithmException ns)  {
         ns.printStackTrace();
      }
        return senha;
    }
    
}
