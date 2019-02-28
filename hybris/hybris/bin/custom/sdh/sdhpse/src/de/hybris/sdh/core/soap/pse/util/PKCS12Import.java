package de.hybris.sdh.core.soap.pse.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.security.Key;
import java.security.KeyStore;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Enumeration;

/**
 * This class can be used to import a key/certificate pair from a pkcs12 file
 * into a regular JKS format keystore for use with jetty and other java based
 * SSL applications, etc. 
 *<PRE>
 *    usage: java PKCS12Import {pkcs12file} [newjksfile]
 *</PRE>
 *
 * If you don't supply newjksfile, newstore.jks will be used.  This can be an
 * existing JKS keystore.
 * <P>
 * Upon execution, you will be prompted for the password for the pkcs12 keystore
 * as well as the password for the jdk file.  After execution you should have a
 * JKS keystore file that contains the private key and certificate that were in
 * the pkcs12
 * <P>
 * You can generate a pkcs12 file from PEM encoded certificate and key files
 * using the following openssl command:
 * <PRE>
 *    openssl pkcs12 -export -out keystore.pkcs12 -in www.crt -inkey www.key
 * </PRE>
 * then run:
 * <PRE>
 *    java PKCS12Import keystore.pkcs12 keytore.jks
 * </PRE>
 *
 * @author Jason Gilbert &lt;jason@doozer.com&gt;
 */
public class PKCS12Import
{
	public static void main(String[] args) throws Exception
	{
		if (args.length < 3)
		{
			System.err.println(
				"usage: java PKCS12Import {pkcs12file} {jkskeystorefile} {alias} [pkcs12file.password] [jkskeystorefile.password]");
			System.exit(1);
		}

		File fileIn = new File(args[0]);
		File fileOut = new File(args[1]);

		if (!fileIn.canRead())
		{
			System.err.println(
				"Unable to open certificate file: " + fileIn.getPath());
			System.exit(2);
		}

		if (fileOut.exists() && !fileOut.canWrite())
		{
			System.err.println(
				"Unable to open jks keystore file: " + fileOut.getPath());
			System.exit(2);
		}

		KeyStore kspkcs12 = KeyStore.getInstance("pkcs12");
		KeyStore ksjks = KeyStore.getInstance("jks");

		char[] inphrase;
		char[] outphrase;
		if (args.length > 3)
		{
			inphrase = args[3].toCharArray();
		}
		else
		{
			System.out.print("Enter certificate passphrase: ");
			inphrase = readPassphrase();
		}
		if (args.length > 4)
		{
			outphrase = args[4].toCharArray();
		}
		else
		{
			System.out.print("Enter keystore passphrase: ");
			outphrase = readPassphrase();
		}

		kspkcs12.load(new FileInputStream(fileIn), inphrase);

		ksjks.load(
			(fileOut.exists()) ? new FileInputStream(fileOut) : null,
			outphrase);

		Enumeration eAliases = kspkcs12.aliases();
		int n = 0;
		while (eAliases.hasMoreElements())
		{
			String strAlias = (String)eAliases.nextElement();
			System.err.println("Alias " + n++ +": " + strAlias);

			if (kspkcs12.isKeyEntry(strAlias))
			{
				System.err.println("Adding key for alias " + args[2]);
				Key key = kspkcs12.getKey(strAlias, inphrase);

				Certificate[] chain = kspkcs12.getCertificateChain(strAlias);

				ksjks.setKeyEntry(args[2], key, inphrase, chain);
			}
		}

		OutputStream out = new FileOutputStream(fileOut);
		ksjks.store(out, outphrase);
		out.close();
	}

	static void dumpChain(Certificate[] chain)
	{
		for (int i = 0; i < chain.length; i++)
		{
			Certificate cert = chain[i];
			if (cert instanceof X509Certificate)
			{
				X509Certificate x509 = (X509Certificate)chain[i];
				System.err.println("subject: " + x509.getSubjectDN());
				System.err.println("issuer: " + x509.getIssuerDN());
			}
		}
	}

	static char[] readPassphrase() throws IOException
	{
		InputStreamReader in = new InputStreamReader(System.in);

		char[] cbuf = new char[256];
		int i = 0;

		readchars : while (i < cbuf.length)
		{
			char c = (char)in.read();
			switch (c)
			{
				case '\r' :
					break readchars;
				case '\n' :
					break readchars;
				default :
					cbuf[i++] = c;
			}
		}

		char[] phrase = new char[i];
		System.arraycopy(cbuf, 0, phrase, 0, i);
		return phrase;
	}
}