#!/bin/bash


INVENTORY= hosts

# Define the playbooks
PLAYBOOKS=(
  "nginx-playbook.yml"
  "mysql-playbook.yml"
  "redis-playbook.yml"
  "watchman-playbook.yml"
)


# Loop through the playbooks and run each one
for PLAYBOOK in "${PLAYBOOKS[@]}"
do
  echo "Running $PLAYBOOK..."
  ansible-playbook -i hosts $PLAYBOOK

  if [ $? -ne 0 ]; then
    echo "Error running $PLAYBOOK. Exiting."
    exit 1
  fi
done

echo "All playbooks executed successfully!"


