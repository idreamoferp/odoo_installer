# CMake generated Testfile for 
# Source directory: /var/lib/cloud9/install_helpers/opencv/modules/video
# Build directory: /var/lib/cloud9/install_helpers/opencv/build/modules/video
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_video "/var/lib/cloud9/install_helpers/opencv/build/bin/opencv_test_video" "--gtest_output=xml:opencv_test_video.xml")
set_tests_properties(opencv_test_video PROPERTIES  LABELS "Main;opencv_video;Accuracy" WORKING_DIRECTORY "/var/lib/cloud9/install_helpers/opencv/build/test-reports/accuracy")
add_test(opencv_perf_video "/var/lib/cloud9/install_helpers/opencv/build/bin/opencv_perf_video" "--gtest_output=xml:opencv_perf_video.xml")
set_tests_properties(opencv_perf_video PROPERTIES  LABELS "Main;opencv_video;Performance" WORKING_DIRECTORY "/var/lib/cloud9/install_helpers/opencv/build/test-reports/performance")
add_test(opencv_sanity_video "/var/lib/cloud9/install_helpers/opencv/build/bin/opencv_perf_video" "--gtest_output=xml:opencv_perf_video.xml" "--perf_min_samples=1" "--perf_force_samples=1" "--perf_verify_sanity")
set_tests_properties(opencv_sanity_video PROPERTIES  LABELS "Main;opencv_video;Sanity" WORKING_DIRECTORY "/var/lib/cloud9/install_helpers/opencv/build/test-reports/sanity")
