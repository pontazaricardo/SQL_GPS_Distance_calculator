# SQL_GPS_Distance_calculator

This is an example of how to calculate the distance between two GPS coordinates as a function in MySQL.

## Formula

For calculating the distance of the two given GPS coordinates, we use the [Harversine formula](https://en.wikipedia.org/wiki/Haversine_formula).

## Usage

In order to use the distance function, just type 

```sql
select DISTANCE(24.784734,120.995724,24.785498,120.996633,'KM');
```