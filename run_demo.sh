#### Run demo: normal mode ####

## TUM Dataset
./Examples/Monocular/mono_tum Vocabulary/ORBvoc.txt Examples/Monocular/TUM1.yaml /home/yuehua/ORB_DATA/rgbd_dataset_freiburg1_xyz
./Examples/Monocular/mono_tum Vocabulary/ORBvoc.txt Examples/Monocular/TUM1.yaml ../ORB_DATA/rgbd_dataset_freiburg1_desk

## KITTI 数据集
#./Examples/Monocular/mono_kitti Vocabulary/ORBvoc.txt Examples/Monocular/KITTI00-02.yaml ../ORB_DATA/KITTI/sequences/00
#./Examples/Stereo/stereo_kitti Vocabulary/ORBvoc.txt Examples/Stereo/KITTI00-02.yaml ../ORB_DATA/KITTI/sequences/00

## EuRoC 数据集
# ./Examples/Monocular/mono_euroc Vocabulary/ORBvoc.txt Examples/Monocular/EuRoC.yaml ../ORB_DATA/MH_01_easy/mav0/cam0/data Examples/Monocular/EuRoC_TimeStamps/MH01.txt 
# ./Examples/Stereo/stereo_euroc Vocabulary/ORBvoc.txt Examples/Stereo/EuRoC.yaml ../ORB_DATA/MH_01_easy/mav0/cam0/data ../ORB_DATA/MH_01_easy/mav0/cam1/data Examples/Monocular/EuRoC_TimeStamps/MH01.txt

## RGB-D
## !需要通过 associate.py 脚本对 rgb图和 depth图做一下匹配. demo运行后生成 CameraTrajectory.txt 记录轨迹
## python associate.py PATH_TO_SEQUENCE/rgb.txt PATH_TO_SEQUENCE/depth.txt > associations.txt

# python associate.py ../ORB_DATA/rgbd_dataset_freiburg1_xyz/rgb.txt ../ORB_DATA/rgbd_dataset_freiburg1_xyz/depth.txt > associations.txt
# mv ./associations.txt ../ORB_DATA/rgbd_dataset_freiburg1_xyz/
# ./Examples/RGB-D/rgbd_tum Vocabulary/ORBvoc.txt Examples/RGB-D/TUM1.yaml ../ORB_DATA/rgbd_dataset_freiburg1_xyz  ../ORB_DATA/rgbd_dataset_freiburg1_xyz/associations.txt

### Run demo: ros mode ####

## !在运行 slam node 或 play rosbag 时设置 ros topic 名字的转化
## rosrun  <package_name>  <node_name>  original_topic:=new_topic
## rosbag play <bag_name> original_topic:=new_topic

## TUM 数据集的rosbag, "/camera/rgb/image_color 转换为 /camera/image_raw"
roscore
rosrun ORB_SLAM2 Mono Vocabulary/ORBvoc.txt Examples/Monocular/TUM1.yaml 
rosbag play ../ORB_DATA/rgbd_dataset_freiburg1_xyz.bag /camera/rgb/image_color:=/camera/image_raw
# 单目AR
# roscore 
# rosrun ORB_SLAM2 MonoAR Vocabulary/ORBvoc.txt Examples/Monocular/TUM1.yaml 
# rosbag play ../ORB_DATA/rgbd_dataset_freiburg1_xyz.bag /camera/rgb/image_color:=/camera/image_raw
# RGB-D
# !需要修改 Examples/RGB-D/TUM1.yaml 中的参数 DepthMapFactor 修改为 1
# roscore 
# rosrun ORB_SLAM2 RGBD Vocabulary/ORBvoc.txt Examples/RGB-D/TUM1.yaml
# rosbag play --pause ../ORB_DATA/rgbd_dataset_freiburg1_xyz.bag /camera/rgb/image_color:=/camera/rgb/image_raw /camera/depth/image:=/camera/depth_registered/image_raw

## EuRoC 数据集
# roscore
# rosrun ORB_SLAM2 Stereo Vocabulary/ORBvoc.txt Examples/Stereo/EuRoC.yaml true
# rosbag play --pause MH_01_easy.bag /cam0/image_raw:=/camera/left/image_raw /cam1/image_raw:=/camera/right/image_raw