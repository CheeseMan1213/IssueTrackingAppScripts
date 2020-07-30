#!/bin/bash

# Login to my aws ecr for the backend.
$(aws ecr get-login --region us-east-1 --no-include-email)

# Stop the old container.
docker stop IssueTrackingBackend

# Remove the old container.
docker rm IssueTrackingBackend

# Remove the old image.
docker rmi 475640621870.dkr.ecr.us-east-1.amazonaws.com/issue-tracking-ecr-backend:latest

# Download the new image.
# Note = the 'latest' tag is automatically moved to the most recently built image.
# There is not need to update this path with each new build. I tested it.
docker pull 475640621870.dkr.ecr.us-east-1.amazonaws.com/issue-tracking-ecr-backend:latest

# Run new image.
docker run --restart unless-stopped --network host -td --name IssueTrackingBackend 475640621870.dkr.ecr.us-east-1.amazonaws.com/issue-tracking-ecr-backend:latest

