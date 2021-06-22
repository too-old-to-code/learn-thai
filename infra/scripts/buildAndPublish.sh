#! /bin/sh

set -e

# Set some variables
SOURCE_DIR="./frontend"
GIT_COMMIT_HASH=`git rev-parse --short HEAD`
BUCKET_NAME='learn-thai'
TARGET_DIR="$BUCKET_NAME/$GIT_COMMIT_HASH/learn-thai-alphabet"
echo "$TARGET_DIR"
echo 'why oh why oh why'
ls | echo
# Remove the existing build
# rm -rf "$SOURCE_DIR/build"

# Install node modules and creat new build
(cd "$SOURCE_DIR" && npm ci && npm run build)

# Copy the build application to the deployed S3 bucket
aws s3 sync "$SOURCE_DIR/build" "s3://$TARGET_DIR/"