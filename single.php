<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Grocery Store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Single :: w3layouts</title>
</head>
<body>  <?php require 'dbcon.php' ?> 
        <?php include 'header.php'?>
		<?php
				if (isset($_GET['id'])) {$idt = $_GET['id'];} 
				
					$sql = "SELECT * FROM product WHERE pid=$idt";
					$result = $conn->query($sql);
					$row = $result->fetch_assoc();
					?>
					
		<div class="w3l_banner_nav_right">
			<div class="w3l_banner_nav_right_banner3">
				<h3 style="color: black;">Best Deals For New Products<span class="blink_me"></span></h3>
			</div>
			<div class="agileinfo_single">
				<h5><?php echo($row['name']) ?></h5>
				<div class="col-md-4 agileinfo_single_left">
				
  			    
					<img id="example" src=<?php echo($row['pic'])?> alt=" " class="img-responsive" />
				</div>
				<div class="col-md-8 agileinfo_single_right">
					<div class="rating1">
						<span class="starRating">
							<input id="rating5" type="radio" name="rating" value="5">
							<label for="rating5">5</label>
							<input id="rating4" type="radio" name="rating" value="4">
							<label for="rating4">4</label>
							<input id="rating3" type="radio" name="rating" value="3" checked>
							<label for="rating3">3</label>
							<input id="rating2" type="radio" name="rating" value="2">
							<label for="rating2">2</label>
							<input id="rating1" type="radio" name="rating" value="1">
							<label for="rating1">1</label>
						</span>
					</div>
					<div class="w3agile_description">
						<h4>Description :</h4>
						<p><?php echo($row['descrp']) ?></p>
					</div>
					<div class="snipcart-item block">
						<div class="snipcart-thumb agileinfo_single_right_snipcart">
							<h4><?php $valyu=$row['price']-($row['discount']*$row['price'])/100; echo("\$".$valyu) ?><span><?php if($row['discount']>0) echo("\$".$row['price']) ?></span></h4>
						</div>
				
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	</body>
</html>
<?php include 'footer.php'?>
<!-- //banner -->
<!-- brands -->
