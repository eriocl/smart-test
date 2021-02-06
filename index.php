<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title></title>
</head>
<body>
<div class="row justify-content-center">
    <h2 class="h5 text-muted mb-3 text-center">Login</h2>
    <div class="col-3 p-4 shadow ">
        <div class = "row bg-info" id="flash">

        </div>
        <form action="login.php"  method="post" class="bg-white p-3 border rounded" id="form-login">
            <div class="form-row">
                <div class="form-group col-8">
                    <label class="text-muted small">Login</label>
                    <input type="text" class="form-control" name="user[login]" id="user-login"
                           value="" required>
                </div>
                <div class="form-group col-8">
                    <label class="text-muted small">Password</label>
                    <input type="password" class="form-control" name="user[password]" id="user-password" required>
                </div>
                <div class="form-row mt-3 text-right">
                    <div class="col text-right">
                        <button type="submit" class="btn btn-success" id="login" name="login">Submit</button>
                    </div>
                </div>
        </form>
    </div>
</div>
<?php



?>
<script src="js/main.js"></script>
</body>
</html>