<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HondiCar.aspx.cs" Inherits="HondiCar_Bailin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hondi Build & Price</title>
    <style type="text/css">
        div {
            font-size: 12px;
            font-family:serif;
            font-weight:bold;
        }

        .title {
            text-align: center;
        }

        .main-table {
            margin: auto;
            width: 600px;
            height: 500px;
            table-layout: fixed;
        }

        .tecboc {
            border: 2px solid;
        }
        .tecboc2 {
            border: 2px solid;
            float: right;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="title">Hondi Build & Price</p>
        </div>
        <div>
            <table class="main-table">
                <tr>
                    <td rowspan="2" valign="top" style="height: 500px; width: 300px;">
                        <asp:Panel ID="PanInfo" runat="server" GroupingText="Car Informations">
                            <table>
                                <tr >
                                    <td valign="top" >
                                        <asp:Label ID="lblCity" runat="server" AssociatedControlID="txtCity" Text="Your City"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="tecboc" Width="50px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblZip" runat="server" AssociatedControlID="txtZip" Text="Zip Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtZip" runat="server" CssClass="tecboc" Width="50px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblModel" runat="server" Text="Select Car model"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cboCar" runat="server" AutoPostBack="True" CssClass="tecboc">
                                            <asp:ListItem>Select a Car</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblColor" runat="server" Text="Interior Color"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="lstColor" runat="server" AutoPostBack="True" CssClass="tecboc"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblAccessories" runat="server" Text="Accessories"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBoxList ID="chklstAccessories" runat="server" AutoPostBack="True">
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblWarranty" runat="server" Text="Warranty"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="radlstWarranty" runat="server" AutoPostBack="True">
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblContact" runat="server" Text="Dealer Contact you by phone?"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkContact" runat="server" AutoPostBack="True" OnCheckedChanged="chkContact_CheckedChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" Text="Phone Number"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="tecboc" Width="50px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td style="height: 210px; width: 300px;" valign="top">
                        <asp:Panel ID="panPrice" runat="server" GroupingText="Price Resume" Height="210px">

                                        <asp:Literal ID="litPrice" runat="server"></asp:Literal>
        
                                        <asp:Button ID="btnConclude" runat="server" Text="Conclude" OnClick="btnConclude_Click" CssClass="tecboc2"/>
             
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="height: 250px; width: 300px;" valign="top">
                        <asp:Panel ID="panFinal" runat="server" GroupingText="Final Information" Height="250px">
                            <asp:Literal ID="litFinal" runat="server"></asp:Literal>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
