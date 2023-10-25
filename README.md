# ContainerdK8s-Installer



## Description: 

ContainerdK8s-Installer is an automation tool based on Ansible that simplifies the deployment and management of Kubernetes clusters using Containerd as the Container Runtime Interface (CRI). 

This project provides a set of Ansible playbooks and roles that streamline the installation, configuration, and scaling processes of Kubernetes clusters. By leveraging Containerd as the CRI, this tool offers greater control and higher performance for container runtime management. 

**Key Features:** 

- Automated deployment of Kubernetes clusters using Ansible*'s declarative syntax* 
- Support for Containerd as the CRI, enabling flexible and customizable container management 
- Quick and easy installation, configuration, and management of Kubernetes clusters 
- Scalability to meet varying deployment requirements for different scales and complexities
- Reusable Ansible roles and playbooks for customization based on specific needs 

With ContainerdK8s-Installer, you can swiftly set up and manage production-ready Kubernetes clusters, with the flexibility to fine-tune and scale based on your requirements. Whether you*'re a beginner or an experienced Kubernetes user, this project aims to simplify the deployment process and enhance container management experience.* 

Start using ContainerdK8s-Installer today and enjoy efficient, reliable, and easily maintainable Kubernetes clusters!



## Records:

Testing environment:

```
cat /etc/centos-release
CentOS Linux release 7.6.1810 (Core) 
```

Find the corresponding image version from the Docker image repository：

```
sudo apt-get install jq/sudo yum install jq

curl -s https://registry.hub.docker.com/v2/repositories/ansible/ansible/tags?page_size=100 | jq -r '.results[].name'
ubuntu1404
ubuntu1604py3
ubuntu1604
httptester
default
fedora27py3
fedora26py3
vcenter-simulator
opensuse42.3
opensuse42.2
fedora25py3
opensuse42.1
ubuntu1204
centos7
centos6
fedora25
fedora24
cloudstack-simulator
opensuseleap
fedora23
fedora-rawhide

curl -s https://registry.hub.docker.com/v2/repositories/library/registry/tags?page_size=100 | jq -r '.results[].name'
latest
2.8.3
2.8
2
2.8.2
2.8.2-beta.2
2.8.1
2.8.0
2.8.0-beta.1
2.7.1
2.7
2.6.2
2.6
2.5.2
2.5
2.7.0
2.6.1
2.6.1-rc.2
2.6.0
2.6.0-rc.2
2.5.1
2.6.0-rc.1
2.5.0
2.5.0-rc.2
2.4.1
2.4
2.5.0-rc.1
2.4.0
2.3.1
2.3
2.3.0
2.2.1
2.2
0.9.1
0.8.1
2.2.0
0.6.1
0.6.6
0.6.8
0.6.9
0.7.1
0.7.0
0.8.0
0.6.0
0.9.0
0.7.3
0.6.2
0.7.2
0.5.9
0.6.5
0.6.3
0.6.7
0.6.4
2.1.1
2.1
2.0
2.0.0
2.0.1
```

To run the script smoothly, it is necessary to manually assign permissions to the shell script:

```
find . -path \*.sh -execdir pwd \; | while read path; do cd $path && chmod +x *.sh; done
```

