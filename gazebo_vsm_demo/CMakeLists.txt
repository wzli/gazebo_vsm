cmake_minimum_required(VERSION 2.8.3)
project(gazebo_vsm_demo)

set(PKG_DEPS
  roscpp
  actionlib
  std_srvs
  move_base_msgs
)

find_package(catkin REQUIRED COMPONENTS
  ${PKG_DEPS}
)

###################################
## catkin specific configuration ##
###################################
catkin_package(
  INCLUDE_DIRS
  LIBRARIES
  CATKIN_DEPENDS
    ${PKG_DEPS}
)

###########
## Build ##
###########

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(random_walk src/random_walk.cpp)
target_link_libraries(random_walk ${catkin_LIBRARIES})

#############
## Install ##
#############

install(TARGETS random_walk
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch/ config/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)
