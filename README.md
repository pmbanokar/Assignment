Steps are as follows : 
1) Create a sample Node.js application. 
2) Set up an EKS cluster using Terraform.
3) Deploy the application on EKS using Helm charts.
4) Expose the application using an AWS Network Load Balancer (NLB) via the AWS Load Balancer Controller.

Step 1:
Create a basic Node.js application.
Create a package.json file, index.js file, and Dockerfile to containerize the application. These files are provided in repo. so it would be ready to deploy on eks cluster.

Step 2:
a)Create an EKS Cluster by using Terraform.
b)First we have to install Terraform and then we will go further for configuration.
c)Create a directory by name terraform-eks-cluster and inside it create a files are as follows:
 eks-cluster.tf, outputs.tf, provider.tf, variables.tf and vpc.tf
d)To initialize and apply the configuration run command: terraform init
                                                         terraform apply (type yes to proceed) Now it will create a eks cluster.

Step 3:
a)First we have to install Helm.
b)we have to install AWS Load Balancer Controller on your EKS cluster to manage the NLB.
 To install Helm:
     kubectl apply -k "github.com/kubernetes-sigs/aws-load-balancer-controller//deploy/crds?ref=release-2.4"

     helm repo add eks https://aws.github.io/eks-charts
     helm repo update

     helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
      --set clusterName=<your-cluster-name> \
      --set serviceAccount.create=false \
      --set serviceAccount.name=aws-load-balancer-controller \
      -n kube-system

 Step 4:
 Creaate Helm chart to deploy the application
 create the chart files: Chart.yaml, values.yaml, deployment.yaml and service.yaml.

 Step 5:
 Deploy Application Using Helm
 To install the Helm chart in your EKS cluster
    helm install nodejs-app ./charts/nodejs-app

 Step 6:
 Exposing the Application with NLB
 First we need to update the service to specify that you want an NLB to expose the service using a Network Load Balancer through the AWS Load Balancer Controller.
 update service.yaml to specify NLB and after that AWS Load Balancer Controller will automatically create an NLB to expose the service.
 
 

     






     
