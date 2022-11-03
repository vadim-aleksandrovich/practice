#!/bin/bash

filename="docker-compose.yml"
version_line="image: postgres:"
shared_buffers_line="shared_buffers="
effective_cache_size_line="effective_cache_size="

read -p "Please, enter Postgres version: " version_var
read -p "Please, enter total size of RAM(GB): "  total_ram_var

postgres_ram=$(( $total_ram_var * 1000 / 4))

buffers_var="$(( $postgres_ram / 4 ))MB"
echo "Shared buffers: $buffers_var"

cache_var="$(( $postgres_ram / 4 * 3))MB"
echo "Effective cache size: $cache_var"

sed -i "s/$version_line/$version_line$version_var/" $filename # Set Postgres version
sed -i "s/$shared_buffers_line/$shared_buffers_line$buffers_var/" $filename # Set Shared buffers
sed -i "s/$effective_cache_size_line/$effective_cache_size_line$cache_var/" $filename # Set Effective cache size

echo "docker-compose build..."
docker-compose build

echo "builded"

docker-compose up -d

sed -i "s/$version_line$version_var/$version_line/" $filename
sed -i "s/$shared_buffers_line$buffers_var/$shared_buffers_line/" $filename
sed -i "s/$effective_cache_size_line$cache_var/$effective_cache_size_line/" $filename