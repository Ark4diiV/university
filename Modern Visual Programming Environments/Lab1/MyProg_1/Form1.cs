using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MyProg_1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex >= 0 && listBox1.SelectedIndex < 4)
            {
                checkedListBox1.Items.Clear();
                checkedListBox1.Items.AddRange(new string [] {"Computer Sciense",
                "Mechanical", "Electrical", "Electrical and Electronics", 
                "Electronics and Communication", "Civil"});
            }
//            if (listBox1.SelectedIndex >= 0 && listBox1.SelectedIndex >= 4) 
//            {
//               checkedListBox1.Items.Clear();
//                checkedListBox1.Items.AddRange(new string[] {"Mathematics ",
//               "Physics", "Chemistry", "Biology", 
//               "Accounts", "Economics", "Statistics","Management", "English"});
//           }

            if (listBox1.SelectedIndex >= 0)
            {
                listBox1.Visible = false;
                degreeOpted.Text = "Degree Opted: " + listBox1.Text;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            String str = "Name: " + textBox1.Text;
            str += "\nAddress: " + textBox2.Text;
            str += "\nPhone number: " + textBox3.Text;
            str += "\nDegree Opted: " + listBox1.Text;
            str += "\nMajor Opted: ";
            foreach (var item in checkedListBox1.CheckedItems)
            {
                str += item.ToString() + ", ";
            }
            str = str.Substring(0, str.Length - 2) + ".";
            MessageBox.Show(str);
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            listBox1.Visible = true;
            listBox1.SelectedIndex = -1;
            degreeOpted.Text = "Degree Opted";
            checkedListBox1.Items.Clear();
            checkedListBox1.Items.AddRange(new string[] {"Mathematics ",
            "Physics", "Chemistry", "Biology", 
            "Accounts", "Economics", "Statistics","Management", "English"});            
        }
    }
}
