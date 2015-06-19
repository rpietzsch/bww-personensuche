# RUN

``docker run -d --name bww-people-search -P rpietzsch/bww-personensuche``

Container exposes port 80, map it explicitly to your desired port or assign a random one (-P).

Following options could be set on container start using ``-e <key>=<val>`` options:

- ``SPARQL_ENDPOINT``  (defaults to ``https://odple-virtuoso.eccenca.com/``)
- ``BWW_GRAPH`` (defaults to ``https://odple-ckan.eccenca.com/``)

A sample command may look like:

``docker run -d --name bww-people-search -P -e SPARQL_ENDPOINT=http://virtuoso.your.domain.com/sparql -e BWW_GRAPH=http://data.your.domain.com/bww rpietzsch/bww-personensuche``