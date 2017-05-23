<?php
$path = __DIR__ . DIRECTORY_SEPARATOR . ltrim(parse_url($_SERVER['REQUEST_URI'])['path'], '/');

if (file_exists($path) && !is_dir($path)) {
	return false;
}

if (file_exists($path . '/index.php')) {
	require $path . '/index.php';
  return;
}

require __DIR__ . '/index.php';
