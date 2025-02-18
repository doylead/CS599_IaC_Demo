Instructions:
1. Set up AWS credentials and store the aws_access_key_id and aws_secret_access_key in an appropriate location on your machine
2. Install Terraform and add it to your path
3. Clone the git repo to the desired location
4. Modify the content of **private_vars.tf.off** to use appropriate values for your system, and rename this file to **private_vars.tf**
5. Open a command line interface in that directory and type **terraform init**
6. To run the example state with just a public subnet, type **./morph -original** and then **terraform apply**.  Type "yes" and hit enter when prompted
7. To run the example with both private and public subnets, type **./morph -original** and then **terraform apply**.  Type "yes" and hit enter when prompted.
8. Notably steps 6 and 7 can be run repeatedly and in any order
9. When done, run **terraform destroy** to destroy virtual resources and avoid a surprise bill
