#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>NTI Apache Backend Server</title>
  <style>
    /* Reset and base styles */
    * {
      margin: 0; padding: 0; box-sizing: border-box;
    }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #121212;
      color: #e0e0e0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    header {
      background: #1f1f1f;
      padding: 20px;
      display: flex;
      align-items: center;
      box-shadow: 0 2px 5px rgba(0,0,0,0.5);
    }
    header img {
      height: 50px;
      margin-right: 15px;
    }
    header h1 {
      font-size: 1.8rem;
      color: #ffcc00;
      letter-spacing: 2px;
    }
    main {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 40px 20px;
      text-align: center;
      background: linear-gradient(135deg, #242424, #333333);
    }
    main h2 {
      font-size: 3rem;
      margin-bottom: 15px;
      color: #ffcc00;
      text-shadow: 1px 1px 4px #000;
    }
    main p {
      font-size: 1.3rem;
      line-height: 1.5;
      max-width: 600px;
      margin-bottom: 40px;
      color: #ccc;
    }
    footer {
      background: #1f1f1f;
      padding: 15px;
      text-align: center;
      font-size: 0.9rem;
      color: #777;
      box-shadow: 0 -2px 5px rgba(0,0,0,0.5);
    }
    footer a {
      color: #ffcc00;
      text-decoration: none;
      font-weight: 600;
    }
    footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <header>
    <img src="https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/332669397_674071134402581_4884799142857696101_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=IeaVtpP6kZ8Q7kNvwGHMbxW&_nc_oc=AdntmGRhJKTYofIFxYIlOWepeqG8e4tu--JTaAFFY0ftcZ2FBZd3G6Y7oQ27XzVZ0HM&_nc_zt=23&_nc_ht=scontent.fcai20-3.fna&_nc_gid=E9bxyRxmc2LeRRLjbyFMJA&oh=00_AfKrGfrJMmvvMsqxSBzOjPl0dB5mhqJo12rVAGn7UrFDwg&oe=6836ACED" alt="NTI Logo" />
    <h1>NTI Apache Backend Server</h1>
  </header>
  <main>
    <h2>Welcome to My Apache Backend Server</h2>
    <p>Hosted and maintained by Mahmoud Abdelnaser Elsayed</p>
    <p>Supervised by Eng. Mohamed Swelam</p>
  </main>
  <footer>
    Powered by <a href="https://www.ubuntu.com/" target="_blank" rel="noopener noreferrer">Ubuntu 20.04</a> &amp; Apache
  </footer>
</body>
</html>
EOF

sudo systemctl restart apache2
