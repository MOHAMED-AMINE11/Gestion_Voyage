<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscrire.aspx.cs" Inherits="CentreVoyage.view.Inscrire" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Réservation de Voyage</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #34495e;
        }
        
        select, input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: white;
        }
        
        select {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 12px;
            padding-right: 30px;
        }
        
        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        
        .btn-submit:hover {
            background-color: #2980b9;
        }
        
        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Réservation de Voyage</h1>
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Ville de départ"></asp:Label>
                <select id="SelectVilleDepart" name="VilleDepart" runat="server">
                    <option value="">Sélectionnez une ville</option>
                    <option value="Paris">Paris</option>
                    <option value="Lyon">Lyon</option>
                    <option value="Marseille">Marseille</option>
                    <option value="Bordeaux">Bordeaux</option>
                    <option value="Lille">Lille</option>
                    <option value="Toulouse">Toulouse</option>
                    <option value="Nice">Nice</option>
                    <option value="Nantes">Nantes</option>
                </select>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Ville d'arrivée"></asp:Label>
                <select id="SelectVilleArrivee" name="VilleArrivee" runat="server">
                    <option value="">Sélectionnez une ville</option>
                    <option value="Paris">Paris</option>
                    <option value="Lyon">Lyon</option>
                    <option value="Marseille">Marseille</option>
                    <option value="Bordeaux">Bordeaux</option>
                    <option value="Lille">Lille</option>
                    <option value="Toulouse">Toulouse</option>
                    <option value="Nice">Nice</option>
                    <option value="Nantes">Nantes</option>
                </select>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Date du voyage"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="JJ/MM/AAAA" TextMode="Date"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Nombre de personnes"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Entrez le nombre de personnes" TextMode="Number" min="1"></asp:TextBox>
            </div>
            
            <asp:Button ID="Button1" runat="server" Text="Réserver" CssClass="btn-submit" OnClick="Button1_Click"  />
        </div>
    </form>
</body>
</html>