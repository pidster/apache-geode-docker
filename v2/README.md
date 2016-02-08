# Docker Compose v2 (Docker 1.10)

A basic Apache Geode (aka GemFire) Docker demo.

## Quick start

Start Weave, if necessary.

    weave launch

Start the baseline containers, which are 2x Locators and 1x Cache Server

    docker-compose up -d

Check that the container launched correctly:

    scope launch

Use Scope to verify that the Locators (v2_locator1_1 and v2_locator2_1) are up and connected.
The single Server instance (v2_server_1) should make a connection to each Locator.

Check the logs.

    docker-compose logs

Exit log tailing and scale the servers.

    docker-compose scale server=7

Use Scope again to check a grid has formed.
Configure some test regions:

    scripts/setup.sh

Load some data:

    scripts/data.sh

Inspect the grid:

    scripts/gfsh.sh

The gfsh shell should launch; now connect to the grid:

    gfsh>
    gfsh>connect --locator=locator1[10334]
    gfsh>show metrics
    gfsh>help

Explore the grid...
Then exit.

    gfsh>exit

Finally, clean it all up...

    docker-compose down


## Cleaning up & debugging

The `v2/data` directory is mapped into the Geode containers. It will contain log files produced by Geode.
