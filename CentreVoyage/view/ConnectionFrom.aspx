<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnectionFrom.aspx.cs" Inherits="CentreVoyage.view.ConnectionFrom" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Centre Voyage - Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #a1c4fd, #c2e9fb);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .login-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
            padding: 40px;
            width: 350px;
            transform: translateY(20px);
            opacity: 0;
            animation: fadeInUp 0.6s ease-out forwards;
        }
        
        .login-title {
            color: #4a6fa5;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            letter-spacing: 1px;
        }
        
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-control {
            width: 100%;
            padding: 10px 5px;
            font-size: 16px;
            border: none;
            border-bottom: 2px solid #ddd;
            background-color: transparent;
            transition: border-color 0.3s;
            outline: none;
        }
        
        .form-control:focus {
            border-color: #4a6fa5;
        }
        
        .form-label {
            position: absolute;
            top: 10px;
            left: 5px;
            color: #999;
            font-size: 16px;
            transition: all 0.3s ease;
            pointer-events: none;
        }
        
        .form-control:focus ~ .form-label,
        .form-control:valid ~ .form-label {
            top: -20px;
            font-size: 12px;
            color: #4a6fa5;
        }
        
        .btn-login {
            width: 100%;
            background-color: #4a6fa5;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        
        .btn-login:hover {
            background-color: #3a5a80;
            transform: translateY(-2px);
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .input-icon {
            position: absolute;
            top: 12px;
            right: 10px;
            color: #999;
            transition: color 0.3s;
        }
        
        .form-control:focus ~ .input-icon {
            color: #4a6fa5;
        }
        
        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }
        
        .forgot-password a {
            color: #999;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .forgot-password a:hover {
            color: #4a6fa5;
        }
        
        /* Animation for input fields */
        .form-group {
            animation: slideIn 0.5s ease-out forwards;
            opacity: 0;
        }
        
        .form-group:nth-child(1) {
            animation-delay: 0.2s;
        }
        
        .form-group:nth-child(2) {
            animation-delay: 0.4s;
        }
        
        .btn-login-container {
            opacity: 0;
            animation: fadeIn 0.5s ease-out 0.6s forwards;
        }
        
        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateX(-20px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h1 class="login-title">Welcome Back</h1>
            
            <div class="form-group">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                <i class="input-icon">✉</i>
            </div>
            
            <div class="form-group">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                <i class="input-icon">🔒</i>
            </div>
            
            <div class="btn-login-container">
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn-login" OnClick="Button1_Click2"  />
                
                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>
            </div>
        </div>
    </form>

  
</body>
</html>