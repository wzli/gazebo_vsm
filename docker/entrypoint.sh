#!/bin/bash

export VSM_ADDRESS=${VSM_ADDRESS:-$(hostname -i)}
export VSM_PORT=${VSM_PORT:-11511}
export VSM_BOOTSTRAP_PEER=${VSM_BOOTSTRAP_PEER:-${VSM_ADDRESS%.*}.2:$VSM_PORT}

NODE_ID=$((${VSM_ADDRESS##*.} - 2))
export VSM_NAME=${VSM_NAME:-jersey_barrier_$NODE_ID}

(cd ${GZWEB_WS}; npm start) &
source ${CATKIN_WS}/devel/setup.bash
roslaunch gazebo_vsm_demo gazebo_vsm_demo.launch
