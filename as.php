<?php
  $url = "https://marketplace.bestbuy.ca/api/account?api_key=333281a3-8a7a-4cca-a415-f73f3089b8af";
  $response = file_get_contents($url);
  $response = json_decode($response);
  echo($response->payment_details->paid_balance);
?>
