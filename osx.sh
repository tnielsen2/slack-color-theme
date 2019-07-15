#! /usr/local/bin/zsh
echo Ensure you have NPM and node installed
echo Installing custom color scheme into Slack.
JSPATH=$(pwd)"/colors.js"
JS=$(cat $JSPATH)
SLACK_RESOURCES_DIR="//Applications/Slack.app/Contents/Resources"
SLACK_FILE_PATH="$SLACK_RESOURCES_DIR/app.asar.unpacked/dist/ssb-interop.bundle.js"
sudo npx asar extract $SLACK_RESOURCES_DIR/app.asar $SLACK_RESOURCES_DIR/app.asar.unpacked
sudo tee -a "$SLACK_FILE_PATH" > /dev/null <<< "$JS"
sudo npx asar pack $SLACK_RESOURCES_DIR/app.asar.unpacked $SLACK_RESOURCES_DIR/app.asar
