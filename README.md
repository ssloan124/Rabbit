# Data Profile Test

### Summary

Data Profiler

### Overview

This is a repo with multiple contributors.  See sections for contributions

### RabbitMQ

##### Basic Use

Currently running from Jupyter Notebook instance within Docker

1. Clone repo 

2. ```cd``` into ```rabbitmq``` folder; update mount path in docker-compose

3. ```docker-compose up```

4. Copy and paste Jupyter url into browser

5. Open rabbit.ipy to view

6. (optional) To view activity in RabbitMQ, go to ```localhost:15672``` (default user:pass = guest:guest)

##### Data

Various manipulations of the Iris dataset (.csv, .txt, .pdf)

##### Methods

Using Docker Compose and a separate service for Jupyter and RabbitMQ:

1. Consume a message containing the location of file to be profiled (publish dummy message to be consumed in test case)

2. Read file from path (errors for file exist and file type)

3. Profile dataset (error if profile cannot complete)

4. Write ```.html``` profile (error if profile cannot be written)

Queues involved:

* consume = 'profiler'

* errors = 'error'

* complete = 'file_ready'

##### Results

Results in ```<filename>_profile.html```

##### References

* https://pypi.org/project/rabbit-clients/

* https://docs.docker.com/compose/compose-file/

* https://stackoverflow.com/questions/54146342/docker-compose-with-rabbitmq

* https://www.levvel.io/blog/testing-rabbitmq-clustering-using-docker-part-1

* https://codeburst.io/using-rabbitmq-for-microservices-communication-on-docker-a43840401819

* https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html

* https://stackoverflow.com/questions/40563469/connecting-to-rabbitmq-docker-container-from-service-in-another-container

* https://hub.docker.com/_/rabbitmq

* https://hub.docker.com/r/jupyter/datascience-notebook

* https://stash.fssa.in.gov/projects/DMA/repos/rabbit-clients/browse




