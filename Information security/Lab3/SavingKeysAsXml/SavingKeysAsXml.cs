using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace SavingKeysAsXml
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class SavingKeysAsXml : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.GroupBox groupBox4;
		private System.Windows.Forms.TextBox textPlaintext;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.TextBox textCiphertext;
		private System.Windows.Forms.TextBox textRecoveredPlaintext;
		private System.Windows.Forms.Button buttonEncrypt;
		private System.Windows.Forms.GroupBox groupBox5;
		private System.Windows.Forms.TextBox textCipherbytes;
		private System.Windows.Forms.Button buttonDecrypt;
		private System.Windows.Forms.TextBox textBoxPublicKeyXML;
		private System.Windows.Forms.Button buttonNewRSAParams;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public SavingKeysAsXml()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.groupBox4 = new System.Windows.Forms.GroupBox();
			this.textPlaintext = new System.Windows.Forms.TextBox();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.textCiphertext = new System.Windows.Forms.TextBox();
			this.textBoxPublicKeyXML = new System.Windows.Forms.TextBox();
			this.textRecoveredPlaintext = new System.Windows.Forms.TextBox();
			this.buttonEncrypt = new System.Windows.Forms.Button();
			this.groupBox5 = new System.Windows.Forms.GroupBox();
			this.textCipherbytes = new System.Windows.Forms.TextBox();
			this.buttonDecrypt = new System.Windows.Forms.Button();
			this.buttonNewRSAParams = new System.Windows.Forms.Button();
			this.groupBox3.SuspendLayout();
			this.groupBox5.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox2
			// 
			this.groupBox2.Location = new System.Drawing.Point(8, 488);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(616, 48);
			this.groupBox2.TabIndex = 20;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Recovered Plaintext";
			// 
			// groupBox4
			// 
			this.groupBox4.Location = new System.Drawing.Point(8, 360);
			this.groupBox4.Name = "groupBox4";
			this.groupBox4.Size = new System.Drawing.Size(616, 88);
			this.groupBox4.TabIndex = 16;
			this.groupBox4.TabStop = false;
			this.groupBox4.Text = "Ciphertext Displayed as Byte Array";
			// 
			// textPlaintext
			// 
			this.textPlaintext.Location = new System.Drawing.Point(16, 240);
			this.textPlaintext.Multiline = true;
			this.textPlaintext.Name = "textPlaintext";
			this.textPlaintext.Size = new System.Drawing.Size(600, 24);
			this.textPlaintext.TabIndex = 10;
			this.textPlaintext.Text = "";
			// 
			// groupBox1
			// 
			this.groupBox1.Location = new System.Drawing.Point(8, 224);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(616, 48);
			this.groupBox1.TabIndex = 11;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Plaintext";
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.textCiphertext});
			this.groupBox3.Location = new System.Drawing.Point(8, 312);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(616, 48);
			this.groupBox3.TabIndex = 13;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Ciphertext Displayed as Text String";
			// 
			// textCiphertext
			// 
			this.textCiphertext.Location = new System.Drawing.Point(8, 16);
			this.textCiphertext.Multiline = true;
			this.textCiphertext.Name = "textCiphertext";
			this.textCiphertext.ReadOnly = true;
			this.textCiphertext.Size = new System.Drawing.Size(600, 24);
			this.textCiphertext.TabIndex = 14;
			this.textCiphertext.Text = "";
			// 
			// textBoxPublicKeyXML
			// 
			this.textBoxPublicKeyXML.Location = new System.Drawing.Point(8, 24);
			this.textBoxPublicKeyXML.Multiline = true;
			this.textBoxPublicKeyXML.Name = "textBoxPublicKeyXML";
			this.textBoxPublicKeyXML.ReadOnly = true;
			this.textBoxPublicKeyXML.Size = new System.Drawing.Size(600, 144);
			this.textBoxPublicKeyXML.TabIndex = 4;
			this.textBoxPublicKeyXML.Text = "";
			// 
			// textRecoveredPlaintext
			// 
			this.textRecoveredPlaintext.Location = new System.Drawing.Point(24, 504);
			this.textRecoveredPlaintext.Multiline = true;
			this.textRecoveredPlaintext.Name = "textRecoveredPlaintext";
			this.textRecoveredPlaintext.ReadOnly = true;
			this.textRecoveredPlaintext.Size = new System.Drawing.Size(592, 24);
			this.textRecoveredPlaintext.TabIndex = 19;
			this.textRecoveredPlaintext.Text = "";
			// 
			// buttonEncrypt
			// 
			this.buttonEncrypt.Location = new System.Drawing.Point(8, 280);
			this.buttonEncrypt.Name = "buttonEncrypt";
			this.buttonEncrypt.TabIndex = 12;
			this.buttonEncrypt.Text = "Encrypt";
			this.buttonEncrypt.Click += new System.EventHandler(this.buttonEncrypt_Click);
			// 
			// groupBox5
			// 
			this.groupBox5.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.textBoxPublicKeyXML});
			this.groupBox5.Location = new System.Drawing.Point(8, 40);
			this.groupBox5.Name = "groupBox5";
			this.groupBox5.Size = new System.Drawing.Size(616, 176);
			this.groupBox5.TabIndex = 17;
			this.groupBox5.TabStop = false;
			this.groupBox5.Text = "RSA Parameters";
			// 
			// textCipherbytes
			// 
			this.textCipherbytes.Font = new System.Drawing.Font("Courier New", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.textCipherbytes.Location = new System.Drawing.Point(16, 384);
			this.textCipherbytes.Multiline = true;
			this.textCipherbytes.Name = "textCipherbytes";
			this.textCipherbytes.ReadOnly = true;
			this.textCipherbytes.Size = new System.Drawing.Size(600, 56);
			this.textCipherbytes.TabIndex = 15;
			this.textCipherbytes.Text = "";
			// 
			// buttonDecrypt
			// 
			this.buttonDecrypt.Enabled = false;
			this.buttonDecrypt.Location = new System.Drawing.Point(8, 456);
			this.buttonDecrypt.Name = "buttonDecrypt";
			this.buttonDecrypt.TabIndex = 18;
			this.buttonDecrypt.Text = "Decrypt";
			this.buttonDecrypt.Click += new System.EventHandler(this.buttonDecrypt_Click);
			// 
			// buttonNewRSAParams
			// 
			this.buttonNewRSAParams.Location = new System.Drawing.Point(8, 8);
			this.buttonNewRSAParams.Name = "buttonNewRSAParams";
			this.buttonNewRSAParams.Size = new System.Drawing.Size(136, 23);
			this.buttonNewRSAParams.TabIndex = 21;
			this.buttonNewRSAParams.Text = "New RSA Parameters";
			this.buttonNewRSAParams.Click += new System.EventHandler(this.buttonNewRSAParams_Click);
			// 
			// SavingKeysAsXml
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(632, 541);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.buttonNewRSAParams,
																		  this.textPlaintext,
																		  this.buttonDecrypt,
																		  this.groupBox5,
																		  this.buttonEncrypt,
																		  this.textRecoveredPlaintext,
																		  this.groupBox2,
																		  this.groupBox3,
																		  this.textCipherbytes,
																		  this.groupBox1,
																		  this.groupBox4});
			this.Name = "SavingKeysAsXml";
			this.Text = "SavingKeysAsXml";
			this.Load += new System.EventHandler(this.SavingKeysAsXml_Load);
			this.groupBox3.ResumeLayout(false);
			this.groupBox5.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new SavingKeysAsXml());
		}

		private void SavingKeysAsXml_Load(object sender, System.EventArgs e)
		{
			GenerateNewRSAParams();
		}

		private void buttonNewRSAParams_Click(object sender, System.EventArgs e)
		{
			GenerateNewRSAParams();
		}

		private void GenerateNewRSAParams()
		{
			//establish RSA asymmetric algorithm
			RSACryptoServiceProvider rsa = 
				new RSACryptoServiceProvider();

			//provide public and private RSA params
			StreamWriter writer = 
				new StreamWriter("PublicPrivateKey.xml");
			string publicPrivateKeyXML = 
				rsa.ToXmlString(true);
			writer.Write(publicPrivateKeyXML);
			writer.Close();

			//provide public only RSA params
			writer = 
				new StreamWriter("PublicOnlyKey.xml");
			string publicOnlyKeyXML = 
				rsa.ToXmlString(false);
			writer.Write(publicOnlyKeyXML);
			writer.Close();

			//display public and private RSA key
			textBoxPublicKeyXML.Text = publicPrivateKeyXML;

			//do UI stuff
			buttonEncrypt.Enabled = true;
		}

		private void buttonEncrypt_Click(
			object sender, System.EventArgs e)
		{
			//do UI stuff
			ClearOutputFields();

			//establish RSA asymmetric algorithm
			RSACryptoServiceProvider rsa = 
				new RSACryptoServiceProvider();

			//public only RSA parameters for encrypt
			StreamReader reader = 
				new StreamReader("PublicOnlyKey.xml");
			string publicOnlyKeyXML = reader.ReadToEnd();
			rsa.FromXmlString(publicOnlyKeyXML);
			reader.Close();

			//read plaintext, encrypt it to ciphertext
			byte[] plainbytes = 
				Encoding.UTF8.GetBytes(textPlaintext.Text);
			cipherbytes = 
				rsa.Encrypt(
				plainbytes, 
				false); //fOAEP needs high encryption pack

			//display ciphertext as text string
			textCiphertext.Text = 
				Encoding.UTF8.GetString(cipherbytes);

			//display ciphertext byte array in hex format
			StringBuilder sb = new StringBuilder();
			for (int i=0; i<cipherbytes.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", cipherbytes[i]));
			}
			textCipherbytes.Text = sb.ToString();

			//do UI stuff
			buttonNewRSAParams.Enabled = false;
			buttonEncrypt.Enabled = false;
			buttonDecrypt.Enabled = true;
			textPlaintext.Enabled = false;
			buttonDecrypt.Select();
		}

		private void buttonDecrypt_Click(
			object sender, System.EventArgs e)
		{
			//establish RSA using key XML from encrypt
			RSACryptoServiceProvider rsa = 
				new RSACryptoServiceProvider();

			//public and privateRSA parameters for encrypt
			StreamReader reader = 
				new StreamReader("PublicPrivateKey.xml");
			string publicPrivateKeyXML = reader.ReadToEnd();
			rsa.FromXmlString(publicPrivateKeyXML);
			reader.Close();

			//read ciphertext, decrypt it to plaintext
			byte[] plainbytes = 
				rsa.Decrypt(
				cipherbytes, 
				false); //fOAEP needs high encryption pack

			//display recovered plaintext
			textRecoveredPlaintext.Text = 
				Encoding.UTF8.GetString(plainbytes);

			//do UI stuff
			buttonNewRSAParams.Enabled = true;
			buttonDecrypt.Enabled = false;
			buttonEncrypt.Enabled = true;
			textPlaintext.Enabled = true;
			buttonEncrypt.Select();
		}

		private void ClearOutputFields()
		{
			textCiphertext.Text = "";
			textCipherbytes.Text = "";
			textRecoveredPlaintext.Text = "";
		}

		//variable communicated from encrypt to decrypt
		byte[] cipherbytes;
	}
}
