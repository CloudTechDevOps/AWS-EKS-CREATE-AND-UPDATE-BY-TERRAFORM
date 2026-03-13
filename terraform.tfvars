cluster_name       = "prod-cluster"
instance_count     = 2
instance_size      = "t2.medium"
region             = "us-east-1"

# cluster_version    ="1.29"                                           
# ami_id             = "ami-0000a441e1aeb64b2"  
# vpc-cni-version    = "v1.19.5-eksbuild.3"        
# kube-proxy-version = "v1.29.15-eksbuild.5"        

# cluster_version    = "1.30"                       
# ami_id             = "ami-003271feb17a044df"    #    
# vpc-cni-version    = "v1.21.1-eksbuild.3"          
# kube-proxy-version = "v1.30.14-eksbuild.23"           

# cluster_version    ="1.31"                   
# ami_id             = "ami-00245fbe75402bb95"    
# vpc-cni-version    = "v1.21.1-eksbuild.3"
# kube-proxy-version = "v1.31.14-eksbuild.5"


cluster_version    ="1.32"                   
ami_id             = "ami-00b2d535b557faf22"    
vpc-cni-version    = "v1.21.1-eksbuild.3"
kube-proxy-version = "v1.32.11-eksbuild.5"
