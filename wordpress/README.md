# Wordpress docker application

The script creates the following 3-tier wordpress applications in docker.

```
                                            +---------------+
                                            |               |
                        +-------------------+  wordpress_1  +---------------------+
                        |                   |               |                     |
                        |                   +---------------+                     |
        +---------------+                                                 +-------v-------+
        |               |                                                 |               |
        |  nginx_proxy  |                                                 |     mysql     |
        |               |                                                 |               |
        +---------------+                                                 +-------^-------+
                        |                   +---------------+                     |
                        |                   |               |                     |
                        +-------------------+  wordpress_2  +---------------------+
                                            |               |
                                            +---------------+
```

## To set environment and run the test

Install docker daemon and docker-compose tools first, then run

> sudo ./start.sh

After installation is done, run load test manually.

> ./run.sh

## Manual command

To clean up,

> sudo docker-compose -f wordpress.yml stop

> sudo docker-compose -f wordpress.yml rm

