cd /home/edigley/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres
gdal_rasterize -a_srs EPSG:4326 -tr 30 30 -burn 1 ignition.shp raster1.tiff
gdal_translate -a_srs EPSG:4326 -a_nodata 0 -of GTiff raster1.tiff raster1.asc
gdal_rasterize -a_srs EPSG:4326 -a id -tr 30 30 jonquera_shape_polygon.shp raster2.tiff
gdal_translate -a_srs EPSG:4326 -a_nodata 0 -of GTiff raster2.tiff raster2.asc


cd /home/edigley/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres/conversion
gdal_rasterize -a_srs EPSG:4326 -ts 1612 1125 -burn 2 ignition_perimeter.shp perimeter_1.tif
gdal_translate -a_srs EPSG:4326 -a_nodata -1 -of GTiff perimeter_1.tif perimeter_1.asc
gdal_rasterize -a_srs EPSG:4326 -ts 1612 1125 -burn 8 jonquera_shape_polygon.shp perimeter_2.tif
gdal_translate -a_srs EPSG:4326 -a_nodata -1 -of GTiff perimeter_2.tif perimeter_2.asc
gdal_rasterize -a_srs EPSG:4326 -ts 1612 1125 -burn 12 perimeter_3.shp perimeter_3.tif
gdal_translate -a_srs EPSG:4326 -a_nodata -1 -of GTiff perimeter_3.tif perimeter_3.asc


gdal_translate -of GRASSASCIIGrid perimeter_2.asc p2.asc


cd /home/edigley/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres/
gdal_translate -of AAIGrid perimeter_2.asc per2.asc
gdal_translate -of AAIGrid perimeter_1.asc per1.asc
xargs -n1 < per1.asc > per_1.asc
pico per_1.asc
	north:    4709048.300000
	south:    4675298.300000
	east:     528809.500000
	west:     480449.500000
	rows:     1125
	cols:     1612
sed -i "s/0.99799999999999999822/1/g" per_1.asc
sed -i "s/0/-1/g" per_1.asc
edigley@cariri:~/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres$ sort -u per_1.asc 
1
-1
cols:     1612
east:     528809.500000
north:    4709048.300000
rows:     1125
south:    4675298.300000
west:     480449.500000
edigley@cariri:~/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres$ 


gdal_rasterize -a_srs EPSG:4326 -tr 30 30 -burn 0.998 ignition.shp raster1.tiff
gdal_translate -a_srs EPSG:4326 -a_nodata 0 -of GTiff raster1.tiff raster1.asc
gdal_rasterize -a_srs EPSG:4326 -tr 30 30 jonquera_shape_polygon.shp raster2.tiff
gdal_translate -a_srs EPSG:4326 -a_nodata 0 -of GTiff raster2.tiff raster2.asc


gdalinfo /home/edigley/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres/per2.asc

gdalinfo /home/edigley/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/perimetres/perimeter_2.asc
Driver: GTiff/GeoTIFF
gdalinfo /home/edigley/doutorado_uab/so_oh_leite/two_stage_prediction_framework/jonquera/output/raster_32530_0.toa
Driver: GRASSASCIIGrid/GRASS ASCII Grid


