#! /bin/sh

# Set some variables
SOURCE_DIR="./frontend"
GIT_COMMIT_HASH='git rev-parse --short HEAD'
BUCKET_NAME='learn-thai'
TARGET_DIR="$BUCKET_NAME/$GIT_COMMIT_HASH/learn-thai-alphabet"
echo "$TARGET_DIR"

# Remove the existing build
rm -rf "$SOURCE_DIR/build"

# Install node modules and creat new build
(cd "$SOURCE_DIR" && npm ci && npm run build)

echo $(ls)

# Copy the build application to the deployed S3 bucket
aws s3 sync "$SOURCE_DIR/build" "s3://$TARGET_DIR/"