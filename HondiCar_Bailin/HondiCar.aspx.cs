using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HondiCar_Bailin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panFinal.Visible = false;
            panPrice.Visible = false;

            if(!Page.IsPostBack)
            {
                lblPhone.Visible = false;
                txtPhone.Visible = false;

                cboCar.Items.Add(new ListItem("Civoc (+ $25000)", "25000"));
                cboCar.Items.Add(new ListItem("DR-V (+ $30000)", "30000"));
                cboCar.Items.Add(new ListItem("Appord (+ $33000)", "33000"));
                cboCar.Items.Add(new ListItem("Cilot (+ $45000)", "45000"));
                cboCar.Items.Add(new ListItem("Odyrrey (+ $54000)", "54000"));

                lstColor.Items.Add(new ListItem("White (Free)", "0"));
                lstColor.Items.Add(new ListItem("Dark (+ $300)", "300"));
                lstColor.Items.Add(new ListItem("Pearl (+ $900)", "900"));

                chklstAccessories.Items.Add(new ListItem("Aero Kit (+ $1300)", "1300"));
                chklstAccessories.Items.Add(new ListItem("Film (+ $600)", "600"));
                chklstAccessories.Items.Add(new ListItem("Cold Weather (+ $900)", "900"));
                chklstAccessories.Items.Add(new ListItem("Hondi Emblem (+ $150)", "150"));
                chklstAccessories.Items.Add(new ListItem("Snow Tire Package (+ $1800)", "1800"));

                radlstWarranty.Items.Add(new ListItem("3 Years (Included)", "0"));
                radlstWarranty.Items.Add(new ListItem("5 Years (+ $1000)", "1000"));
                radlstWarranty.Items.Add(new ListItem("7 Years (+ $1500)", "1500"));

                lstColor.SelectedIndex = 0;
                radlstWarranty.SelectedIndex = 0;
            }

            if (cboCar.SelectedIndex != 0)
            {
                calculatePrice();
            }

        }

        private void calculatePrice()
        {
            decimal car_price = 0, color_price = 0, acessories_price = 0, warranty_price = 0, subTotal_price = 0, total_price = 0;
            
            car_price = Convert.ToDecimal(cboCar.SelectedValue);
            color_price = Convert.ToDecimal(lstColor.SelectedValue);
            foreach (ListItem acess in chklstAccessories.Items)
            {
                acessories_price += (acess.Selected) ? Convert.ToDecimal(acess.Value) : 0;
            }
            warranty_price = Convert.ToDecimal(radlstWarranty.SelectedValue);

            subTotal_price = car_price + color_price + acessories_price + warranty_price;
            total_price = Math.Round(subTotal_price * Convert.ToDecimal(1.15), 2);

            litPrice.Text = "Car Price: $" + car_price + "<br />";
            litPrice.Text += "Interior Color: $" + color_price + "<br />";
            litPrice.Text += "Acessories: $" + acessories_price + "<br />";
            litPrice.Text += "Warranty: $" + warranty_price + "<br />";
            litPrice.Text += "<br /><br /><br />";
            litPrice.Text += "Total without taxes: $" + subTotal_price + "<br />";
            litPrice.Text += "Total with taxes (15%): $" + total_price + "<br />";
            panPrice.Visible = true;
        }

        protected void btnConclude_Click(object sender, EventArgs e)
        {
            String[] car = cboCar.SelectedItem.Text.Split('(');
            String[] color = lstColor.SelectedItem.Text.Split('(');
            String[] warranty = radlstWarranty.SelectedItem.Text.Split('(');

            panFinal.Visible = true;
            litFinal.Text = "Congratulation in obtain your new Hondi " + car[0] + "in " + txtCity.Text + ", " + txtZip.Text + ".<br />";
            
            litFinal.Text += "<br />";

            litFinal.Text += "Your car comes with " + color[0] + "Interior Color";
            foreach (ListItem acess in chklstAccessories.Items)
            {
                String[] acessories = acess.Text.Split('(');
                litFinal.Text += (acess.Selected) ? ", " + acessories[0].Substring(0, acessories[0].Length - 1) : "";
            }
            litFinal.Text += ".<br />";
            
            litFinal.Text += "<br />";

            litFinal.Text += "You choosed " + warranty[0] + "of warranty";
            litFinal.Text += (chkContact.Checked) ? " and our dealar you contact you by the phone number " + txtPhone.Text : "";
            litFinal.Text += ".<br /><br /><br /><br /><br />";
        }

        protected void chkContact_CheckedChanged(object sender, EventArgs e)
        {
            txtPhone.Visible = chkContact.Checked;
            lblPhone.Visible = chkContact.Checked;
        }

    }
}