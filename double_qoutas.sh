#!/bin/bash
sed -i -E 's/pxf:\/\/\\"/pxf:\/\/"/g' $1
sed -i -E 's/\\"\.\\"/"."/g' $1
sed -i -E 's/\.\\"/."/g' $1
sed -i -E 's/\\"\?PROFILE/"?PROFILE/ig' $1
#sed -i -E 's/pxf:\/\/\\"(.+)\\"\.\\"/pxf:\/\/"$1/g' $1
