using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace DSAAlgorithm
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class DSAAlgorithm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.GroupBox groupBox4;
		private System.Windows.Forms.GroupBox groupBox5;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox textOriginalMessage;
		private System.Windows.Forms.TextBox textMessageDigestSHA1;
		private System.Windows.Forms.TextBox textSignature;
		private System.Windows.Forms.TextBox textBoxP;
		private System.Windows.Forms.TextBox textBoxQ;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox textBoxY;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.TextBox textBoxG;
		private System.Windows.Forms.Button buttonVerify;
		private System.Windows.Forms.Button buttonSign;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DSAAlgorithm()
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
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.textOriginalMessage = new System.Windows.Forms.TextBox();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.buttonVerify = new System.Windows.Forms.Button();
			this.textSignature = new System.Windows.Forms.TextBox();
			this.groupBox4 = new System.Windows.Forms.GroupBox();
			this.textMessageDigestSHA1 = new System.Windows.Forms.TextBox();
			this.buttonSign = new System.Windows.Forms.Button();
			this.groupBox5 = new System.Windows.Forms.GroupBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.textBoxQ = new System.Windows.Forms.TextBox();
			this.textBoxP = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.textBoxY = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.textBoxG = new System.Windows.Forms.TextBox();
			this.groupBox5.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.Location = new System.Drawing.Point(96, 0);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(528, 48);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Original Message to be Signed";
			// 
			// textOriginalMessage
			// 
			this.textOriginalMessage.Location = new System.Drawing.Point(104, 16);
			this.textOriginalMessage.Multiline = true;
			this.textOriginalMessage.Name = "textOriginalMessage";
			this.textOriginalMessage.Size = new System.Drawing.Size(512, 24);
			this.textOriginalMessage.TabIndex = 0;
			this.textOriginalMessage.Text = "";
			// 
			// groupBox3
			// 
			this.groupBox3.Location = new System.Drawing.Point(96, 48);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(528, 48);
			this.groupBox3.TabIndex = 2;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "SHA1 Hash Bytes of Original Message (Message Digest)";
			// 
			// buttonVerify
			// 
			this.buttonVerify.Enabled = false;
			this.buttonVerify.Location = new System.Drawing.Point(104, 408);
			this.buttonVerify.Name = "buttonVerify";
			this.buttonVerify.Size = new System.Drawing.Size(424, 40);
			this.buttonVerify.TabIndex = 8;
			this.buttonVerify.Text = "Verify (hint: try changing original message first)";
			this.buttonVerify.Click += new System.EventHandler(this.buttonVerify_Click);
			// 
			// textSignature
			// 
			this.textSignature.Font = new System.Drawing.Font("Courier New", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
			this.textSignature.Location = new System.Drawing.Point(104, 120);
			this.textSignature.Multiline = true;
			this.textSignature.Name = "textSignature";
			this.textSignature.ReadOnly = true;
			this.textSignature.Size = new System.Drawing.Size(512, 24);
			this.textSignature.TabIndex = 3;
			this.textSignature.Text = "";
			// 
			// groupBox4
			// 
			this.groupBox4.Location = new System.Drawing.Point(96, 96);
			this.groupBox4.Name = "groupBox4";
			this.groupBox4.Size = new System.Drawing.Size(528, 56);
			this.groupBox4.TabIndex = 3;
			this.groupBox4.TabStop = false;
			this.groupBox4.Text = "Digital Signature (Encrypted Message Digest)";
			// 
			// textMessageDigestSHA1
			// 
			this.textMessageDigestSHA1.Location = new System.Drawing.Point(104, 64);
			this.textMessageDigestSHA1.Multiline = true;
			this.textMessageDigestSHA1.Name = "textMessageDigestSHA1";
			this.textMessageDigestSHA1.ReadOnly = true;
			this.textMessageDigestSHA1.Size = new System.Drawing.Size(512, 24);
			this.textMessageDigestSHA1.TabIndex = 2;
			this.textMessageDigestSHA1.Text = "";
			// 
			// buttonSign
			// 
			this.buttonSign.Location = new System.Drawing.Point(8, 64);
			this.buttonSign.Name = "buttonSign";
			this.buttonSign.Size = new System.Drawing.Size(75, 40);
			this.buttonSign.TabIndex = 1;
			this.buttonSign.Text = "Sign";
			this.buttonSign.Click += new System.EventHandler(this.buttonSign_Click);
			// 
			// groupBox5
			// 
			this.groupBox5.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.label1,
																					this.label2,
																					this.textBoxQ,
																					this.textBoxP,
																					this.label3,
																					this.textBoxY,
																					this.label4,
																					this.textBoxG});
			this.groupBox5.Location = new System.Drawing.Point(8, 160);
			this.groupBox5.Name = "groupBox5";
			this.groupBox5.Size = new System.Drawing.Size(616, 240);
			this.groupBox5.TabIndex = 4;
			this.groupBox5.TabStop = false;
			this.groupBox5.Text = "DSA Parameters";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(16, 16);
			this.label1.TabIndex = 0;
			this.label1.Text = "P";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 72);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(16, 16);
			this.label2.TabIndex = 0;
			this.label2.Text = "Q";
			// 
			// textBoxQ
			// 
			this.textBoxQ.Location = new System.Drawing.Point(24, 72);
			this.textBoxQ.Multiline = true;
			this.textBoxQ.Name = "textBoxQ";
			this.textBoxQ.ReadOnly = true;
			this.textBoxQ.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.textBoxQ.Size = new System.Drawing.Size(584, 48);
			this.textBoxQ.TabIndex = 5;
			this.textBoxQ.Text = "";
			// 
			// textBoxP
			// 
			this.textBoxP.Location = new System.Drawing.Point(24, 16);
			this.textBoxP.Multiline = true;
			this.textBoxP.Name = "textBoxP";
			this.textBoxP.ReadOnly = true;
			this.textBoxP.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.textBoxP.Size = new System.Drawing.Size(584, 48);
			this.textBoxP.TabIndex = 4;
			this.textBoxP.Text = "";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(8, 128);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(16, 16);
			this.label3.TabIndex = 0;
			this.label3.Text = "Y";
			// 
			// textBoxY
			// 
			this.textBoxY.Location = new System.Drawing.Point(24, 128);
			this.textBoxY.Multiline = true;
			this.textBoxY.Name = "textBoxY";
			this.textBoxY.ReadOnly = true;
			this.textBoxY.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.textBoxY.Size = new System.Drawing.Size(584, 48);
			this.textBoxY.TabIndex = 6;
			this.textBoxY.Text = "";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(8, 184);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(16, 16);
			this.label4.TabIndex = 0;
			this.label4.Text = "G";
			// 
			// textBoxG
			// 
			this.textBoxG.Location = new System.Drawing.Point(24, 184);
			this.textBoxG.Multiline = true;
			this.textBoxG.Name = "textBoxG";
			this.textBoxG.ReadOnly = true;
			this.textBoxG.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.textBoxG.Size = new System.Drawing.Size(584, 48);
			this.textBoxG.TabIndex = 7;
			this.textBoxG.Text = "";
			// 
			// DSAAlgorithm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(632, 453);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.textOriginalMessage,
																		  this.buttonVerify,
																		  this.textSignature,
																		  this.groupBox4,
																		  this.textMessageDigestSHA1,
																		  this.buttonSign,
																		  this.groupBox5,
																		  this.groupBox1,
																		  this.groupBox3});
			this.Name = "DSAAlgorithm";
			this.Text = "DSAAlgorithm";
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
			Application.Run(new DSAAlgorithm());
		}

		private void buttonSign_Click(
			object sender, System.EventArgs e)
		{
			//get original message as byte array
			byte[] messagebytes = Encoding.UTF8.GetBytes(
				textOriginalMessage.Text);

			//create digest of original message using SHA1
			SHA1 sha1  = new SHA1CryptoServiceProvider();
			byte[] hashbytes = 
				sha1.ComputeHash(messagebytes);

			//display hash bytes in hex format
			StringBuilder sb = new StringBuilder();
			for (int i=0; i<hashbytes.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", hashbytes[i]));
			}
			textMessageDigestSHA1.Text = sb.ToString();

			//create DSA object using default key
			DSACryptoServiceProvider dsa = 
				new DSACryptoServiceProvider();

			//sign hash using OID for SHA-1
			signaturebytes =
				dsa.SignHash(hashbytes, "1.3.14.3.2.26");

			//provide DSA parameters to verification
			dsaparams = dsa.ExportParameters(false);

			//display digital signature in hex format
			sb = new StringBuilder();
			for (int i=0; i<signaturebytes.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", signaturebytes[i]));
			}
			textSignature.Text = sb.ToString();

			//display DSA parameter details in hex format
			sb = new StringBuilder();
			for (int i=0; i<dsaparams.P.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", dsaparams.P[i]));
			}
			textBoxP.Text = sb.ToString();

			sb = new StringBuilder();
			for (int i=0; i<dsaparams.Q.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", dsaparams.Q[i]));
			}
			textBoxQ.Text = sb.ToString();

			for (int i=0; i<dsaparams.Y.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", dsaparams.Y[i]));
			}
			textBoxY.Text = sb.ToString();

			for (int i=0; i<dsaparams.G.Length; i++)
			{
				sb.Append(String.Format(
					"{0,2:X2} ", dsaparams.G[i]));
			}
			textBoxG.Text = sb.ToString();

			//do UI stuff
			buttonSign.Enabled = false;
			buttonVerify.Enabled = true;
			buttonVerify.Select();
		}

		private void buttonVerify_Click(
			object sender, System.EventArgs e)
		{
			//get possibly modified message as byte array
			byte[] messagebytes = Encoding.UTF8.GetBytes(
				textOriginalMessage.Text);

			//create digest of original message using SHA1
			SHA1 sha1  = new SHA1CryptoServiceProvider();
			byte[] hashbytes = 
				sha1.ComputeHash(messagebytes);

			//create DSA object using parameters from signing
			DSACryptoServiceProvider dsa = 
				new DSACryptoServiceProvider();
			dsa.ImportParameters(dsaparams);

			//do verification on hash using OID for SHA-1
			bool match = dsa.VerifyHash(
				hashbytes, "1.3.14.3.2.26", signaturebytes);

			//show message box with result of verification
			String strResult;
			if (match)
				strResult = "VerifySignature returned TRUE";
			else
				strResult = "VerifySignature returned FALSE";
			MessageBox.Show(
				strResult,
				"Result From Calling VerifySignature",
				MessageBoxButtons.OK,
				MessageBoxIcon.Exclamation);

			//do UI stuff
			buttonSign.Enabled = true;
			buttonVerify.Enabled = false;
			buttonVerify.Select();
		}

		//variables communicated from signing to verifying
		DSAParameters dsaparams;
		byte[] signaturebytes;
	}
}
