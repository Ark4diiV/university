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
    public partial class CustomerForm : Form
    {
        public CustomerForm()
        {
            InitializeComponent();
        }

        private void CustomerForm_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "databaseCustomersDataSet.OrderDetails". При необходимости она может быть перемещена или удалена.
            this.orderDetailsTableAdapter.Fill(this.databaseCustomersDataSet.OrderDetails);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "databaseCustomersDataSet.Order". При необходимости она может быть перемещена или удалена.
            this.orderTableAdapter.Fill(this.databaseCustomersDataSet.Order);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "databaseCustomersDataSet.Customers". При необходимости она может быть перемещена или удалена.
            this.customersTableAdapter.Fill(this.databaseCustomersDataSet.Customers);

        }
    }
}
