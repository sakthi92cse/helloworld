# Helloworld App

Docker Installation for Ubuntu
---------------------
Docker is a continerization tool.Using docker we can deploy our applications as

containers using docker images. Containers contains application code and also the softwares,

config files whatever is required for our application to run.

Create docker image using Dockerfile

-------------------
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER

sudo reboot

docker login -u username -p password

docker build -t sivavel/hellow:latest .


docker push sivavel/hellow:latest

docker pull sivavel/hellow:latest

Port 8080 redirected used docker compose file

docker-compose.yaml  

docker compose up -d

CI Configuration Steps: GitHub Actions
-----------------------

1.Go to your GitHub repository → Settings → Actions → Runners → New self-hosted runner.
2.Select: Operating System (Linux, Windows, or macOS).
GitHub will show you installation commands like:

# Create a folder for the runner
mkdir actions-runner && cd actions-runner

# Download the latest runner package
curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz

# Extract the package
tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz

3. Configure the Runner
Run the configuration script provided by GitHub:

./config.sh --url https://github.com/<your-username>/<your-repo> --token <TOKEN>

Runner name (press Enter for default).

Runner group (default is fine).

Work folder (_work default is fine).

4. Start the Runner

./run.sh


The runner will now listen for jobs.
-----------------

EKS Setup and ArgoCD Installation Guide
-----------------------------
EKS Setup
#########
1) Create Dedicated VPC For EKS Cluster. Using CloudFormation. 
     https://amazon-eks.s3.us-west-2.amazonaws.com/cloudformation/2020-08-12/amazon-eks-vpc-private-subnets.yaml 
2) Create IAM Role For EKS Cluster.
      EKS – Cluster      
3) Create EKS Cluster.
4) Create IAM Role For EKS Worker Nodes.
        AmazonEKSWorkerNodePolicy
        AmazonEKS_CNI_Policy
        AmazonEC2ContainerRegistryReadOnly
    AmazonEBSCSIDriverPolicy 
5) Create Worker Nodes.


6) Create An Instance (If Not Exists) Install AWS CLI , IAM Authenticator And kubectl. Configure AWS CLI using Root or IAM User Access Key & Secret Key. Or Attach IAM With Required       Policies.


####Setup K8s Client Machine #####

### Install Kubectl In Linux====

1) Install Download the latest kubectl release with the command:

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"



2) Make the kubectl binary executable. 

     chmod +x ./kubectl
     
3) Move the binary in to your PATH.

      sudo mv ./kubectl /usr/local/bin/kubectl
4) Test to ensure the version you installed is up-to-date:

kubectl version --client     


### Install aws CLI In Linux====
-----------------------------

1) Download AWS CLI ZIP
    
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

2) Download & Install Unzip
    sudo yum install unzip -y

3) Extract Zip 
    unzip awscliv2.zip
    
4) Install
    sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
    
5) Verify
  aws --version 
    
    
######## Configure AWS CLI using ACCESS Key & Secret Key ########
-----------------------------

aws configure


##### Get KubeConfig file #####

aws eks update-kubeconfig --name <ClusterName> --region <RegionName> 

##### Verify Kubectl #####
kubectl get nodes
kubectl get pods


CD: #Argocd Installtion

------------------------------------

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:443 --address 0.0.0.0 &

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d; echo

In Url Publicip:8080  -- >need to access argocd

Username: admin
Password: 2JZSh9yZNxA-ShvC  --Password



