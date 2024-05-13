#!/bin/bash
set -e

echo -e "\033[36m• Downloading commonapi_core_generator ...\033[0m"
wget https://github.com/COVESA/capicxx-core-tools/releases/download/3.2.14/commonapi_core_generator.zip
unzip commonapi_core_generator.zip -d commonapi_core_generator

echo -e "\033[36m• Downloading commonapi_someip_generator ...\033[0m"
wget https://github.com/COVESA/capicxx-someip-tools/releases/download/3.2.14/commonapi_someip_generator.zip
unzip commonapi_someip_generator.zip -d commonapi_someip_generator
