<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasePage.aspx.cs" Inherits="CentreVoyage.view.BasePage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Centre Voyage - Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        :root {
            --primary: #2E5BFF;
            --secondary: #6C757D;
            --success: #28A745;
            --danger: #DC3545;
            --warning: #FFC107;
            --info: #17A2B8;
            --light: #F8F9FA;
            --dark: #343A40;
            --white: #FFFFFF;
            --sidebar-width: 250px;
            --header-height: 70px;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        body {
            background-color: #f5f7fb;
            color: var(--dark);
            min-height: 100vh;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(to bottom, #2E5BFF, #1A41E6);
            color: var(--white);
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            z-index: 100;
        }

        .sidebar-header {
            height: var(--header-height);
            display: flex;
            align-items: center;
            padding: 0 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar-header h1 {
            font-size: 24px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .menu-item {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
        }

        .menu-item:hover, .menu-item.active {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--white);
        }

        .menu-item.active::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background-color: var(--white);
        }

        .menu-item i {
            margin-right: 10px;
            font-size: 18px;
        }

        .menu-item span {
            font-size: 16px;
        }

        /* Content Area Styles */
        .content-wrapper {
            margin-left: var(--sidebar-width);
            width: calc(100% - var(--sidebar-width));
            transition: all 0.3s ease;
        }

        .header {
            height: var(--header-height);
            background-color: var(--white);
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            position: fixed;
            top: 0;
            right: 0;
            width: calc(100% - var(--sidebar-width));
            z-index: 99;
        }

        .header-left {
            display: flex;
            align-items: center;
        }

        .toggle-sidebar {
            background: none;
            border: none;
            color: var(--dark);
            font-size: 20px;
            cursor: pointer;
            margin-right: 20px;
            display: none;
        }

        @media (max-width: 992px) {
            .toggle-sidebar {
                display: block;
            }
        }

        .search-bar {
            position: relative;
        }

        .search-bar input {
            padding: 8px 15px 8px 35px;
            border: 1px solid #e0e0e0;
            border-radius: 20px;
            font-size: 14px;
            width: 250px;
            outline: none;
            transition: all 0.3s ease;
        }

        .search-bar input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(46, 91, 255, 0.1);
        }

        .search-bar i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--secondary);
            font-size: 14px;
        }

        .header-right {
            display: flex;
            align-items: center;
        }

        .user-menu {
            display: flex;
            align-items: center;
            cursor: pointer;
            position: relative;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary);
            color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 10px;
        }

        .user-info {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 600;
            font-size: 14px;
        }

        .user-role {
            font-size: 12px;
            color: var(--secondary);
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: var(--white);
            box-shadow: var(--shadow);
            border-radius: 4px;
            width: 200px;
            display: none;
            z-index: 101;
        }

        .dropdown-menu.show {
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .dropdown-item {
            padding: 12px 15px;
            display: flex;
            align-items: center;
            color: var(--dark);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .dropdown-item:hover {
            background-color: #f8f9fa;
            color: var(--primary);
        }

        .dropdown-item i {
            margin-right: 10px;
            font-size: 16px;
        }

        .dropdown-divider {
            height: 1px;
            background-color: #e0e0e0;
            margin: 8px 0;
        }

        /* Main Content Area */
        .main-content {
            padding: 100px 30px 30px;
            min-height: calc(100vh - var(--header-height));
        }

        .card {
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: var(--shadow);
            padding: 25px;
            margin-bottom: 25px;
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--dark);
        }

        .card-body {
            color: var(--secondary);
        }

        /* Mobile Responsive */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.show {
                transform: translateX(0);
            }

            .content-wrapper {
                margin-left: 0;
                width: 100%;
            }

            .header {
                width: 100%;
            }

            .sidebar-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                z-index: 98;
            }

            .sidebar-overlay.show {
                display: block;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <h1>Centre Voyage</h1>
                </div>
                <div class="sidebar-menu">
                    <a href="Inscrire.aspx" class="menu-item" id="inscrire">
                        <i class="fa fa-pencil"></i>
                        <span>S'inscrire</span>
                    </a>
                     <a href="ListIndcri.aspx" class="menu-item" id="list">
     <i class="fa fa-pencil"></i>
     <span>ListInscri</span>
 </a>
                                        <a href="ConnectionFrom.aspx" class="menu-item" id="list">
    <i class="fa fa-pencil"></i>
    <span>Deconnection</span>
</a>
                </div>
            </div>

            <!-- Overlay (Mobile Sidebar) -->
            <div class="sidebar-overlay" id="sidebarOverlay"></div>

            <!-- Content Wrapper -->
            <div class="content-wrapper">
                <div class="header">
                    <button class="toggle-sidebar" onclick="toggleSidebar()">&#9776;</button>
                    <div class="search-bar">
                        <input type="text" placeholder="Recherche..." />
                        <i class="fa fa-search"></i>
                    </div>
                    <div class="header-right">
                        <div class="user-menu" onclick="toggleDropdown()">
                            <div class="user-avatar">U</div>
                            <div class="user-info">
                                <div class="user-name">Utilisateur</div>
                                <div class="user-role">Rôle</div>
                            </div>
                            <i class="fa fa-chevron-down"></i>
                        </div>
                        <div class="dropdown-menu" id="dropdownMenu">
                            <a href="#" class="dropdown-item">
                                <i class="fa fa-user"></i> Profil
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fa fa-sign-out-alt"></i> Déconnexion
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <!-- Content goes here -->
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">Bienvenue sur votre dashboard</div>
                        </div>
                        <div class="card-body">
                            Contenu du dashboard
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('show');
            document.getElementById('sidebarOverlay').classList.toggle('show');
        }

        document.getElementById('sidebarOverlay').onclick = function () {
            toggleSidebar();
        };

        function toggleDropdown() {
            document.getElementById('dropdownMenu').classList.toggle('show');
        }

        document.getElementById('inscrire').addEventListener('click', function (e) {
            e.preventDefault(); 
            window.location.href = "Inscrire.aspx"; 
            document.getElementById('list').addEventListener('click', function (e) {
                e.preventDefault(); // Prevent default behavior
                window.location.href = "ListIndcri.aspx"; 
        });
    </script>
</body>
</html>
