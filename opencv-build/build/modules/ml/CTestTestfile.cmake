# CMake generated Testfile for 
# Source directory: /var/lib/cloud9/install_helpers/opencv/modules/ml
# Build directory: /var/lib/cloud9/install_helpers/opencv/build/modules/ml
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_ml "/var/lib/cloud9/install_helpers/opencv/build/bin/opencv_test_ml" "--gtest_output=xml:opencv_test_ml.xml")
set_tests_properties(opencv_test_ml PROPERTIES  LABELS "Main;opencv_ml;Accuracy" WORKING_DIRECTORY "/var/lib/cloud9/install_helpers/opencv/build/test-reports/accuracy")
