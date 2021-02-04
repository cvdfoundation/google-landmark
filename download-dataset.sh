#!/bin/bash
# Copyright 2019 David Bishai.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Number of processes to run in parallel.
NUM_PROC=6

# Dataset split to download.
# Options: train, test, index.
SPLIT=$1

# Inclusive upper limit for file downloads. Should be set according to split:
# train --> 499.
# test --> 19.
# index --> 99.
N=$2

download_check_and_extract() {
  local i=$1
  images_file_name=images_$1.tar
  images_md5_file_name=md5.images_$1.txt
  images_tar_url=https://s3.amazonaws.com/google-landmark/$SPLIT/$images_file_name
  images_md5_url=https://s3.amazonaws.com/google-landmark/md5sum/$SPLIT/$images_md5_file_name
  echo "Downloading $images_file_name and its md5sum..."
  curl -Os $images_tar_url > /dev/null
  curl -Os $images_md5_url > /dev/null
  if [[ "$OSTYPE" == "linux-gnu" || "$OSTYPE" == "linux" ]]; then
    images_md5="$(md5sum "$images_file_name")"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    images_md5="$(md5 -r "$images_file_name")"
  fi
  md5_1="$(cut -d' ' -f1<<<"$images_md5")"
  md5_2="$(cut -d' ' -f1<<<cat "$images_md5_file_name")"
  if [[ "$md5_1" != "" && "$md5_1" = "$md5_2" ]]; then
    tar -xf ./$images_file_name
    echo "$images_file_name extracted!"
  else
    echo "MD5 checksum for $images_file_name did not match checksum in $images_md5_file_name"
  fi
}

for i in $(seq 0 $NUM_PROC $N); do
  upper=$(expr $i + $NUM_PROC - 1)
  limit=$(($upper>$N?$N:$upper))
  for j in $(seq -f "%03g" $i $limit); do download_check_and_extract "$j" & done
  wait
done
