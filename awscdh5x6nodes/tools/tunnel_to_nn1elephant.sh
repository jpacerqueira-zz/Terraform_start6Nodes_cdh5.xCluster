#!/bin/bash 
bash -c "/usr/bin/ssh -i ~/.ssh/reporting_cluster_key.pem -N -R 1234:localhost:22 training@nn1elephant -p 22"
