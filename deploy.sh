#!/bin/bash

# deploy.sh

# Check if the environment parameter is provided
if [ -z "$1" ]; then
    echo "Error: Please provide the environment (e.g., cat or prod)"
    exit 1
fi

ENVIRONMENT=$1

echo "Deploying to $ENVIRONMENT environment"

# Add deployment steps for the specified environment
if [ "$ENVIRONMENT" == "cat" ]; then
    # Add cat deployment steps here
    echo "Deploying to cat environment..."
    
    # Git commands for cat deployment
    echo "Adding changes for cat environment..."
    git add .
    git commit -m "Cat deployment"
    git push origin cat  # Assuming you have a 'cat' branch for cat environment
    
elif [ "$ENVIRONMENT" == "prod" ]; then
    # Add prod deployment steps here (excluding Helm folder)
    echo "Deploying to prod environment..."
    
    # Exclude Helm folder during production deployment
    echo "Excluding Helm folder for production deployment..."
    echo "Excluding Helm folder for production deployment..."
    rsync -a --exclude='helm/' ./ ./    
    # Git commands for production deployment
    git checkout prod
    echo "Adding changes for prod environment..."
    git add .
    git commit -m "Production deployment"
    git push origin prod  # Assuming you are pushing to the master branch
else
    echo "Error: Invalid environment specified"
    exit 1
fi

echo "Deployment completed successfully"
