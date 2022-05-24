<?php
$paths  = glob( 'images/*/*' );
$return = array();
foreach ( $paths as $path ) {
	$image_name    = basename( dirname( $path ) );
	$image_version = basename( $path );
	if ( in_array( $image_version, array( 'README.md' ), true ) ) {
		continue;
	}
	
	if(is_dir($path)){
		continue;
	}
	
	$return[]      = array(
		'name' => $image_name ,
		'file' => $image_name . '/' . $image_version,
	);
}

$return = json_encode( $return );

echo "::set-output name=dockerinfo::$return";

echo $return;
