# nango

This is a hacked together repo, which is basically just a dockerfile that deploys the image `nangohq/nango-server:hosted`

It appends some custom providers (which we don't want to openly contribute to the public nango project).
It also adds the logos for these providers.

It spawns two processes, the server process and then the refresh script (runs every 10min)

The end.
