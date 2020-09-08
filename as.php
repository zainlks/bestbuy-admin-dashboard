<?php
// $url = "https://marketplace.bestbuy.ca/api/orders?api_key=333281a3-8a7a-4cca-a415-f73f3089b8af";
// $response = file_get_contents($url);
// $response = json_decode($response);
// print_r($response->orders[0]->order_lines[0]->product_title);
$date = date("Y-m-d\T");
$url = "https://marketplace.bestbuy.ca/api/orders?api_key=333281a3-8a7a-4cca-a415-f73f3089b8af&start_date=$date";
$fullURL = $url."00:00:00N";
echo($fullURL);
?>
