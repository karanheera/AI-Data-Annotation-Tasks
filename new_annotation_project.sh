#!/bin/bash

# Base directory of your repo
BASE_DIR="/mnt/i/EoboticsAI/Works/Repo/AI-Data-Annotation-Tasks"

# Check if all arguments are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
    echo "Usage: $0 <Category> <Project-Name> <Tool-Name> <Workflow-Type>"
    echo "Example: $0 Computer-Vision Semantic-Segmentation-with-Polygons Label-Studio Manual"
    exit 1
fi

CATEGORY="$1"
PROJECT_NAME="$2"
TOOL_NAME="$3"
WORKFLOW_TYPE="$4"

# Full path for the workflow folder
WORKFLOW_PATH="$BASE_DIR/$CATEGORY/$PROJECT_NAME/$TOOL_NAME/$WORKFLOW_TYPE"

# Create folders (including data and annotations) inside workflow folder
mkdir -p "$WORKFLOW_PATH"/{data,annotations}

# Add placeholder files so Git tracks empty folders
touch "$WORKFLOW_PATH/data/.gitkeep"
touch "$WORKFLOW_PATH/annotations/.gitkeep"

# Create README and results files inside workflow folder
touch "$WORKFLOW_PATH/README.md"
touch "$WORKFLOW_PATH/visualize_results.md"
touch "$WORKFLOW_PATH/eval_results.md"

echo "Project structure created at: $WORKFLOW_PATH"

