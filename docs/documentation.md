# Blue Print Description

This is a Level 2 Blue Print for Compute EC2 (Internal Facing) and captures the coupling of the native AWS services such EC2, ASG, ELB with CBA controls and customizations. This blueprint can be a building block to form Level 3 patterns for application workloads.

# Blue Print Owner

| Owner          | Contact Details                             |
| -------------- | ------------------------------------------- |
| Jason Sandery  | http://directory.cba/opview.asp?id=215092   |

## Revision History
| Version | Author                          | Date     | Changes                |
|---------|---------------------------------|----------|------------------------|
| 1.0     | Subash & Antony Politakis       | 17/03/21 | Initial Draft          |
| 1.1     | Fawzi Harfouch & Laxmi Joshi    | 07/06/21 | Release 1.1            |
| 1.2     | Vasanth Selvaraj & Wesley Lane  | 08/09/21 | Security and Line1 Risk|

## Compute EC2 BluePrint Types
1) [EC2 only](./compute-types/ec2only.md)
    - EC2 provides scalable computing capacity to deploy applications.
    - Suitable for:
        - Internal facing
        - Single server/app deployment
    - Supports:
        - EBS Volume Storage (Stateless) (Does not cater for life cycle management of EBS)
        - [Resource Tagging] (https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
        - Encryption On Rest using AWS KMS for EBS Volumes

2) [EC2 + ASG only](./compute-types/ec2asg.md)
    - ASG manage a cluster of EC2 Instances and enforce pre-defined rules about how many instances to run in the cluster. It scales the number of instances up or down dependent on traffic or on resource usage, and automatically restart instances if they go down.
    - Suitable for:
        - Internal facing
        - Multi server/app deployment
        - Scripted / CICD deployment
    - Supports:
        - Elastic scaling
        - High Availability
        - Fault tolerant
        - EBS Volume Storage (Stateless) (Does not cater for life cycle management of EBS)
        - [Resource Tagging] (https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
        - Encryption On Rest using AWS KMS for EBS Volumes
        
3) [EC2 + ASG + NLB](./compute-types/nlb.md)
    - ASG manage a fleet of EC2 Instances and enforce pre-defined rules about how many instances to run in the fleet.
    - Scales the number of instances up or down dependent on application requirements. (Note: Customer can enhance the scaling behavior based on application specific           requirements
    - Monitor the instance and launch new instance if there is any instance failure
    - Distributes incoming traffic across multiple targets in three Availability Zones. It monitors the health of application running at the target and launch new instance if any application failure. 
    - Supports protocol such as HTTPS/TCP.
    - Suitable for:
        - Internal facing applications
        - Scripted / CICD deployment
        - Application should support Load balanced traffic distribution
        - Stateless Application.
    - Supports:
        - High Availability
        - Fault tolerant
        - Elastic scaling
        - Zero-downtime
        - [Rolling deployment](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html)
        - EBS Volume Storage (Stateless) (Does not cater for life cycle management of EBS)
        - Health checks (Instance and Application)
        - Service discovery
        - [Resource Tagging](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
        - Encryption on Transit (CBA Provided SSL Certs at Load Balancer Listener & EC2 instane side )
        - Encryption On Rest using AWS KMS for EBS Volumes
 
4) [EC2 + ASG + ALB](./compute-types/alb.md)
    - ASG manage a fleet of EC2 Instances and enforce pre-defined rules about how many instances to run in the fleet.
    - Scales the number of instances up or down dependent on application requirements. (Note: Customer can enhance the scaling behaviour bassed on application specific           requirements
    - Monitor the instance and launch new instance if there is any instance failure
    - Distributes incoming traffic across multiple targets in three Availability Zones. It monitors the health of application running at the tatget and launch new instance if any application failure. 
    - Supports protocol such as HTTPS.
    - Suitable for:
        - Internal facing applications
        - Scripted / CICD deployment
        - Application should support Load balanced traffic distribution
        - Stateless Application.
    - Supports:
        - High Availability
        - Fault tolerant
        - Elastic scaling
        - Zero-downtime
        - [Rolling deployment](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html)
        - EBS Volume Storage (Stateless) (Does not cater for life cycle management of EBS)
        - Health checks (Instance and Application)
        - Service discovery
        - [Resource Tagging](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
        - Encryption on Transit (CBA Provided SSL Certs at Load Balancer Listener & EC2 instance side )
        - Encryption On Rest using AWS KMS for EBS Volumes

## Tenant Responsibility

- Internal App DNS FQDN : Request a user-friendly DNS name via [requestIT](https://confluence.prod.cba/pages/viewpage.action?pageId=341818869) 
- Custom AMI : Customer has to build application AMI by using CNS provided SOE AMI as a base AMI. The custom AMI should include the application component with or without SSL based on request and successfully tested the application startup before using it with BP.
- SSL Cert : Customer has to request SSL certificate via [requestIT](https://confluence.prod.cba/display/DEADE/SSL+Certificate+Requests) with a common name or Subject alternative name matching the FQDN chosen earlier. This is one of the main pre requirements to use with Public facing BP.
- Splunk : Engage LogIt team with Front Door Request process for [Splunk onboarding](https://confluence.prod.cba/x/mqAxE)
- TAGS : Customer has to choose resource tags according to CBA Cyber TRA requirements.
- Userdata : Customer has to upload application startup/config scripts in S3 and call it using UserData to perform bootstrap tasks.
- Security Groups : Customer has to be create SG rules based on samples as a pre requirements to use with BP
- IAM : IAM Role/Policies has to be created by customer based on samples as a pre requirements to use with BP
- S3 : Customer can to create additional S3 bucket for application purpose and use it with BP
- The Sample code for API request to Service catalogue to deploy BP (in progress)

### Core services included in all Blueprint
1) Build artifacts and Config files are pulled from an S3 bucket (Artifactory)
2) Logs are forwarded to Logit (Splunk).
3) EBS leverages KMS for key based encryption at a block level.
4) The workspace pulls variables from the SSM parameters store to inform the cloud formation build process.
5) Secrets are stored in Secret Manager for application
6) CBA certificates are imported from CBA Internal root CA.
7) Config Files are stored to an S3 bucket.


### Workload suitability  details

| Property | Description | EC2 Only | EC2+ASG | EC2+ASG+NLB | EC2+ASG+ALB |
|---|---|---|---|---|---|
| Availability Metric | Max supported 'nines' metric | 99.5% | 99.99% | 99.99% | 99.99% |
| Service Tier | What is the maximum level of service tier | 1 | 1 | 1 | 1 |
| Availability Tier | Max supported availability tier | A2 (*) | A1 (*) | A1 (*) | A1 (*) |
| Recoverability Tier | Max supported recoverability tier | R0 (Intra Region) | R0 (Intra Region) | R0 (Intra Region) | R0 (Intra Region) |
| Cyber Tier | Max supported cyber criticality tier | C0 (*) | C0 (*) | C0 (*) | C0 (*) |
| RTO | Max supported | 5 min | 0 min | 0 min  | 0 min |  
| RPO | Max supported RPO | NA | NA | NA | NA |
| Materiality | Service support material workload | Yes | Yes | Yes | Yes |
| SOR | Service support system of record | Yes | Yes | Yes | Yes |
| Public Cloud Providers | Public Cloud Providers for Service | AWS | AWS | AWS | AWS |
| Cloud Provider Region | Number of regions | 1 | 1 | 1 | 1 |
| AZ per Region | Min number of Availability zones provisioned per region | 3 | 3 | 3 | 3 |
| Active/Active | Does this pattern run active/active across two or more availability zones | NA | Yes | Yes | Yes |
| Automatic Failover | Does this pattern automate infrastructure failover | No | Yes | Yes | Yes |
| AutoScale | Does this pattern use automatic scaling | No | Yes | Yes | Yes |
| Minimum Nodes | Minimum number of nodes per site or AZ | 1 | 1 | 1 | 1 |
| Load balancer Application Component | Application Components | NA | NA | Stateless/Stateful | Stateless/Stateful |
| Application Access | Who will be accessing | Internal Users / Apps | Internal Users / Apps | Internal Users / Apps | Internal Users / Apps |
| External Facing | Is this pattern designed to be accessible externally? | No | No | No | No |
| Interface Type | Supported Interface | Any TCP Traffic | Any TCP Traffic | Any TCP Traffic | Web UI / API |
| Security Zone | What Security Zone(s) does this pattern cover | Secured / Restricted / Controlled Internal/Management | Secured / Restricted / Controlled Internal/Management | Secured / Restricted / Controlled Internal/Management | Secured / Restricted / Controlled Internal/Management |
| Data Classification | Max supported data classification tier | Highly Protected | Highly Protected | Highly Protected | Highly Protected |
| Encryption at Rest | Can the solution provide  encryption at rest? | Yes | Yes | Yes | Yes |
| Encryption in Transit | Can the solution provide encryption in transit | NA | NA | Yes | Yes |
| AuthN, AuthZ | Authentication and Authorization | AuthN=CNS AD and AuthZ=IAM Roles | AuthN=CNS AD and AuthZ=IAM Roles | AuthN=CNS AD and AuthZ=IAM Roles | AuthN=CNS AD and AuthZ=IAM Roles |
| Service Endpoint | Service Endpoint DNS | CBA Internal Route 53 | CBA Internal Route 53 | CBA Internal Route 53 | CBA Internal Route 53 |

## Inherited Features
- CBA: LogIT
- CBA: SIEM (If required)
- CBA: Hardened CNS SOE
- CBA: Vulnerability Scanning
- CBA: System Monitoring
- CBA: Group Antivirus
- AWS: CloudWatch Alarms
- AWS: CloudTrail Activity Logs

## Reference Material

| Reference Name                          | Reference Link                                                                                        |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------|
| OneCloud documentation                       | [OneCloud documentation](https://docs.onecloud.cba/)          |
| Data Classification & Handling Standard | [Data Classification & Handling Standard](https://confluence.prod.cba/pages/viewpage.action?pageId=475900149)                                                                    |
| Github link for BluePrint               | [Pattern Library](https://github.source.internal.cba/Public-Cloud-Blueprints)     |
| ARC Ratings                             | [ARC Ratings](https://confluence.prod.cba/pages/viewpage.action?pageId=519253482)                            |
| High Level Pattern                      | [Public Cloud Patterns](https://github.source.internal.cba/Public-Cloud-Patterns)                     |
| KMS                                     | [KMS](https://github.source.internal.cba/CloudServices/WhitelistingServices/blob/master/aws/KMS.md)  |
| Cloud Monitoring                        | [Cloud Monitoring](https://docs.onecloud.cba/aws/operate/monitoring/#aws-infrastructure-monitoring)                                                                       |
| AWS ACM                                 | [AWS ACM](https://github.source.internal.cba/CloudServices/WhitelistingServices/blob/master/aws/ACM.md)  |
| AWS ELB                                 | [AWS ELB](https://github.source.internal.cba/CloudServices/WhitelistingServices/blob/master/aws/ELB.md)  |
| AWS EC2                                 | [AWS EC2](https://github.source.internal.cba/CloudServices/WhitelistingServices/blob/master/aws/EC2.md)  |
| AWS User Guide                          | [AWS User Guide](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-dg.pdf)                             |

## Security Review

Please refer to the [security contribution](./security.md) file for further information.

## Line 1 Risk Review

Please refer to the [risk contribution](./risk.md) file for further information.


## Glossary
Terms and Abbreviations related to the context of this design.

| Term                              | Definition                        |
|-----------------------------------|-----------------------------------|
| AZ                                | Availability Zones                |
| HA                                | High Availability                 |
| ASG                               | Auto Scaling Group                |
| NLB                               | Network Load Balancer             |
| ALB                               | Application Load Balancer         |
| EC2                               | Elastic Compute Cloud             |
| SNS                               | Simple Notification Service       |
| KMS                               | Key Management Service            |
| ACM                               | AWS Certificate Manager           |
| RTO                               | Recovery Time Objective           |
| RPO                               | Recovery Point Objective          |
| RLO                               | Recovery Level Objective          |

## End of file
