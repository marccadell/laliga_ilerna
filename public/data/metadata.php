<?php
require '../../api/api.php';

$metadata = get_api_metadata();

header('Content-Type: application/json');
echo json_encode($metadata);
exit;
