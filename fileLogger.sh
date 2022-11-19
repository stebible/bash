#!/bin/bash

FOLDER="/home/vagrant/projectFolder"


ls -l $FOLDER | awk '{print $8,$9}' > logs
