<%@ page import="com.bank.bank.App" %>
<html>
<head>
<title>Bank App</title>

<style>
body {
    font-family: Arial;
    background-color: #f2f2f2;
}

/* Center box */
.container {
    width: 400px;
    margin: 100px auto;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
    text-align: center;
}

input, select {
    width: 80%;
    padding: 8px;
    margin: 10px 0;
}

button {
    padding: 8px 15px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
}

ul {
    text-align: left;
}
</style>

</head>

<body>

<div class="container">

<h2>Bank Management System</h2>

<form method="POST">
Amount:<br>
<input type="text" name="amount"><br>

<select name="action">
<option value="deposit">Deposit</option>
<option value="withdraw">Withdraw</option>
<option value="clear">Clear Transactions</option>
</select><br>

<button type="submit">Submit</button>
</form>

<%
App app = (App)application.getAttribute("bank");

if(app == null){
    app = new App();
    application.setAttribute("bank", app);
}

String amtStr = request.getParameter("amount");
String action = request.getParameter("action");

String message = "";

if(action != null){

    if(action.equals("clear")){
        app.clearTransactions();
        message = "Transaction history cleared!";
    }
    else if(amtStr != null && !amtStr.trim().isEmpty()){
        try {
            int amt = Integer.parseInt(amtStr);

            if(action.equals("deposit")){
                app.deposit(amt);
                message = "Amount deposited successfully!";
            } 
            else if(action.equals("withdraw")){
                int before = app.getBalance();
                app.withdraw(amt);

                if(amt <= before){
                    message = "Amount withdrawn successfully!";
                } else {
                    message = "Insufficient balance!";
                }
            }

        } catch(Exception e){
            message = "Invalid input!";
        }
    }
}
%>

<p><b><%=message %></b></p>

<h3>Balance: RS <%=app.getBalance() %></h3>

<h3>Transactions</h3>
<ul>
<%
for(String t : app.getTransactions()){
%>
<li><%=t %></li>
<% } %>
</ul>

</div>

</body>
</html>


