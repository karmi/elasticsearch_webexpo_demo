A Standup Sketch Involving Three ElasticSearch Nodes, Two Computers and One iPhone
==================================================================================

This is a script for a live demo of ElasticSearch's clustering capabilities on a conference,
workshop, user group meetup, etc. It should take about 5 minutes to setup and 15 minutes to perform.

### The Setup ###

_Terminal_: tab for each node.

_Browser_:

  1. `TAB1`: [Bigdesk](https://github.com/lukas-vlcek/bigdesk)
  2. `TAB2`: [Count docs](http://localhost:9200/webexpo/_search?q=*&search_type=count)
  3. `TAB3`: [Search](http://localhost:9200/webexpo/_search?q=hello&search_type=count)

### The Script ###

    [LUKÁŠ] Start node 1
            Start node 2
            Bigdesk, inspect state

    [KARMI] Start node 3
            Bigdesk

    [LUKÁŠ] Bigdesk, show nodes

    [KARMI] Setup index (shards = 3, replicas=0)
            Import 90,000 documents

    [LUKÁŠ] Bigdesk, show CPU spike, etc
            Count documents (90,000)

    [LUKÁŠ] Kill node 2
            Bigdesk, health is _red_
            Count documents (~ 60,000)
            (We are missing data, but the cluster is operational)

    [KARMI] Index new document, `{"title" : "Hello Red Cluster!"}`

    [LUKÁŠ] Search for the newly added document, "hello"

    [LUKÁŠ] Start node 2
            Bigdesk, health is _green_

    [KARMI] Increase `number_of_replicas` to 1

    ... wait for relocation ...

    [LUKÁŠ] Bigdesk, show cluster state, CPU spikes, etc

    [LUKÁŠ] Kill node 2
            Bigdesk, cluster health is still _green_

    [KARMI] Kill node 3

    [LUKÁŠ] Bigdesk, yellow
            Count, 90,000
            Search document "hello"
