<?php
// Initialize products and cart arrays
$products = $cart = [];

// Process POST data to populate products and cart arrays
foreach ($_POST as $key => $val) {
    $array = explode('_', $key);

    if (count($array) > 1) {
        $i = array_pop($array);
    } else {
        $i = $array[0];
    }

    $key = implode('_', $array);

    if (is_numeric($i)) {
        $products[$i][$key] = $val;
    } else {
        $cart[$key] = $val;
    }
}

require 'dbcon.php';

// Handle product removal
if (isset($_POST['remove_id'])) {
    $remove_id = intval($_POST['remove_id']);
    // Remove product from the session or database
    unset($products[$remove_id]);
    // You may need to update the session or database here

    // Return updated products count for JavaScript
    echo count($products);
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>My Cart | Click & Chic</title>
    <?php include 'header.php'; ?>
    <form action="checkout.php" method="post">
        <div class="w3l_banner_nav_right">
            <!-- about -->
            <div class="privacy about">
                <h3>My <span>Cart</span></h3>
                <div class="checkout-right">
                    <h4>Your shopping cart contains: <span id="product-count"><?=count($products)?> Products</span></h4>
                    <table class="timetable_sub">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Product</th>
                                <th>Name</th>
                                <th>Rate</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $total = 0;
                            foreach ($products as $i => $product) {
                                $result = $conn->query('SELECT * FROM `product` WHERE `name` = "'.$product['item_name'].'"');
                                if ($result) {
                                    $row = $result->fetch_assoc();
                                    $pid = $row['pid'];
                                    $image = $row['pic'];
                                    $amount = $product['amount'];
                                    $products[$i]['subtotal'] = $subtotal = $product['amount'];
                                    $total += $subtotal;
                                } else {
                                    echo 'Product not found.';
                                } ?>
                                <tr class="product-row" data-id="<?=$pid?>">
                                    <td class="invert"><?=$i?></td>
                                    <td class="invert-image">
                                        <a href="single.php">
                                            <img src="<?=$image?>" alt="<?=$product['item_name']?>" class="img-responsive">
                                        </a>
                                    </td>
                                    <td class="invert">
                                        <span id="name_<?=$pid?>"><?=ucwords($product['item_name'])?></span>
                                    </td>
                                    <input type="hidden" name="name_<?=$pid?>" value="<?=$product['item_name']?>">
                                    <td class="invert">
                                        <span id="amount_<?=$pid?>"><?=$product['amount']?></span>
                                    </td>
                                    <input type="hidden" name="amount_<?=$pid?>" value="<?=$product['amount']?>">
                                    <td class="invert">
                                        <div class="quantity">
                                            <div class="quantity-select">
                                                <div class="entry value-minus" data-id="<?=$pid?>">&#8722;</div>
                                                <div class="entry value">
                                                    <span><?=$product['quantity']?></span>
                                                </div>
                                                <div class="entry value-plus active" data-id="<?=$pid?>">&#43;</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="invert">
                                        <span id="subtotal_<?=$pid?>" class="subtotal"><?=$subtotal?></span>
                                    </td>
                                    <input type="hidden" name="subtotal_<?=$pid?>" value="<?=$subtotal?>">
                                    <td class="invert">
                                        <div class="rem" data-id="<?=$pid?>">
                                            <div class="close1"></div>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <div class="checkout-left">
                    <div class="col-md-4 checkout-left-basket">
                        <ul>
                            <li style="font-size: 20px">Delivery Charges <i>-</i> <span class="text-primary">Free</span></li>
                            <li><hr></li>
                            <li style="font-weight: bolder;font-size: 20px">Total  <span id="total"><?=$total?></span> <span>$</span></li>
                            <input type="hidden" name="total" value="<?=$total?>">
                        </ul>
                        <div class="row"></div>
                    </div>
                    <div class="col-md-8 address_form_agile">
                        <section class="creditly-wrapper wthree, w3_agileits_wrapper" style="margin-top: 35px">
                            <div class="information-wrapper">
                                <button class="submit check_out btn-block">Place Order</button>
                            </div>
                        </section>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- //about -->
        </div>
    </form>
    <div class="clearfix"></div>
    <?php include 'footer.php'; ?>

    <!--quantity-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $('.value-plus').on('click', function() {
        id = $(this).attr('data-id');
        var divUpd = $(this).parent().find('.value');
        quantity1 = parseInt(divUpd.text(), 10);
        quantity2 = quantity1 + 1;
        if(quantity2 < 1) { quantity2 = 1; }
        divUpd.text(quantity2);
        $('[name=quantity_'+id+']').val(quantity2);
        amount = Number($('#amount_'+id).text());
        subtotal = quantity2 * amount;
        $('[name=subtotal_'+id+']').val(subtotal);
        $('#subtotal_'+id).text(subtotal);
        total1 = Number($('#total').text());
        total2 = total1 + (amount * (quantity2 - quantity1));
        $('#total').text(total2);
        $('[name=total]').val(total2);
    });

    $('.value-minus').on('click', function() {
        id = $(this).attr('data-id');
        var divUpd = $(this).parent().find('.value');
        quantity1 = parseInt(divUpd.text(), 10);
        quantity2 = quantity1 - 1;
        if(quantity2 < 1) { quantity2 = 1; }
        divUpd.text(quantity2);
        $('[name=quantity_'+id+']').val(quantity2);
        amount = Number($('#amount_'+id).text());
        subtotal = quantity2 * amount;
        $('[name=subtotal_'+id+']').val(subtotal);
        $('#subtotal_'+id).text(subtotal);
        total1 = Number($('#total').text());
        total2 = total1 + (amount * (quantity2 - quantity1));
        $('#total').text(total2);
        $('[name=total]').val(total2);
    });

    $('.rem').on('click', function() {
        var row = $(this).closest('tr');
        var id = $(this).attr("data-id");
        $.ajax({
            url: 'cart.php', // Update with the correct URL of your PHP file
            type: 'POST',
            data: { remove_id: id },
            success: function(response) {
                if (response) {
                    row.fadeOut('slow', function() {
                        row.remove();
                        updateTotal();
                        $('#product-count').text($('.product-row').length + ' Products');
                    });
                }
            }
        });
    });

    function updateTotal() {
        var total = 0;
        $('.subtotal').each(function() {
            total += parseFloat($(this).text());
        });
        $('#total').text(total);
        $('[name=total]').val(total);
    }
    </script>
</body>
</html>
