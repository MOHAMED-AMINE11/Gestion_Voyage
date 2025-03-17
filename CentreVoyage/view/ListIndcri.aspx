<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListIndcri.aspx.cs" Inherits="CentreVoyage.view.ListIndcri" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Liste des Inscriptions</title>
    <style>
        /* Styles de base */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        
        /* Style pour les lignes cliquables */
        .clickable-row {
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .clickable-row:hover {
            background-color: #f0f8ff;
        }
    </style>
    <script type="text/javascript">
        function redirectToDetails(codeInsc) {
            window.location.href = 'DetailsInscription.aspx?id=' + codeInsc;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Liste des Inscriptions</h2>
            
            <asp:GridView ID="GridViewInscriptions" runat="server" AutoGenerateColumns="False" 
                          CellPadding="4" ForeColor="#333333" GridLines="None"
                          OnRowDataBound="GridViewInscriptions_RowDataBound"
                          CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="codeInsc" HeaderText="Code Inscription" SortExpression="codeInsc" />
                    <asp:BoundField DataField="codeEmp" HeaderText="Code Employé" SortExpression="codeEmp" />
                    <asp:BoundField DataField="codeVoyage" HeaderText="Code Voyage" SortExpression="codeVoyage" />
                    <asp:BoundField DataField="nbrePers" HeaderText="Nombre de Personnes" SortExpression="nbrePers" />
                    <asp:BoundField DataField="dateVoy" HeaderText="Date du Voyage" SortExpression="dateVoy" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonDetails" runat="server" 
                                          Text="Détails" 
                                          CommandName="Details" 
                                          CommandArgument='<%# Eval("codeInsc") %>'
                                          OnCommand="LinkButtonDetails_Command" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="White" />
                <HeaderStyle BackColor="#4472C4" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>