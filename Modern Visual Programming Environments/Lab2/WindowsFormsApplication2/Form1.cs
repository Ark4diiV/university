using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (button2.Text == "Exit")
                Application.Exit();
            else
            {
                Form2 F2 = new Form2();
                F2.isAll = checkBox3.Checked;
                if (checkBox1.Checked && comboBox1.SelectedIndex >= 0)
                    F2.num = comboBox1.SelectedIndex;
                    F2.Show();
            }
            
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                checkBox2.Enabled = false;
                checkBox3.Enabled = false;
                listBox1.Enabled = false;
                panel1.Enabled = true;
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                checkBox2.Enabled = false;
                checkBox3.Enabled = false;
                listBox1.Enabled = true;
                panel1.Enabled = false;
            }
}

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
            {
                checkBox2.Enabled = false;
                checkBox1.Enabled = false;
                panel1.Enabled = false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked || checkBox3.Checked || checkBox2.Checked)
            {
                button2.Text = "Show";
                groupBox1.Enabled = false;
            }

        }
    }
}
