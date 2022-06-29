### normal mode ####

# cd ~/ORB_SLAM2
chmod +x build.sh
./build.sh

### ros mode ####

## 编译找不到包时,向ROS_PACKAGE_PATH中添加路径
# sudo gedit /opt/ros/melodic/setup.bash
# export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:<PATH>/ORB_SLAM2/Examples/ROS
# source /opt/ros/melodic/setup.bash
# echo $ROS_PACKAGE_PATH  # 检查ros环境路径是否设置成功

# gedit ~/.bashrc
# export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:<PATH>/ORB_SLAM2/Examples/ROS
# source ~/.bashrc

chmod +x build_ros.sh
./build_ros.sh