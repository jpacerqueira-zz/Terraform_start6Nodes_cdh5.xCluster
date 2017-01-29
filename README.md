# Terraform_start6Nodes_cdh5.xCluster #
#    Deploy on-off your own cloud     #

  - Requires AWS_CLI
  - Requires terraform
  - Generate AWS key.pair store file in ~./ssh 
  
  - Start your temp cloud
   - $ vi EDITME.tf
   - $ terraform apply
   - $ ruby ../tools/get_hostsfile.rb

  - Enjoy and Deploy your Spark Jobs in Hadoop
  - When not required download your results ByeBye AWS Nodes
   - $ terraform destroy
   
