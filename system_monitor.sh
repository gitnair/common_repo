#!/bin/bash
#
# Function to display CPU Load
display_cpu_load() {
  echo "=== CPU Load ==="
  top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 + $4 "%"}'
  echo "CPU Cores: $(nproc) logical cores"
}

# Function to display Memory Usage
display_memory_usage() {
  echo -e "\n=== Memory Usage ==="
  free -h | awk '/^Mem:/ {print "Total: " $2, "\nUsed: " $3, "\nFree: " $4, "\nUsage: " $3/$2*100 "%"}'
}

# Function to display Disk Usage
display_disk_usage() {
  echo -e "\n=== Disk Usage ==="
  df -h | awk '{if (NR==1 || $NF=="/") print $0}'
}

# Function to display Network Usage
display_network_usage() {
  echo -e "\n=== Network Usage ==="
  ifconfig | grep -A 3 'flags' | awk '/RX packets/ {print "Received Packets: " $3} /TX packets/ {print "Transmitted Packets: " $3}'
}

# Function to display Active Logged-In Users
display_active_users() {
  echo -e "\n=== Active Logged-In Users ==="
  who | awk '{print "User: " $1 ", Terminal: " $2 ", Login Time: " $3, $4}'
}

# Main Function
main() {
  echo "System Monitor"
  echo "=============="
  display_cpu_load
  display_memory_usage
  display_disk_usage
  display_network_usage
  display_active_users
}

# Execute the main function
main

