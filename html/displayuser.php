<?php
include 'db_config.php';

session_start();

$login_session = $_SESSION['login_user'];

echo'
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Users</title>

		<script src="https://kit.fontawesome.com/a076d05399.js"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- startbootstrap.com -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<!-- Latest compiled javascript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<style>

			/* Style the list */
			ul.breadcrumb {
				overflow:hidden;
				width:100%;
			  background-color: #1d3056;
			  margin-top: 5%;
			}
			/* Display list items side by side */
			ul.breadcrumb li {
			  display: inline;
			  font-size: 18px;
			}
			/* Add a slash symbol (/) before/behind each list item */
			ul.breadcrumb li+li:before {
			  padding: 5px;
			  color: white;
			  content: "/\00a0";
			}
			/* Add a color to all links inside the list */
			ul.breadcrumb li a {
			  color: white;
			  text-decoration: none;
			}

			/* Add user button */
			.dropdowna {
			  padding: 15px 20px;

			}

			/* Glyphicon */
			.btn-group {
			  float: right;
			  position: relative;
			}
			.info {
			  padding: 20px 20px;
			}
			.headings {
			  background-color: #1d3056;
			  color: white;
			}

			/* Pagination */
			.pagination {
			  padding: 20px 20px;
			}
			.previous.disabled .page-link {
			  color: white;
			  background-color: #a6a6a6;
			  pointer-events: none;
			}
			.icon {
			  float: right;
			  position: relative;
			  padding: 50px 25px;
			  word-spacing: 15px;

			}

			.dropbtn {
			  background-color: #1d3056;
			  color: white;
			  padding: px;
			  font-size: 0px;
			  border: none;
			}

			.dropdown {
			  position: relative;
			  display: inline-block;
			}

			.dropdown-content {
			  display: none;
			  position: absolute;
			  background-color: #f1f1f1;
			  min-width: 160px;
			  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			  z-index: 1;
			}

			.dropdown-content a {
			  color: black;
			  padding: 12px 16px;
			  text-decoration: none;
			  display: block;
			}

			.dropdown-content a:hover {background-color: #ddd;}

			.dropdown:hover .dropdown-content {display: block;}

			.dropdown:hover .dropbtn {background-color:#90774f;}

			.a{
				background: #90774f;
				color: #ffffff;
			}

		</style>
	</head>

	<body class="w3-light-grey">

	<!-- Top container -->
	<div class="w3-bar w3-top w3-small" style="z-index:4;background-color:#1d3056;">
	  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();" style="float:left;"><i class="fa fa-bars"></i>  Menu</button>
	  <span class="w3-bar-item w3-animate-left" style="float: right;"><img src="sbfc.png"width=40%></span>
	</div>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
	  <div class="w3-container w3-row">
	    <div class="w3-col s4">';


$sql = "SELECT FIRSTNAME,LASTNAME,PROFILE_IMG FROM account where USER_ID = ?";
mysqli_error($conn);
if($stmt = mysqli_prepare($conn, $sql))
    mysqli_stmt_bind_param($stmt, "s",$login_session);

if(mysqli_stmt_execute($stmt))
{
    $result = mysqli_stmt_get_result($stmt);
    while($row = mysqli_fetch_assoc($result))
    {
        if(!empty(base64_encode($row['PROFILE_IMG'])))
        {
            echo' <img src="data:image/jpeg;base64,'.base64_encode( $row['PROFILE_IMG'] ).'" class="w3-circle w3-margin-right" style="height:70px;width:70px;margin-top: 40px;">';
        }
        else{
            echo' <img src="../assets/img/default-avatar.png" class="w3-circle w3-margin-right" alt="image" style="height:70px;width:70px;margin-top: 40px;">';
        }
        echo'  </div>  <div class="w3-col s8 w3-bar">   <h4 style="padding-top: 40px;"> <span>Welcome, <strong><br>';
        echo $row['FIRSTNAME']." ".$row['LASTNAME'];
    }
}
else {
    echo "Error: " . $sql1 . "<br>" . mysqli_error($conn);
}


echo'</strong></span><br></h4>

	    </div>
	  </div>
	  <hr>

	  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <h4 style="font-size: 17px;background-color: #1d3056;color: #FFFFFF;"><a href="admin.php" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><i class="fa fa-pie-chart"></i>  Dashboard</a></h4>
    <h4 style="font-size: 17px;"><a href="admin-account.php" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><i class="fa fa-user fa-fw"></i>  Account</a></h4>
   <h4 style="font-size: 17px;"><a href="report.php" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><i class="fa fa-pie-chart"></i>  Analytics</a></h4>
   <h4 style="font-size: 17px;"> <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><i class="fa fa-comments"></i>  Messages</a></h4>
   <h4 style="font-size: 17px;"> <a href="logout.php" class="w3-bar-item w3-button w3-padding" style="text-decoration: none;"><i class="fa fa-sign-out"></i>  Logout</a></h4>

  </div>
	</nav>


	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
		<div class="w3-main" style="margin-left:300px;margin-top:43px;">

			<ul class="breadcrumb">
				<li><a href="admin.php">Home</a></li>
				<li style="font-size:25px;"><a href="#">Users</a></li>
			</ul>


	<div class="dropdowna">
		<a href="adduser.php" class="btn a" role="button">Add User</a>
		<a href="download.php"  style="float: right" class="btn a" role="button">Download</a>
		</div>
		
<div class="container" style="width: 100%">
    <div class="row">
    <hr>
        <div class="panel panel-primary filterable" style="border-color: #1d3056;">
            <div class="panel-heading" style="background-color: #1d3056;">
                <h3 class="panel-title">User List</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter Search</button>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr class="filters">
                    <th><input type="checkbox" id="checkAl"></th>
                    <th><input type="text" class="form-control" placeholder="Name" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Email" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Role" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Department" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Group Name" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Registration" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Last Login" disabled></th>
                    <th><input type="text" class="form-control" placeholder="OPTIONS" disabled></th>
                </tr>
                </thead>
                <tbody>';

$sql = "SELECT * FROM account WHERE USER_ID";
$result = mysqli_query($conn, $sql) or die(mysqli_error($conn));


$output = '';
if(isset($_POST["query"]))
{
    $search = mysqli_real_escape_string($conn, $_POST["query"]);
    $query = "
                          SELECT * FROM account 
                          WHERE FIRSTNAME OR LASTNAME LIKE '%".$search."%'
                          OR EMAIL LIKE '%".$search."%' 
                          OR ROLE LIKE '%".$search."%' 
                          OR DEPARTMENT LIKE '%".$search."%'
                          OR Group_Name LIKE '%".$search."%' 
                          OR REGISTRATION LIKE '%".$search."%'  
                          OR LOGINTIME LIKE '%".$search."%'  
                         ";
}
else
{

    $query = "SELECT * FROM account ORDER BY USER_ID asc";
}

$result = mysqli_query($conn, $query);
if(mysqli_num_rows($result) > 0)
{

    while($row = mysqli_fetch_array($result))
    {
        $username = $row["USER_ID"];

        $output .= '
                           <tr>
                            <td><input type="checkbox" id="checkItem" name="check[]" value="'.$row["USER_ID"].'"></td>
                            <td>'.$row["FIRSTNAME"]. ' ' .$row["LASTNAME"].'</td>
                            <td>'.$row["EMAIL"].'</td>
                            <td>'.$row["ROLE"].'</td>
                            <td>'.$row["DEPARTMENT"].'</td>
                            <td>'.$row["Group_Name"].'</td>
                            <td>'.$row["REGISTRATION"].'</td>
                            <td>'.$row["LOGINTIME"].'</td>
                            <td>
                            <div class="dropdown">
							    <button class="dropbtn"><i class="fa fa-ellipsis-h" aria-hidden="true" style="font-size: 16px;"></i></button>
						        <div class="dropdown-content" style="text-align: left;">
						            <a href="edit_user.php?id=' .$row["USER_ID"]. '">Edit</a>
						            <a href="delete_user.php?id=' .$row["USER_ID"]. '">Delete</a>
						        </div></div>
						        </td>
                           </tr>
                          ';
    }
    echo $output;
}
?>
</tbody>
</table>
</div>
</div>
</div>
</body>
</html>

<style type="text/css">
    .filterable {
        margin-top: 15px;
    }
    .filterable .panel-heading .pull-right {
        margin-top: -20px;
    }
    .filterable .filters input[disabled] {
        background-color: transparent;
        border: none;
        cursor: auto;
        box-shadow: none;
        padding: 0;
        height: auto;
    }
    .filterable .filters input[disabled]::-webkit-input-placeholder {
        color: #333;
    }
    .filterable .filters input[disabled]::-moz-placeholder {
        color: #333;
    }
    .filterable .filters input[disabled]:-ms-input-placeholder {
        color: #333;
    }
</style>

<script type="text/javascript">
    $(document).ready(function(){
        $('.filterable .btn-filter').click(function(){
            var $panel = $(this).parents('.filterable'),
                $filters = $panel.find('.filters input'),
                $tbody = $panel.find('.table tbody');
            if ($filters.prop('disabled') == true) {
                $filters.prop('disabled', false);
                $filters.first().focus();
            } else {
                $filters.val('').prop('disabled', true);
                $tbody.find('.no-result').remove();
                $tbody.find('tr').show();
            }
        });

        $('.filterable .filters input').keyup(function(e){
            var code = e.keyCode || e.which;
            if (code == '9') return;
            var $input = $(this),
                inputContent = $input.val().toLowerCase(),
                $panel = $input.parents('.filterable'),
                column = $panel.find('.filters th').index($input.parents('th')),
                $table = $panel.find('.table'),
                $rows = $table.find('tbody tr');

            var $filteredRows = $rows.filter(function(){
                var value = $(this).find('td').eq(column).text().toLowerCase();
                return value.indexOf(inputContent) === -1;
            });

            $table.find('tbody .no-result').remove();
            $rows.show();
            $filteredRows.hide();

            if ($filteredRows.length === $rows.length) {
                $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
            }
        });
    });
</script>

<script>
    $("#checkAl").click(function () {
        $('input:checkbox').not(this).prop('checked', this.checked);
    });
</script>