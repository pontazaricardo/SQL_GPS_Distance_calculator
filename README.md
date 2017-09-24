# SQL_GPS_Distance_calculator

This is an example of how to calculate the distance between two GPS coordinates as a function in MySQL.

![runtime](/images/image_distance_gps.png?raw=true)

## Formula

For calculating the distance of the two given GPS coordinates, we use the [Harversine formula](https://en.wikipedia.org/wiki/Haversine_formula).

## Usage

In order to use the distance function, just type 

```sql
select DISTANCE(24.784734,120.995724,24.785498,120.996633,'KM');
```
which will return a table with one entry with the requested value.

## Distance options

This function can take the following measure of units as inputs:
1. Kilometers: Type *'KILOMETER'* or *'KM'* as input.
2. Miles:  Type *'MILE'* or *'MI'* as input.

## Example

If just want to measure the distace between two GPS coordinates, use a *SELECT* statement.
```sql
select DISTANCE(24.784734,120.995724,24.785498,120.996633,'KM');
select DISTANCE(24.784734,120.995724,24.785498,120.996633,'MI');
```

## Usage in stored procedures or functions

Because the function returns a unique number, it can be used inside functions and stored procedures as follows
```sql
if distance(user1_gps_latitude,users1_gps_longitude,user2_gps_latitude,users2_gps_longitude,'KM')<0.09 then
	# Insert your code here
end if;
```

![runtime](/images/image_distance_gps.png?raw=true)