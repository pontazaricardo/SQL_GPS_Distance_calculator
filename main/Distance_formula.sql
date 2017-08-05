CREATE DEFINER=`root`@`localhost` FUNCTION `DISTANCE`( latitude1 DOUBLE, longitude1 DOUBLE, latitude2 DOUBLE, longitude2 DOUBLE, unit ENUM( 'MILE', 'KILOMETER', 'MI', 'KM' ) ) RETURNS double
BEGIN
  DECLARE dist    DOUBLE;
  DECLARE latDist DOUBLE;
  DECLARE lonDist DOUBLE;
  DECLARE a,c,r   DOUBLE;

  # We first set the Earths radius
  IF unit = 'MILE' OR unit = 'MI' THEN SET r = 3959;
  ELSE SET r = 6371;
  END IF;
  
  # Now we use Haversine formula.
  SET latDist = RADIANS( latitude2 - latitude1 );
  SET lonDist = RADIANS( longitude2 - longitude1 );
  SET a = POW( SIN( latDist/2 ), 2 ) + COS( RADIANS( latitude1 ) ) * COS( RADIANS( latitude2 ) ) * POW( SIN( lonDist / 2 ), 2 );
  SET c = 2 * ATAN2( SQRT( a ), SQRT( 1 - a ) );
  SET dist = r * c;  
  
  RETURN dist;
END