import three;
import settings;
size(20cm);

currentprojection=perspective(250,-250,250);
currentlight=Viewport;

triple[][][] Q={
  {
    {(39.68504,0,68.0315),(37.91339,0,71.75197),(40.74803,0,71.75197),(42.51969,0,68.0315)},
    {(39.68504,-22.22362,68.0315),(37.91339,-21.2315,71.75197),(40.74803,-22.8189,71.75197),(42.51969,-23.81102,68.0315)},
    {(22.22362,-39.68504,68.0315),(21.2315,-37.91339,71.75197),(22.8189,-40.74803,71.75197),(23.81102,-42.51969,68.0315)},
    {(0,-39.68504,68.0315),(0,-37.91339,71.75197),(0,-40.74803,71.75197),(0,-42.51969,68.0315)}
  },{
    {(0,-39.68504,68.0315),(0,-37.91339,71.75197),(0,-40.74803,71.75197),(0,-42.51969,68.0315)},
    {(-22.22362,-39.68504,68.0315),(-21.2315,-37.91339,71.75197),(-22.8189,-40.74803,71.75197),(-23.81102,-42.51969,68.0315)},
    {(-39.68504,-22.22362,68.0315),(-37.91339,-21.2315,71.75197),(-40.74803,-22.8189,71.75197),(-42.51969,-23.81102,68.0315)},
    {(-39.68504,0,68.0315),(-37.91339,0,71.75197),(-40.74803,0,71.75197),(-42.51969,0,68.0315)}
  },{
    {(-39.68504,0,68.0315),(-37.91339,0,71.75197),(-40.74803,0,71.75197),(-42.51969,0,68.0315)},
    {(-39.68504,22.22362,68.0315),(-37.91339,21.2315,71.75197),(-40.74803,22.8189,71.75197),(-42.51969,23.81102,68.0315)},
    {(-22.22362,39.68504,68.0315),(-21.2315,37.91339,71.75197),(-22.8189,40.74803,71.75197),(-23.81102,42.51969,68.0315)},
    {(0,39.68504,68.0315),(0,37.91339,71.75197),(0,40.74803,71.75197),(0,42.51969,68.0315)}
  },{
    {(0,39.68504,68.0315),(0,37.91339,71.75197),(0,40.74803,71.75197),(0,42.51969,68.0315)},
    {(22.22362,39.68504,68.0315),(21.2315,37.91339,71.75197),(22.8189,40.74803,71.75197),(23.81102,42.51969,68.0315)},
    {(39.68504,22.22362,68.0315),(37.91339,21.2315,71.75197),(40.74803,22.8189,71.75197),(42.51969,23.81102,68.0315)},
    {(39.68504,0,68.0315),(37.91339,0,71.75197),(40.74803,0,71.75197),(42.51969,0,68.0315)}
  },{
    {(42.51969,0,68.0315),(49.60629,0,53.1496),(56.69291,0,38.26771),(56.69291,0,25.51181)},
    {(42.51969,-23.81102,68.0315),(49.60629,-27.77952,53.1496),(56.69291,-31.74803,38.26771),(56.69291,-31.74803,25.51181)},
    {(23.81102,-42.51969,68.0315),(27.77952,-49.60629,53.1496),(31.74803,-56.69291,38.26771),(31.74803,-56.69291,25.51181)},
    {(0,-42.51969,68.0315),(0,-49.60629,53.1496),(0,-56.69291,38.26771),(0,-56.69291,25.51181)}
  },{
    {(0,-42.51969,68.0315),(0,-49.60629,53.1496),(0,-56.69291,38.26771),(0,-56.69291,25.51181)},
    {(-23.81102,-42.51969,68.0315),(-27.77952,-49.60629,53.1496),(-31.74803,-56.69291,38.26771),(-31.74803,-56.69291,25.51181)},
    {(-42.51969,-23.81102,68.0315),(-49.60629,-27.77952,53.1496),(-56.69291,-31.74803,38.26771),(-56.69291,-31.74803,25.51181)},
    {(-42.51969,0,68.0315),(-49.60629,0,53.1496),(-56.69291,0,38.26771),(-56.69291,0,25.51181)}
  },{
    {(-42.51969,0,68.0315),(-49.60629,0,53.1496),(-56.69291,0,38.26771),(-56.69291,0,25.51181)},
    {(-42.51969,23.81102,68.0315),(-49.60629,27.77952,53.1496),(-56.69291,31.74803,38.26771),(-56.69291,31.74803,25.51181)},
    {(-23.81102,42.51969,68.0315),(-27.77952,49.60629,53.1496),(-31.74803,56.69291,38.26771),(-31.74803,56.69291,25.51181)},
    {(0,42.51969,68.0315),(0,49.60629,53.1496),(0,56.69291,38.26771),(0,56.69291,25.51181)}
  },{
    {(0,42.51969,68.0315),(0,49.60629,53.1496),(0,56.69291,38.26771),(0,56.69291,25.51181)},
    {(23.81102,42.51969,68.0315),(27.77952,49.60629,53.1496),(31.74803,56.69291,38.26771),(31.74803,56.69291,25.51181)},
    {(42.51969,23.81102,68.0315),(49.60629,27.77952,53.1496),(56.69291,31.74803,38.26771),(56.69291,31.74803,25.51181)},
    {(42.51969,0,68.0315),(49.60629,0,53.1496),(56.69291,0,38.26771),(56.69291,0,25.51181)}
  },{
    {(56.69291,0,25.51181),(56.69291,0,12.7559),(42.51969,0,6.377957),(42.51969,0,4.251961)},
    {(56.69291,-31.74803,25.51181),(56.69291,-31.74803,12.7559),(42.51969,-23.81102,6.377957),(42.51969,-23.81102,4.251961)},
    {(31.74803,-56.69291,25.51181),(31.74803,-56.69291,12.7559),(23.81102,-42.51969,6.377957),(23.81102,-42.51969,4.251961)},
    {(0,-56.69291,25.51181),(0,-56.69291,12.7559),(0,-42.51969,6.377957),(0,-42.51969,4.251961)}
  },{
    {(0,-56.69291,25.51181),(0,-56.69291,12.7559),(0,-42.51969,6.377957),(0,-42.51969,4.251961)},
    {(-31.74803,-56.69291,25.51181),(-31.74803,-56.69291,12.7559),(-23.81102,-42.51969,6.377957),(-23.81102,-42.51969,4.251961)},
    {(-56.69291,-31.74803,25.51181),(-56.69291,-31.74803,12.7559),(-42.51969,-23.81102,6.377957),(-42.51969,-23.81102,4.251961)},
    {(-56.69291,0,25.51181),(-56.69291,0,12.7559),(-42.51969,0,6.377957),(-42.51969,0,4.251961)}
  },{
    {(-56.69291,0,25.51181),(-56.69291,0,12.7559),(-42.51969,0,6.377957),(-42.51969,0,4.251961)},
    {(-56.69291,31.74803,25.51181),(-56.69291,31.74803,12.7559),(-42.51969,23.81102,6.377957),(-42.51969,23.81102,4.251961)},
    {(-31.74803,56.69291,25.51181),(-31.74803,56.69291,12.7559),(-23.81102,42.51969,6.377957),(-23.81102,42.51969,4.251961)},
    {(0,56.69291,25.51181),(0,56.69291,12.7559),(0,42.51969,6.377957),(0,42.51969,4.251961)}
  },{
    {(0,56.69291,25.51181),(0,56.69291,12.7559),(0,42.51969,6.377957),(0,42.51969,4.251961)},
    {(31.74803,56.69291,25.51181),(31.74803,56.69291,12.7559),(23.81102,42.51969,6.377957),(23.81102,42.51969,4.251961)},
    {(56.69291,31.74803,25.51181),(56.69291,31.74803,12.7559),(42.51969,23.81102,6.377957),(42.51969,23.81102,4.251961)},
    {(56.69291,0,25.51181),(56.69291,0,12.7559),(42.51969,0,6.377957),(42.51969,0,4.251961)}
  },{
    {(-45.35433,0,57.40157),(-65.19685,0,57.40157),(-76.53543,0,57.40157),(-76.53543,0,51.02362)},
    {(-45.35433,-8.503932,57.40157),(-65.19685,-8.503932,57.40157),(-76.53543,-8.503932,57.40157),(-76.53543,-8.503932,51.02362)},
    {(-42.51969,-8.503932,63.77952),(-70.86614,-8.503932,63.77952),(-85.03937,-8.503932,63.77952),(-85.03937,-8.503932,51.02362)},
    {(-42.51969,0,63.77952),(-70.86614,0,63.77952),(-85.03937,0,63.77952),(-85.03937,0,51.02362)}
  },{
    {(-42.51969,0,63.77952),(-70.86614,0,63.77952),(-85.03937,0,63.77952),(-85.03937,0,51.02362)},
    {(-42.51969,8.503932,63.77952),(-70.86614,8.503932,63.77952),(-85.03937,8.503932,63.77952),(-85.03937,8.503932,51.02362)},
    {(-45.35433,8.503932,57.40157),(-65.19685,8.503932,57.40157),(-76.53543,8.503932,57.40157),(-76.53543,8.503932,51.02362)},
    {(-45.35433,0,57.40157),(-65.19685,0,57.40157),(-76.53543,0,57.40157),(-76.53543,0,51.02362)}
  },{
    {(-76.53543,0,51.02362),(-76.53543,0,44.64566),(-70.86614,0,31.88976),(-56.69291,0,25.51181)},
    {(-76.53543,-8.503932,51.02362),(-76.53543,-8.503932,44.64566),(-70.86614,-8.503932,31.88976),(-56.69291,-8.503932,25.51181)},
    {(-85.03937,-8.503932,51.02362),(-85.03937,-8.503932,38.26771),(-75.11811,-8.503932,26.5748),(-53.85826,-8.503932,17.00787)},
    {(-85.03937,0,51.02362),(-85.03937,0,38.26771),(-75.11811,0,26.5748),(-53.85826,0,17.00787)}
  },{
    {(-85.03937,0,51.02362),(-85.03937,0,38.26771),(-75.11811,0,26.5748),(-53.85826,0,17.00787)},
    {(-85.03937,8.503932,51.02362),(-85.03937,8.503932,38.26771),(-75.11811,8.503932,26.5748),(-53.85826,8.503932,17.00787)},
    {(-76.53543,8.503932,51.02362),(-76.53543,8.503932,44.64566),(-70.86614,8.503932,31.88976),(-56.69291,8.503932,25.51181)},
    {(-76.53543,0,51.02362),(-76.53543,0,44.64566),(-70.86614,0,31.88976),(-56.69291,0,25.51181)}
  },{
    {(48.18897,0,40.3937),(73.70078,0,40.3937),(65.19685,0,59.52755),(76.53543,0,68.0315)},
    {(48.18897,-18.70866,40.3937),(73.70078,-18.70866,40.3937),(65.19685,-7.086619,59.52755),(76.53543,-7.086619,68.0315)},
    {(48.18897,-18.70866,17.00787),(87.87401,-18.70866,23.38582),(68.0315,-7.086619,57.40157),(93.5433,-7.086619,68.0315)},
    {(48.18897,0,17.00787),(87.87401,0,23.38582),(68.0315,0,57.40157),(93.5433,0,68.0315)}
  },{
    {(48.18897,0,17.00787),(87.87401,0,23.38582),(68.0315,0,57.40157),(93.5433,0,68.0315)},
    {(48.18897,18.70866,17.00787),(87.87401,18.70866,23.38582),(68.0315,7.086619,57.40157),(93.5433,7.086619,68.0315)},
    {(48.18897,18.70866,40.3937),(73.70078,18.70866,40.3937),(65.19685,7.086619,59.52755),(76.53543,7.086619,68.0315)},
    {(48.18897,0,40.3937),(73.70078,0,40.3937),(65.19685,0,59.52755),(76.53543,0,68.0315)}
  },{
    {(76.53543,0,68.0315),(79.37007,0,70.15748),(82.20472,0,70.15748),(79.37007,0,68.0315)},
    {(76.53543,-7.086619,68.0315),(79.37007,-7.086619,70.15748),(82.20472,-4.251961,70.15748),(79.37007,-4.251961,68.0315)},
    {(93.5433,-7.086619,68.0315),(99.92125,-7.086619,70.68897),(97.79527,-4.251961,71.22047),(90.70866,-4.251961,68.0315)},
    {(93.5433,0,68.0315),(99.92125,0,70.68897),(97.79527,0,71.22047),(90.70866,0,68.0315)}
  },{
    {(93.5433,0,68.0315),(99.92125,0,70.68897),(97.79527,0,71.22047),(90.70866,0,68.0315)},
    {(93.5433,7.086619,68.0315),(99.92125,7.086619,70.68897),(97.79527,4.251961,71.22047),(90.70866,4.251961,68.0315)},
    {(76.53543,7.086619,68.0315),(79.37007,7.086619,70.15748),(82.20472,4.251961,70.15748),(79.37007,4.251961,68.0315)},
    {(76.53543,0,68.0315),(79.37007,0,70.15748),(82.20472,0,70.15748),(79.37007,0,68.0315)}
  },{
    {(0,0,89.29133),(22.67716,0,89.29133),(0,0,80.7874),(5.669294,0,76.53543)},
    {(0,0,89.29133),(22.67716,-12.7559,89.29133),(0,0,80.7874),(5.669294,-3.174809,76.53543)},
    {(0,0,89.29133),(12.7559,-22.67716,89.29133),(0,0,80.7874),(3.174809,-5.669294,76.53543)},
    {(0,0,89.29133),(0,-22.67716,89.29133),(0,0,80.7874),(0,-5.669294,76.53543)}
  },{
    {(0,0,89.29133),(0,-22.67716,89.29133),(0,0,80.7874),(0,-5.669294,76.53543)},
    {(0,0,89.29133),(-12.7559,-22.67716,89.29133),(0,0,80.7874),(-3.174809,-5.669294,76.53543)},
    {(0,0,89.29133),(-22.67716,-12.7559,89.29133),(0,0,80.7874),(-5.669294,-3.174809,76.53543)},
    {(0,0,89.29133),(-22.67716,0,89.29133),(0,0,80.7874),(-5.669294,0,76.53543)}
  },{
    {(0,0,89.29133),(-22.67716,0,89.29133),(0,0,80.7874),(-5.669294,0,76.53543)},
    {(0,0,89.29133),(-22.67716,12.7559,89.29133),(0,0,80.7874),(-5.669294,3.174809,76.53543)},
    {(0,0,89.29133),(-12.7559,22.67716,89.29133),(0,0,80.7874),(-3.174809,5.669294,76.53543)},
    {(0,0,89.29133),(0,22.67716,89.29133),(0,0,80.7874),(0,5.669294,76.53543)}
  },{
    {(0,0,89.29133),(0,22.67716,89.29133),(0,0,80.7874),(0,5.669294,76.53543)},
    {(0,0,89.29133),(12.7559,22.67716,89.29133),(0,0,80.7874),(3.174809,5.669294,76.53543)},
    {(0,0,89.29133),(22.67716,12.7559,89.29133),(0,0,80.7874),(5.669294,3.174809,76.53543)},
    {(0,0,89.29133),(22.67716,0,89.29133),(0,0,80.7874),(5.669294,0,76.53543)}
  },{
    {(5.669294,0,76.53543),(11.33858,0,72.28346),(36.85039,0,72.28346),(36.85039,0,68.0315)},
    {(5.669294,-3.174809,76.53543),(11.33858,-6.349609,72.28346),(36.85039,-20.63622,72.28346),(36.85039,-20.63622,68.0315)},
    {(3.174809,-5.669294,76.53543),(6.349609,-11.33858,72.28346),(20.63622,-36.85039,72.28346),(20.63622,-36.85039,68.0315)},
    {(0,-5.669294,76.53543),(0,-11.33858,72.28346),(0,-36.85039,72.28346),(0,-36.85039,68.0315)}
  },{
    {(0,-5.669294,76.53543),(0,-11.33858,72.28346),(0,-36.85039,72.28346),(0,-36.85039,68.0315)},
    {(-3.174809,-5.669294,76.53543),(-6.349609,-11.33858,72.28346),(-20.63622,-36.85039,72.28346),(-20.63622,-36.85039,68.0315)},
    {(-5.669294,-3.174809,76.53543),(-11.33858,-6.349609,72.28346),(-36.85039,-20.63622,72.28346),(-36.85039,-20.63622,68.0315)},
    {(-5.669294,0,76.53543),(-11.33858,0,72.28346),(-36.85039,0,72.28346),(-36.85039,0,68.0315)},
  },{
    {(-5.669294,0,76.53543),(-11.33858,0,72.28346),(-36.85039,0,72.28346),(-36.85039,0,68.0315)},
    {(-5.669294,3.174809,76.53543),(-11.33858,6.349609,72.28346),(-36.85039,20.63622,72.28346),(-36.85039,20.63622,68.0315)},
    {(-3.174809,5.669294,76.53543),(-6.349609,11.33858,72.28346),(-20.63622,36.85039,72.28346),(-20.63622,36.85039,68.0315)},
    {(0,5.669294,76.53543),(0,11.33858,72.28346),(0,36.85039,72.28346),(0,36.85039,68.0315)}
  },{
    {(0,5.669294,76.53543),(0,11.33858,72.28346),(0,36.85039,72.28346),(0,36.85039,68.0315)},
    {(3.174809,5.669294,76.53543),(6.349609,11.33858,72.28346),(20.63622,36.85039,72.28346),(20.63622,36.85039,68.0315)},
    {(5.669294,3.174809,76.53543),(11.33858,6.349609,72.28346),(36.85039,20.63622,72.28346),(36.85039,20.63622,68.0315)},
    {(5.669294,0,76.53543),(11.33858,0,72.28346),(36.85039,0,72.28346),(36.85039,0,68.0315)},
  },{
    {(0,0,0),(40.3937,0,0),(42.51969,0,2.12598),(42.51969,0,4.251961)},
    {(0,0,0),(40.3937,22.62047,0),(42.51969,23.81102,2.12598),(42.51969,23.81102,4.251961)},
    {(0,0,0),(22.62047,40.3937,0),(23.81102,42.51969,2.12598),(23.81102,42.51969,4.251961)},
    {(0,0,0),(0,40.3937,0),(0,42.51969,2.12598),(0,42.51969,4.251961)}
  },{
    {(0,0,0),(0,40.3937,0),(0,42.51969,2.12598),(0,42.51969,4.251961)},
    {(0,0,0),(-22.62047,40.3937,0),(-23.81102,42.51969,2.12598),(-23.81102,42.51969,4.251961)},
    {(0,0,0),(-40.3937,22.62047,0),(-42.51969,23.81102,2.12598),(-42.51969,23.81102,4.251961)},
    {(0,0,0),(-40.3937,0,0),(-42.51969,0,2.12598),(-42.51969,0,4.251961)}
  },{
    {(0,0,0),(-40.3937,0,0),(-42.51969,0,2.12598),(-42.51969,0,4.251961)},
    {(0,0,0),(-40.3937,-22.62047,0),(-42.51969,-23.81102,2.12598),(-42.51969,-23.81102,4.251961)},
    {(0,0,0),(-22.62047,-40.3937,0),(-23.81102,-42.51969,2.12598),(-23.81102,-42.51969,4.251961)},
    {(0,0,0),(0,-40.3937,0),(0,-42.51969,2.12598),(0,-42.51969,4.251961)}
  },{
    {(0,0,0),(0,-40.3937,0),(0,-42.51969,2.12598),(0,-42.51969,4.251961)},
    {(0,0,0),(22.62047,-40.3937,0),(23.81102,-42.51969,2.12598),(23.81102,-42.51969,4.251961)},
    {(0,0,0),(40.3937,-22.62047,0),(42.51969,-23.81102,2.12598),(42.51969,-23.81102,4.251961)},
    {(0,0,0),(40.3937,0,0),(42.51969,0,2.12598),(42.51969,0,4.251961)}
  }
};

draw(surface(Q),material(blue, shininess=0.85, metallic=0),render(compression=Low));
