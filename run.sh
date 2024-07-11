# Run these docker commands in parallel
echo "Starting server and refreshTokens"

node /usr/nango-server/src/packages/server/dist/refreshTokens.js &
node /usr/nango-server/src/packages/server/dist/server.js
