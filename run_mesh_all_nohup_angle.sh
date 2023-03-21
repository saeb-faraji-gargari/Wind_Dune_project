#!/bin/sh


for angle_parameter in 10 20 30 45 60 90 # 30    #4 1 2 

do

mkdir run_angle$angle_parameter

cp -r {0,system,constant,Allclean_bash.sh,Allrun_bash.sh,plot_gnuplot_residuals.sh}  run_angle$angle_parameter

cd run_angle$angle_parameter


sed -i "48s/.*/teta_wind_velocity_degree   $angle_parameter ;/" 0/include/initialConditions 


bash Allclean_bash.sh    #./Allclean


nohup sh Allrun_bash.sh &


nohup sh plot_gnuplot_residuals.sh &


cd ..

done
