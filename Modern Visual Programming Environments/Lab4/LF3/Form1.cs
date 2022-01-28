using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LF3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void employeesBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.employeesBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.databaseDataSet);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "databaseDataSet.Employees". При необходимости она может быть перемещена или удалена.
           this.employeesTableAdapter.Fill(this.databaseDataSet.Employees);

        }

        private void customersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CustomerForm cusForm = new CustomerForm();
            cusForm.MdiParent = this;
            cusForm.Show();
        }

        private void employeesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EmployeeForm empForm = new EmployeeForm();
            empForm.MdiParent = this;
            empForm.Show();
        }
    }
}
