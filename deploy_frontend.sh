#!/bin/bash

# Login to my aws ecr for the frontend.
$(aws ecr get-login --region us-east-1 --no-include-email)

# Stop the old container.
docker stop IssueTrackingFrontend

# Remove the old container.
docker rm IssueTrackingFrontend

# Remove the old image.
docker rmi 475640621870.dkr.ecr.us-east-1.amazonaws.com/issue-tracking-ecr-frontend:latest

# Download the new image.
# Note = the 'latest' tag is automatically moved to the most recently built image.
# There is not need to update this path with each new build. I tested it.
docker pull 475640621870.dkr.ecr.us-east-1.amazonaws.com/issue-tracking-ecr-frontend:latest

# Run new image.
docker run --restart unless-stopped --network host -td --name IssueTrackingFrontend 475640621870.dkr.ecr.us-east-1.amazonaws.com/issue-tracking-ecr-frontend:latest

