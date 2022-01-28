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
    public partial class Form2 : Form
    {
        public bool isAll = false;
        public int num = 0;

        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            pictureBox1.Image = imageList1.Images[num];
            if (isAll) timer1.Start();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (num < imageList1.Images.Count - 2)
            {
                num++;
                pictureBox1.Image = imageList1.Images[num];
            }
            else
            {
                timer1.Stop();
            }
            
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            pictureBox1.Height = (int)numericUpDown1.Value;
            pictureBox1.Width = (int)numericUpDown1.Value;
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (num > 0)
            {
                num--;
                pictureBox1.Image = imageList1.Images[num];
            }
            else
                MessageBox.Show("Это первая картинка");
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (num < imageList1.Images.Count - 2)
            {
                num++;
                pictureBox1.Image = imageList1.Images[num];
            }
            else
                MessageBox.Show("Это последняя картинка");
        }
    }
}
