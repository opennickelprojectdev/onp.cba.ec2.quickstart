# EC2 (Internal Facing) Blueprint - Control Assessment

## 1. Overview

### 1.1 Purpose

The purpose of this document is to provide an outcome of the controls assessment for the [EC2 (Internal) Blueprint](/readme.md), which will be consumed to develop patterned deployments on OneCloud Public (AWS). This controls assessment is one of the gate checks for final approval of the EC2 (Internal) Blueprint, and acts as an input into the [Controls Consumption document.](./control-consumption.md)

### 1.2 Scope

The scope of this assessment covers the controls for the EC2 (Internal) blueprint as per the defined workload suitability characteristics within the blueprint's [design document](/readme.md). In-scope components include the following compute types provided by the Blueprint:

* [EC2 only](./compute-types/ec2only.md)
* [EC2 + Auto Scaling Group (ASG)](./compute-types/ec2asg.md)
* [EC2 + ASG + Network Load Balancer (NLB)](./compute-types/nlb.md)
* [EC2 + ASG + Application Load Balancer (ALB)](./compute-types/alb.md)-

The focus is to:

1. Identify and define the control environment provided by the EC2 (Internal) blueprint
2. Assess the Design Effectiveness (DE) of the controls provided by the blueprint and outline whether there are any additional control activities required to be carried out by blueprint consumers.

<details><summary><b> Out-of-Scope</b> - <i> click to expand</i></summary><br>

The following components / processes are considered to be out-of-scope for this assessment:

* Technology controls for the integrated AWS services such Secrets Manager, KMS, CloudWatch, SNS and ACM
* Creation and management of dependent resources, including workspace, IAM users & groups, VPCs & subnet groups
* Configuration of the selected AMI
* Blueprint consumption process, including deployment via CI/CD Pipeline
* Controls that cannot be provided by the blueprint

</details>

### 1.3 Approach

Our approach for completing this controls assessment is outlined in the below 4 steps:

<details><summary><b> Step 1 - Define the Control Environment </b></summary>

In consultation with TISO, Cyber, Architecture and Engineering, we defined the control environment of the EC2 (Internal) blueprint by identifying the Technology controls that can be assessed (i.e. controls that are applied or implemented by the blueprint) and the controls that can be provided in 'future' releases. </details>

<details><summary><b> Step 2 - Identify CADs </b></summary>

To drive up efficiency, consistency and quality, the endorsed Cloud Control Attribute Definitions [(CADs) list v1.3](https://commbank.sharepoint.com/:x:/s/ES-OneCloudRiskandSecurityCoE/EQb5_vilCSlMvCGJwwHueDUB0E1ZF0dcxCahcgWKay0ntw?e=GSJeVr) is used to determine attributes of the identified controls that can be applied / provided by the EC2 (Internal) blueprint. For each identified CAD, we defined and enriched it with the following information: <br>
      a. **CAD Source:** `Embedded` (directly applied by the blueprint) or `Inherited` (indirectly applied by the blueprint e.g. leveraged / inherited from either the supplier, platform or CBA's operating environment).<br>
      b. **CAD Type:** `Codified` (built into one of the code artefacts) or `Non-Codified` (built as a part of a manual process or inherited) <br>
      c. **CAD Status:**  `Implemented` (the control exists as part of this release) or `Future` (the control does not exist in this release but could be included in future releases). </details>

<details><summary><b> Step 3 - Perform a CAD Assessment </b></summary>

Performed a CAD assessment to outline and evaluate how the control is implemented by the blueprint and validate this implementation. For codified CADs, our approach is to leverage conformance pack checks for testing (where applicable). Other implementation validation steps involve carrying out manual procedures and code inspections. <br>
    *Note: CADs are assessed in the context of meeting or not meeting a control attribute ('Pass' or 'Fail'), the aggregated result is rolled back to the Technology Control Name to determine the final control rating.*
    </details>

<details><summary><b> Step 4 - Determine Control Ratings (Summarise Results) </b></summary>

Determined the Design Effectiveness (DE) rating for each Technology control and outlined whether any further control implementation validation steps are still required by the tenant.<br>
*Note: No DE rating is applied to controls that require further control implementation validation steps to be carried out by tenants.* </details>

For further details on our Controls Assurance Approach, refer to this [link](https://confluence.prod.cba/pages/viewpage.action?pageId=1024589334)

## 2. Summary of EC2 (Internal) blueprint control assessment

### 2.1 Version control
This control assessment document is updated as part of each blueprint's code release to confirm that what is being published for consumption has been assessed. The following table details the history of the EC2 (Internal) blueprint controls assessment to ensure its currency as per the blueprint / pattern lifecycle management.
|ID#| BP version| Date |Description / Changes |
|:--:|:---:|:--------:|:--------------------------------------------|
|1|1.2| 05/10/2021 |Initial Controls Assessment is completed|

### 2.2 Control ratings summary

The EC2 (internal) blueprint control environment consists of 17 Controls (15 existing controls from the Technology Controls Library  and 2 new controls), which are mapped from 22 applicable CADs. *Refer to the summary table below for details:*

* 4 Controls are fully implemented by the blueprint, hence a Design Effectiveness (DE) rating is applied and can be consumed by tenants (these 4 controls are rated `Effective`)
* 13 Controls are either partially implemented by the blueprint or not implemented by this blueprint's release, hence these controls are not rated and require further control activities to be carried out by tenants to establish their effectiveness.

🟢 Effective <br>🟠 Partially Effective <br>🔴 Ineffective <br> ⚫ Unable to Conclude: Control has tenant obligations - it is either partially provided by the blueprint and require further control activities to be carried out by tenants **or** it is not provided by this blueprint's release.

<details><summary> <b> Controls summary: </b> <i>click to expand</i></summary><br>

| No | ES Control Name                             | CADs (results)                           | DE Control Rating |
|:--:|:--------------------------------------------|:----------------------------------------:|:-----------------:|
| 1 |   Role management                                     | CAD-023 (Pass)                                | ⚫ |
| 2 |   Data Storage encryption                             | CAD-030 (Pass)                               | 🟢 |
| 3 |   Implement Data Loss Prevention (DLP)                | CAD-047 (Pass)                               | 🟢 |
| 4 |   Data Classification                                 | CAD-051 (Pass)                               | ⚫ |
| 5 |   Data Protection by Cryptography (new control)     | CAD-057 (Pass)     <br> CAD-059 (Pass)      |  🟢 |
| 6 |   Data Location (new control)                         | CAD-058 (Pass)                              |  🟢 |
| 7 |   Network Segmentation and Segregation                | CAD-077 (Pass) <br> CAD-082 (Pass)  |   ⚫   |
| 8 |   Security Configuration Management                   | CAD-084 (Pass)  |   ⚫|
| 9 |   System vulnerabilities are identified and reported  | CAD-089    (Pass)  |   ⚫   |
| 10|   Vulnerability Patch Management                      | CAD-095 (Pass)    |   ⚫   |
| 11|   Protection from Malware Execution                   | CAD-101   (Pass)  |   ⚫   |
| 12|   Cyber Attack Detection                              | CAD-105 (Pass) <br> CAD-107 (Pass)  <br> CAD-108 (Pass)   | ⚫ |
| 13|   Secure Code Review                                  | CAD-142 (Pass)    |       ⚫   |
| 14|   Technology change must demonstrate appropriate functional and non-functional testing    |   CAD-132 (NA)    |   ⚫   |
| 15|   IT Service Monitoring and Event Management          |   CAD-154 (Pass)  |   ⚫   |
| 16|   Data backup and restoration                         |   CAD-163 (NA)    |   ⚫|
| 17|   IT Service Continuity processes are in place        |   CAD-170 (Pass) <br> CAD-171 (Pass)  |   ⚫   |

</details>

### 2.3 Findings & Recommendations

The below table outlines the list of recommendations to improve the EC2 (internal) blueprint control environment. <p>
*Note: 3 control gaps were identified during our controls assessment and have since been rectified by the Engineering team as part of this code release. As such, these controls were re-validated and not reported as issues. Refer to section 3.2 for details.*

| No |Recommendation                                                                       |
|:----:|:--------------------|
|1 | Enable `MFA Delete` feature on the S3 Access Logs bucket which captures logs from load balancers (NLB & ALB). This will provide additional protection to the log bucket in case of accidental deletion. |
|2| Develop additional controls that can be provided by the blueprint in future releases, which will assist tenants to leverage more controls and reduce the burden on validating these controls by tenants:<p><b> (a) Role management </b><br> Code the standard OneCloud IAM roles for bucket policies instead of providing the option for tenants to configure them as parameters. This will assist tenants to fully leverage the Role Management control. <p><b> (b) Data Backup and Restoration </b> <br> Implement EBS lifecycle (EBS snapshots) <p> <b>(c) Technology change must demonstrate appropriate functional and non-functional testing: </b><br> Perform blueprint functional testing (test cases, test results).

## 3. Detailed Control Assessment for EC2 (internal) blueprint

### 3.1 Control Environment for EC2 (internal) blueprint

The EC2 (internal) blueprint control environment is made up of 17 controls (15 from the TCL and 2 new Data Protection controls) as detailed in the below table. The blueprint provides & implements these controls by embedding them into the CloudFormation template or inheriting them from the supplier/platform as part of a managed service.

<details><summary><b> Applicable Controls </b> - <i> click to expand</i></summary><br>

|Control Name                                        |BP Applicability|Rationale                                                 |  
|:---------------------------------------------------|:---:|:--------------------------------------------------------------------|
|  User access requests are approved                          |❌| Not provided by the blueprint, this is a platform/workspace level control                       |
|  Privileged access is managed appropriately                 |❌| Not provided by the blueprint, this is a platform/workspace level control                       |
|  Systems are accessed through identifiable and attributable user IDs  |:x:| Not provided by the blueprint, this is a platform/workspace level control             |
|  Authentication mechanisms comply with policy requirements            |❌| Not provided by the blueprint, this is a platform/workspace level control             |
|  Role management                                   |:heavy_check_mark:|  Instance profile, roles and the associated permissions are defined in the blueprint     |
|  Data storage encryption                                                              |:heavy_check_mark:|  EBS volume encryption is inherited by default        |
|  Implement Data Loss Prevention (DLP)                    |:heavy_check_mark:|  Resources are created in VPC, other DLP controls are implemented by the blueprint |
|  Data Classification                                              |:heavy_check_mark:|  Data Classification parameters are defined and required                  |
|  Data Protection by Cryptography (new control)                          |:heavy_check_mark:|  Cyber engagement and cryptographic controls are provided           |
|  Data Location (new control)                                      |:heavy_check_mark:|  Resources are conditioned to be created in Sydney region only            |
|  Implement Distributed Denial of Service (DDoS) Protection        |❌|  Internal Facing only, the control is not provided by the blueprint                      |
|  Network Threat Detection & Protection      |❌|  Network zones are not hard-coded, hence the control is not provided by the blueprint                      |
|  Network Segmentation and Segregation                             |:heavy_check_mark:|  Network zones and Security groups are provided                           |
|  Security Configuration Management                                |:heavy_check_mark:|  If an approved AMI is selected, the control is provided by the BP (inherited control), else the control is not applicable to the BP's control environment (tenant's obligation)       |
|  System vulnerabilities are identified and reported               |:heavy_check_mark:|  If an approved AMI is selected, the control is provided by the BP (inherited control), else the control is not applicable to the BP's control environment (tenant's obligation)       |
|  Vulnerability Patch Management                                   |:heavy_check_mark:|  If an approved AMI is selected, the control is provided by the BP (inherited control), else the control is not applicable to the BP's control environment (tenant's obligation)       |
|  Protection from Malware execution                                |:heavy_check_mark:|  If an approved AMI is selected, the control is provided by the BP (inherited control), else the control is not applicable to the BP's control environment (tenant's obligation)       |
|  Cyber Attack Detection                                           |:heavy_check_mark:|  Security logs are provided by the blueprint                              |
|  Technology change must demonstrate appropriate functional & non-functional testing     |:heavy_check_mark:|  Not included in this release, future control       |
|  Secure Code Review                                               |:heavy_check_mark:|  Cyber assessment is provided by the BP, which includes an independent review of the BP's code  |
|  IT Service Monitoring and Event Management                     |:heavy_check_mark:| SNS topic, logs and monitoring of EC2 status are provided by this blueprint |
|  Data backup and restoration                                       |:heavy_check_mark:|  EBS lifecycle is not included in this release, future control           |
|  IT Service Continuity processes are in place                   |:heavy_check_mark:|  Scalability and High Availability are provided via ASG, ALB & NLB                  |

*Note: Only Technology Controls that include associated CADs related to blueprints / patterns are covered in the above applicability assessment (22 controls as per CAD v1.3). Remaining ES controls (such as "Service Management" controls) are not applicable to BPs / Patterns, hence not assessed.*

</details>

### 3.2 CAD Assessment </summary><p>

From the applicable EC2 (internal) blueprint controls, we determined the applicable CADs implemented / provided by the blueprint and then performed an assessment to evaluate the control design and implementation.

<details><summary> <b> Refer to the below table for details:</b></summary><br>

**Evidence of the assessed controls are attached [here](./compute-types/attachments/ec2-internal-evidence-v1.pdf).**

*Legends:* <br>
✅ PASS <br>
❌ FAIL <br>
⬛ NA (not part of this release - could be a future blueprint control)

<table border="#000000"; cellpadding="0"; style=font-size:12px>
<th> # </th> <th > CAD-ID </th> <th align="left"> Description </th> <th> Attribute</th> <th align="left"> Design </th> <th  align="left"> Implementation Validation Steps</th> <th align="left"> Outcome</th> <th> Result</th><th>Control Name</th><th>DE Rating</th><th>Rationale</th>
<tbody>

<tr valign="top">
<td align="center"> 1 </td>
<td align="center"> CAD-023 </td>
<td align="left"> Roles must be used to determine access to data and systems functions. Where possible, permissions, entitlements / groups must not be directly assigned to accounts.</td>
<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>

<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
**S3 Buckets:**<br>
The following standard OneCloud IAM roles are defined in the parameter store as default values:
<ul><li>

`AdminUserRole` role, which is used by workspace admins (human access identities)</li>
<li>

`CloudformationAdminRole` and `AcoeCICDRole` roles, which are used for code deployment (for non-human access identities).
</ul></li>

These roles are utilised in the creation of the two S3 Bucket Policies to manage and control access to the S3 Artifactory bucket and the S3 Access Logs bucket **(this bucket is only applicable to NLB & ALB compute types)**. <p>

**EC2 instances:**<br>
1.&nbsp; An IAM role must be specified and attached for the created EC2 instance (instance profile). The blueprint provides a default instance profile (only if a tenant does not provide their own instance profile policy). This default instance profile provides the required access permissions to the 'S3 Artifactory bucket' and the Secrets Manager service. <p>
2.&nbsp; **EC2 only:** A new IAM role is created `DisableIMDSv1LambdaRole` which have permissions (an attached managed policy) to invoke a Lambda function execution role to disable the use of IMDSv1 (EC2 metadata) as part of the EC2 creation process. </td>

<td align="left">

1.&nbsp; Inspect the [parameter code template](./code/cftemplates/alb/parameters.yml) for each compute type to confirm the default values utilise standard IAM roles.<p>
2.&nbsp; Inspect the [S3 code template](./code/infrastructure-custom-repo/alb/prereq-s3.yml) to confirm that referenced roles are utilised to manage the creation of the S3 bucket policies.<p>
3.&nbsp; Inspect the default instance profile code template [IAM Prerequisite](.code/infrastructure-custom-repo/alb/prereq-iam.yml) to confirm permissions attached to the S3 Artifactory bucket and Secret Manager service. <p>
4.&nbsp; Inspect the [EC2 creation code template](./code/cftemplates/ec2-only/ec2.yml) to confirm the creation of a new IAM role to disable EC2 metadata v1. </td>

<td>

1.&nbsp; `AdminUserRole`, `CloudformationAdminRole` and `AcoeCICDRole` roles are defined as default values in the parameter code template for each compute type. <p>
2.&nbsp; (a) IAM roles are utilised in the bucket policy of the S3 Bucket related to Access logs (ALB & NLB compute types only) <br>
&nbsp;&nbsp; (b) IAM roles are utilised in the bucket policy of the Artifactory S3 bucket (which could be used to hold application installation files) - all compute types <p>
3.&nbsp; The default instance profile is only utilised if the tenant does not specify their own instance profile. This instance profile have attached permissions to read and access the Artifactory S3 bucket and Secrets Manager service. <p>
4.&nbsp; New role `DisableIMDSv1LambdaRole` have attached permissions to invoke a managed policy for Lambda execution role, with a policy Effect to allow modification of the instance meta data options. This is used to disable version 1 of EC2 meta data, hence enforces use of version 2. </td>

<td align="center">✅</td>
<td align="center"> Role management </td>
<td align="center">⚫</td>
<td>

Tenants to define:

* The roles to be added to the S3 buckets in the parameter file (initial step)
* The instance profile IAM roles to be attached to EC2 instances (Optional)

</td>
</tr>

<tr valign="top">
<td align="center"> 2 </td>
<td align="center"> CAD-030 </td>
<td align="left"> Ensure that encryption is applied to computer systems and removable media to mitigate the inappropriate disclosure, loss or theft of digital data when physical security controls cannot protect the data appropriately.</td>
<td <td align="center">

`Implemented`<p>
S3 (Artifactory): <br>
`Embedded`<br>
`Codified` <p>
EBS & S3 (ELB Access Logs): <br>
`Inherited`<br>
`Non-codified`<br></td>

<td align="left">

**S3 Bucket - Artifactory (all compute types):**<br>
Server side encryption is applied by default for the S3 bucket created to store application installation files for each compute type. The creation of the S3 bucket reference a KMS key that the tenant must specify in the parameter store (SSM)<p>
**S3 Bucket - Access Logs (NLB & ALB only):**<br>
AWS encryption (SSE-S3) is applied on the Access Logs S3 bucket created for NLB and ALB compute types. This is inherited from [AWS by default,](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html) where each access log file is automatically encrypted using [AES256](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingServerSideEncryption.html). <p>
**EBS (all compute types):**<br>
This is inherited from OneCloud by default and enforced on the account (workspace), where all EBS volumes are created with encryption at-rest enabled by default. The blueprint encrypts the EBS with an AWS KMS CMK that is pre-created by the CNS team. </td>

<td align="left">

1.&nbsp; Inspect the [S3 prerequisite code template](./code/cftemplates/alb/parameters.yml) for each compute type to confirm that server side encryption is configured and confirm the AWS Config compliance status for the installed in CLAB environment.<p>
2.&nbsp; Inspect the [Ec2 creation code template](./code/cftemplates/ec2-only/ec2.yml) to confirm encryption keys for EBS and S3 Bucket are referenced in the SSM parameter store. </td>

<td>

1.&nbsp; Server side encryption is enabled by ‘Default’ on S3 buckets created for each compute type by defining the SSEAlgorithm parameter in the code templates. We also note that conformance pack check parameter `server-side-encryption-enabled' is compliant <p>
2.&nbsp; The code template to create an EC2 instance reference the required encryption keys that must be defined in the parameter store (EBS and S3 keys). </td>
<td align="center">✅</td>
<td align="center"> Data storage encryption </td>
<td align="center">🟢</td>
<td> Encryption-at-rest using AES256 bits is applied on EBS & S3 Buckets</td>
</tr>

<tr valign="top">
<td align="center">3</td>
<td align="center">CAD-047</td>
<td align="left">For public cloud services, resources must be always provisioned and placed within a controlled virtual private network and where applicable, have resource-based policies defined and implemented to restrict unauthorised resource access and enforce network egress controls. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
1.&nbsp; The blueprint creates EC2 instances in a specified VPC only. <p>
2.&nbsp; S3 Bucket for Artifactory is protected with a bucket policy<p>
3.&nbsp; S3 Bucket for "ELB Access Logs" is protected with a bucket policy (**used with ALB & NLB only**)  <p>
4.&nbsp; Global S3 bucket settings to disable Public Access on all S3 buckets is inherited from OneCloud and applied on the account (workspace level). </td>

<td align="left">

1.&nbsp; Inspect the [Ec2 code template](./code/cftemplates/ec2-only/ec2.yml) to confirm that Ec2 instances are created in a specified VPC (private virtual network). <p>
2.&nbsp; Inspect the [S3 code template](./code/infrastructure-custom-repo/alb/prereq-s3.yml) to confirm that bucket policies are applied on the S3 bucket for Artifactory (for all compute types) and the S3 Bucket for Access Logs (for ELB: ALB & NLB compute types only).</td>

<td>

1.&nbsp; EC2 instances are created in specified VPCs only, where the VPC ID is stored in the SSM parameter store. <p>
2.&nbsp; S3 Bucket policies are defined on the S3 bucket for Artifactory and the S3 Bucket Access Logs (for ALB & NLB).
 </td>
<td align="center">✅</td>
<td align="center"> Implement Data Loss Prevention (DLP) </td>
<td align="center">🟢</td>
<td> EC2 instances are created in VPCs and S3 buckets are protected with bucket policies. </td>
</tr>

<tr valign="top">
<td align="center">4</td>
<td align="center">CAD-051</td>
<td align="left">Data/information must have the capability to be labelled according to its approved data classification.  </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
-&nbsp; The blueprint provides parameters to define the data classification label of the created resources. Tenants can only choose from CBA approved data classification labels. <p>
-&nbsp; The blueprint creates a `Data Classification` tag when the resource is created and takes the tenants’ selected label as a value for this tag. </td>

<td align="left">

1.&nbsp; Inspect the [Parameters code template](./code/cftemplates/alb/parameters.yml) to confirm the allowed values for the Data Classification parameter <p>
2.&nbsp; Inspect the [Stack code template](./code/cftemplates/alb/stack.yml) to confirm that `Data Classification` tag is created as part of the resource creation. </td>

<td >

1.&nbsp;The code enforces to use only CBA data classification labels. The default classification is set as `Confidential`.<p>
2.&nbsp;The `Data Classification` tag is created as part of the provisioned stack. The value of this tag refers to the label specified by the tenant.
 </td>
<td align="center">✅</td>
<td align="center"> Data classification </td>
<td align="center">⚫</td>
<td> Tenants to select their label as per their approved data classification</td>
</tr>

<tr valign="top">
<td align="center">5</td>
<td align="center">CAD-057</td>
<td align="left">Cyber security is engaged to assess and determine additional Crypto methods required for a system. This includes specifying requirements for encryption at rest (e.g. File encryption or application level), encryption-in-transit (methods and flows), hashing requirements and digital signatures. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Non-Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
Cyber architecture have been engaged to assess additional crypto methods required.

<td align="left">

Review the [Cyber Security assessment](./security.md) to confirm that it covers encryption requirements required for the blueprint. </td>  
<td>

Cyber engagement determined the need for the following additional encryption requirements:<br>
1.&nbsp; S3 Buckets: (Deny HTTP only traffic) <br>
2.&nbsp; SSL connections on Elastic Load Balancers (ELB) listener </td>

<td align="center">✅</td>
<td align="center", rowspan=2> Data Protection by Cryptography</td>
<td align="center", rowspan=2> 🟢</td>
<td rowspan=2> Encryption-in-transit is applied on S3 Buckets and ALB Listener

</tr>

<tr valign="top">
<td align="center">6</td>
<td align="center">CAD-059</td>
<td align="left">For each required crypto method, an approved cryptographic algorithm is selected and implemented. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ S3 Buckets &nbsp;✔ ALB** <p>
1.&nbsp;**S3 Bucket Artifactory (all compute types)**: Configured to deny HTTP traffic. <p>
2.&nbsp;**S3 Bucket Access Logs (ALB & NLB):** Configured to deny HTTP traffic. <p>
3.&nbsp;**ALB Compute type**: `HTTPS` listener is used which enables traffic encryption between the load balancer and the EC2 instances. `HTTPS` is enabled by deploying an SSL policy (note: default policy is configured in the parameter code template). </td>

<td align="left" align>

1.&nbsp; (a) Inspect the [ALB code template](./code/cftemplates/alb/alb.yml) to confirm an `HTTPS` listener is configured <br>
&nbsp; (b) Inspect the [ALB parameter code template](./code/cftemplates/alb/parameters.yml) and to confirm the use of an SSL Policy and inspected the [ALB stack code template](./code/cftemplates/alb/stack.yml) to confirm that an SSL policy is applied as part of the resource creation <p>
2.&nbsp; Inspect the [S3 code template](./code/infrastructure-custom-repo/alb/prereq-s3.yml) to confirm that the S3 bucket (Artifactory) has a setting to deny HTTP traffic - all compute types <p>
3.&nbsp; Inspect the [S3 code template](./code/infrastructure-custom-repo/alb/prereq-s3.yml) to confirm that the S3 bucket (ELB Access Logs) has a settings to deny HTTP traffic - NLB & ALB compute types. </td>

<td>

1.&nbsp; (a) An `HTTPS` listener is created to listen on port `443` and uses the defined SSL policy to enforce traffic encryption. <br>
&nbsp; (b) We noted that the default SSL policy was initially configured as TLS1.1 (unapproved protocol). Following the advise from ES CCO, this was rectified to apply a default SSL policy with TLS1.2 (approved protocol). The chosen SSL policy is stored in the parameter store and applied during the stack creation.  <p>
2.&nbsp;  S3 bucket (Artifactory) is configured to deny `http` traffic. <p>
3.&nbsp;  S3 bucket (Access Logs) is configured to deny `http` traffic. <p> </td>

<td align="center">✅</td></tr>

<tr valign="top">
<td align="center">7</td>
<td align="center">CAD-058</td>
<td align="left">Only approved geographic locations are used for data storage and resource creation. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
The blueprint defines Southeast-2 Region (Sydney) as a 'condition' to create the resources including: Load balancers, EC2 instances, SNS topic and S3 buckets.

<td align="left">

Inspect the [Prerequisite code template](./code/infrastructure-custom-repo/ec2-asg/prereqs.yml) to confirm that it specifies a condition to create resources in the AWS Sydney region only.   </td>
<td>

A condition is specified to enforce creation of resources in the `southeast-2` region (AWS Sydney). </td>

<td align="center">✅</td>
<td align="center"> Data Location </td>
<td align="center">🟢</td>
<td> Blueprint enforces the creation of resources in Southeast-2 (AWS Sydney Region)</td>
</tr>

<tr valign="top">
<td align="center">8</td>
<td align="center">CAD-077</td>
<td align="left">IT services and devices are categorised into a single network trust zone.</td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
The EC2 instances can be deployed into the following zones: Secured / Restricted / Controlled Internal / Management
Default zone: Controlled Internal. </td>

<td align="left">

1.&nbsp; Inspect the [parameters code template](./code/infrastructure-custom-repo/ec2-asg/parameters.yml) to confirm that it defines the network zone values to create EC2 instances. <p>
2.&nbsp; Inspect the [stack code template](./code/cftemplates/alb/stack.yml) to confirm that it applies the selected network zone value. </td>
<td>

The blueprint enforces tenants to choose a valid network zone to deploy their EC2 instances. The selected network zone is applied when resources are created.

<td align="center">✅</td>
<td align="center", rowspan=2> Network Segmentation and Segregation</td>
<td align="center", rowspan=2>⚫</td>
<td rowspan=2> Tenants to define their Security Groups and select the required network zone for deployment</tr>

<tr valign="top">
<td align="center">9</td>
<td align="center">CAD-082</td>
<td align="left">Firewall Rulesets should be defined and adequately approved using a least-connectivity model </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
**EC2 Instances:** The blueprint creates two Security Groups for egress / ingress control of traffic. Tenants can specify additional security groups in the parameter file (optional). The security group values are stored in the SSM store and applied as part of the resource creation. <p>
**ALB Only**: One additional security group is created </td>

<td align="left">

1.&nbsp; Inspect the [Security Group code template](./code/infrastructure-custom-repo/ec2-alb/prereqs.yml) for defined firewall rules for EC2 instances and ALB.   <p>
2.&nbsp; Inspect the [Parameter code template](.code/infrastructure-custom-repo/ec2-alb/parameters.yml) to confirm additional Security Groups (firewall rules) can be applied by tenants.</td>

<td>

1.&nbsp; The infrastructure prerequisite code creates two security groups (firewall rules) for EC2 instances and 1 security group for ALB to ensure resources are internally <p>
2.&nbsp; The parameter file provides an option to tenants to define additional firewall rules (Security Groups).
</td>
<td align="center">✅</td></tr>

<tr valign="top">
<td align="center">10</td>
<td align="center">CAD-084</td>
<td align="left">Standard infrastructure images/blueprints/cloud configuration patterns are developed for consistent and secure creation of new workload resource. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
**AMI (Operating System):** The latest approved AMI from Windows and Linux are configured in the parameter file as default values. (note: Tenants can choose their own AMIs, the blueprint does not enforce using only OneCloud AMIs) <p>
**S3 Buckets**: The S3 buckets are configured with 'Retain' properties to protect from accidental deletion of the stack.<p>
**EC2 Instances**: EC2 instances are configured to disable metadata version 1, and only use version 2 (additional protection).  
</td>

<td align="left">

1.&nbsp; Inspect the [Parameter code template](.code/infrastructure-custom-repo/ec2-alb/parameters.yml) to confirm using approved AMIs as default values. <p>
2.&nbsp; Obtain compliance status for EC2 instance configurations and validate that `imdsv1` is disabled using conformance pack check. <p>
3.&nbsp; Inspect the [S3 Code template](./code/infrastructure-custom-repo/alb/prereq-s3.yml) to confirm accidental deletion policy is applied.
</td>
<td>

1.&nbsp; The parameter file allows tenants to choose their AMIs, we note that latest windows and Linux AMIs are configured as default values. These are Cyber approved SOEs. <p>
2.&nbsp; All AWS Config rules are compliant for the sample EC2 instance checked using conformance pack, including using only `imdsv2` for additional protection. <p>
3.&nbsp; Both S3 buckets created (Artifactory and Access Logs) are protected from accidental deletion of the CF stack. However, we noted that the S3 Access Log bucket is not configured with `MFA Delete` to provide additional protection for logs in case of accidental deletion. </td>

<td align="center">✅</td>
<td align="center"> Security Configuration Management  </td>
<td align="center">⚫</td>
<td>

Tenants to choose an approved AMI and enable `MFA Delete` on the S3 Access Logs bucket. </td>
</tr>

<tr valign="top">
<td align="center">11</td>
<td align="center">CAD-089</td>
<td align="left">New assets are added to the approved security vulnerability scanning tool(s).</td>

<td align="center">

`Implemented`<br>
`Inherited` <br>
`Non-Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
This control is provided by OneCloud if an approved OneCloud AMI (SOE) is utilised for creating EC2 instances (Qualys agents baked with the AMI).  
</td>

<td align="left">

NA - Inherited control from OneCloud
</td>
<td>

The blueprint provides this control by inheritance from OneCloud if an approved AMI is used to create the EC2 instances.
</td>

<td align="center">✅</td>
<td align="center"> System vulnerabilities are identified and reported </td>
<td align="center">⚫</td>
<td> Tenants to choose an approved AMI to leverage this control.</td>
</tr>

<tr valign="top">
<td align="center">12</td>
<td align="center">CAD-095</td>
<td align="left">Known vulnerabilities with severity rating of 'high' and above are patched prior to go-live.
<td align="center">

`Implemented`<br>
`Inherited` <br>
`Non-Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
This control is provided by OneCloud if an approved OneCloud AMI (SOE) is utilised for creating EC2 instances.  
</td>
<td align="left">

NA - Inherited control from OneCloud
</td>
<td>

The blueprint provides this control by inheritance from OneCloud if an approved AMI is used to create the EC2 instances.
</td>
<td align="center">✅</td>
<td align="center"> Vulnerability Patch Management </td>
<td align="center">⚫</td>
<td> Tenants to choose an approved AMI to leverage this control. </td>
</tr>

<tr valign="top">
<td align="center">13</td>
<td align="center">CAD-101</td>
<td align="left">All group systems including systems managed  by 3rd parties must use anti-malware software, or compensating controls.
<td align="center">

`Implemented`<br>
`Inherited` <br>
`Non-Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
This control is provided by OneCloud if an approved OneCloud AMI (SOE) is utilised for creating EC2 instances.  
</td>
<td align="left">

NA - Inherited control from OneCloud
</td>
<td>

The blueprint provides this control by inheritance from OneCloud if an approved AMI is used to create the EC2 instances.
</td>
<td align="center">✅</td>
<td align="center">Protection from Malware execution  </td>
<td align="center">⚫</td>
<td> Tenants to choose an approved AMI to leverage this control.</td>
</tr>

<tr valign="top">
<td align="center">14</td>
<td align="center">CAD-105</td>
<td align="left">Secure security logging must be in place and designed to be consistent and immutable. Information captured in logs must not include information which is classified as Confidential or higher (such as passwords, credit card numbers and TFNs). </td>

<td align="center">

`Implemented`<p>
EC2, EBS & SNS: <br>
`Inherited`<br>
`Non-codified`<p>
ALB & NLB: <br>
`Embedded`<br>
`Codified`
</td>

<td align="left">

**EC2, EBS and SNS Topics:** <br>
CloudTrail Activity Logs and CloudWatch are inherited features provided by [AWS](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/using-cloudtrail.html). <p>

**AMI (OS / Application Logs)**:
This is inherited from OneCloud if tenants use an approved SOE where splunk agents are baked into the AMI.<p>

**ELB (ALB & NLB):** <br>
On top of CloudTrail, additional Access Logs to capture detailed information about requests sent to the load balancer (ALB or NLB) are enabled where these logs are captured on an S3 Bucket created by the blueprint and protected by a bucket policy and native encryption-at-rest.
</td>

<td align="left">

**1.&nbsp; ALB & NLB:** Inspect the [ALB code template](./code/cftemplates/alb/alb.yml) to confirm that it is configured to enable ELB access logs.  <p>
**2.&nbsp; EC2 / AMI / EBS / SNS logs:** N/A - Inherited from AWS & OneCloud
</td>
<td>

Parameter `access_logs.s3.enabled`, which indicates whether access logs are enabled on load balancers, is set to `true`.
</td>

<td align="center">✅</td>
<td align="center", rowspan=3> Cyber attack detection</td>
<td align="center", rowspan=3>⚫</td>
<td rowspan=3> Tenants to on-board logs to the ELP and define lifecycle to the ELB Access Logs
</tr>

<tr valign="top">
<td align="center">15</td>
<td align="center">CAD-107</td>
<td align="left">Logs should be sent back (from workloads) to CBAs centralised logging system for Security incident and event monitoring.</td>

<td align="center">

`Implemented`<br>
`Inherited` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
This control is provided by OneCloud if an approved OneCloud AMI (SOE) is utilised for creating EC2 instances (Splunk agents baked into AMI).  

<td align="left">

NA - Inherited control from OneCloud
<td>

The blueprint provides this control by inheritance from OneCloud if an approved AMI is selected to create the EC2 instances.

<td align="center">✅</td></tr>  

<tr valign="top">
<td align="center">16</td>
<td align="center">CAD-108</td>
<td align="left">Security logging must be only readable by authorised parties ensuring confidentiality </td>

<td align="center">

`Implemented`<p>
EC2, EBS & SNS: <br>
`Inherited`<br>
`Non-codified`<p>
ALB & NLB: <br>
`Embedded`<br>
`Codified`
</td>
<td align="left">

**EC2, EBS and SNS Topics:** <br>
Access to the CloudTrail and CloudWatch logs is inherited from OneCloud user access management. <p>

**AMI (OS / Application Logs)**:
NA - control is not provide by the blueprint, it is tenant responsibility to define access to security logs at the OS level.<p>

**ELB (ALB & NLB):** <br>
Access to the S3 Bucket Access Logs for load balancers is controlled by a defined Bucket Policy, which restricts permissions and allow access to the AdminUserRole, CloudformationAdminRole and AcoeCICDRole roles. On top of CloudTrail, additional Access Logs to capture detailed information about requests sent to the load balancer (ALB or NLB) are enabled where these logs are captured on an S3 Bucket created by the blueprint and protected by a bucket policy and native encryption-at-rest. </td>

<td align="left" >

Inspect the [ALB S3 code template](./code/infrastructure-custom-repo/alb/prereq-s3.yml) to confirm that access permissions are defined and controlled by a bucket policy.

<td>

The S3 Bucket created to capture ELB Access Logs is protected with a bucket policy, which restricts access to the Admin roles defined in CAD-023. The permissions are tightened with a `PutObject` only permission granted to write access logs to the bucket.

<td align="center">✅</td></tr>

<tr valign="top">
<td align="center">17</td>
<td align="center">CAD-132</td>
<td align="left">Test plans/cases are created and adequately approved to ensure all functional and non-functional requirements are tested and success criteria is defined.  </td>

<td align="center">

`Future`
</td>
<td align="left">

This is a future control for blueprints, to be implemented in future releases.

<td align="left">

NA - Control is not implemented in this release. </td>
<td> NA - Control is not implemented in this release.</td>
<td align="center">⬛</td>
<td align="center">Technology change must demonstrate appropriate functional and non-functional testing </td>
<td align="center">⚫</td>
<td> Control is not provided by this blueprint's release, tenants to perform their own functional testing.</td>
</tr>

<tr valign="top">
<td align="center">18</td>
<td align="center">CAD-142</td>
<td align="left">Code changes must be peer reviewed and approved by an individual that did not contribute to the authoring of the code, to identify potential vulnerabilities or malicious code before deploying the code into a production environment. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Non-Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
Cyber architecture are involved to perform an Cyber assessment on the blueprint and are configured as one of the approvals of the blueprint code. The Cyber assessment includes an independent review of the BP's code. </td>

<td align="left">

Inspect that Cyber Architecture members are configured as approvals of the blueprint code and confirm that a Cyber assessment of the blueprint code is completed. </td>

<td>

A [cyber assessment](./security) on the blueprint code is completed. Cyber architecture are one included as approvals to the Blueprint repo code. </td>

<td align="center">✅</td>
<td align="center">Secure Code Review </td>
<td align="center">⚫</td>
<td> Involve Cyber Architecture to perform a review of the deployed code</td>
</tr>  

<tr valign="top">
<td align="center">19</td>
<td align="center">CAD-154</td>
<td align="left">All logs to be configured to be sent to a centralised segregated logging solution </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**✔ EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
Detailed monitoring feature is enabled on EC2 instances, which collects additional metrics where these logs are captured in CloudWatch. <p>
**ASG, NLB & ALB (only):** <br>
An SNS topic is provided by the blueprint to provide notification about auto scaling and facilitate monitoring of the EC2 instances. (Tenants can also configure / select their own SNS topic as part of the blueprint deployment.)
</td>

<td align="left">

1.&nbsp; Inspect the template codes for each compute type to confirm that Detailed Monitoring is `enabled`. <p>
2.&nbsp; For ASG, NLB, ALB prerequisite templates, inspect that the blueprint requires an SNS topic to be specified as one of the parameters by tenants and also validate that the blueprint creates an SNS topic if it is not specified by the tenant.
</td>
<td>

1.&nbsp; `Monitoring` parameter is configured to `true` for ALB, NLB and ASG compute types. For [EC2-only](./code/cftemplates/ec2-only/ec2.yml) compute type `monitoring` has not been configured **(issue)** <br>
Note: Following our discovery, the Engineering team has rectified the issue as part of this release and merged the update into the current code base. This has been validated, hence the issue will not be reported in the findings section <p>

2.&nbsp; SNS Topic ARN is required to be defined as one of the parameters, if not defined the blueprint is configured to create an SNS topic.
</td>

<td align="center">✅</td>
<td align="center">IT Service Monitoring and Event Management </td>
<td align="center">⚫</td>
<td> Tenants to on-board logs to the ELP and select/configure the SNS topic</td>
</tr>  

<tr valign="top">
<td align="center">20</td>
<td align="center">CAD-163</td>
<td align="left">To improve RPO capabilities, snapshots should be used particularly for critical databases or systems of record</td>

<td align="center">

`Future`<br>
</td>
<td align="left">

This is a future control for blueprints, to be implemented in future releases.</td>

<td align="left">

NA - Control is not implemented in this release. </td>
<td> NA - Control is not implemented in this release.</td>
<td align="center">⬛</td>
<td align="center">Data backup and restoration </td>
<td align="center">⚫</td>
<td> Control is not provided by this blueprint's release, tenants to perform their own EBS lifecycle.</td>
</tr>

<tr valign="top">
<td align="center">21</td>
<td align="center">CAD-170</td>
<td align="left">Architecture components are designed for failure so the service can still meet their availability targets by still functioning whilst healing/correction activities occur. </td>

<td align="center">

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**🚫 EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
Instances in autoscaling groups are configured to automatically re-launch unhealthy EC2 instances. <br>
For blueprint configuration  with load balancers, the health status of the instances is monitored by the Load balancers where traffic is only distributed to the healthy targets. <br>
*Note: Tenants need to define their desired instance count (min, max) and scaling policy as part of the initial blueprint parameter setup.*
</td>
<td align="left">

Inspect the [ASG code template](./code/cftemplates/ec2-asg/ec2-asg.yml) to confirm ASG configuration to launch failed EC2 instances  </td>
<td> An ASG launch template is provided as part of the blueprint, which takes parameters set up by tenants such as the EC2 instance count and the scaling policy. The grace period to wait before checking the health status of a launched instance is configured to be 600 seconds, which provides ample warm-up time for the EC2 instances.</td>

<td align="center">✅</td>
<td align="center", rowspan=2>IT Service Continuity processes are in place</td>
<td align="center", rowspan=2>⚫</td>
<td rowspan=2> Tenants to define their AZs, instance counts and scaling policy </td>
</tr>

<tr valign="top">
<td align="center">22</td>
<td align="center">CAD-171</td>
<td align="left">Workloads should be architectured for resilience using high availability and recovery mechanisms. For workloads that require higher resiliency, consider a multi-region deployment (where feasible)</td>

<td align="center" >

`Implemented`<br>
`Embedded` <br>
`Codified`
</td>
<td align="left">

**🚫 EC2 &nbsp;✔ ASG &nbsp;✔ NLB &nbsp;✔ ALB** <p>
The blueprint provides the option to configure High Availability by running active/active instances across multiple availability zones (tenants need to define their subnet ids across multiple AZs). When one Availability Zone becomes unhealthy or unavailable, Auto Scaling launches new instances in an unaffected Zone. NLB & ALB are configured to ensure that traffic is only distributed to healthy EC2 instances, hence ensuring service availability.
</td>

<td align="left">

1.&nbsp; Inspect the [ALB code template](./code/cftemplates/alb/alb.yml) to validate configurations of the application load balancer target group. <p>
2.&nbsp; Inspect the [NLB code template](./code/cftemplates//nlb/nlb.yml) to validate configurations of the network load balancer target group.
 </td>
<td>

1.&nbsp; The health status of EC2 instances is configured to be checked every 10 seconds interval and deems an instance to fail the health check if no response is received within 3 seconds. The instance is deemed unhealthy after failing 3 consecutive health checks. At that point the ASG is configured to launch a new instance (depends on the defined scaling policy and instance counts). <p>
2.&nbsp; The health status of EC2 instances is configured to be checked using Route53 DNS record with tenant’s defined GTM policy. The drainage policy is set to be 60 seconds at which the NLB deems the EC2 to be unused.  
<td align="center">✅</td></tr>

</tbody> </table>
</details>

## 4.0 Appendices

### 4.1 CAD evaluation definitions

![DE Rating Scale](./compute-types/attachments/DEscale.PNG)

### 4.2 Supporting documentation

| No. | Document                            |
|-----|-------------------------------------|
|  1  | [CAD list (v1.3)](https://commbank.sharepoint.com/:x:/s/ES-OneCloudRiskandSecurityCoE/EQb5_vilCSlMvCGJwwHueDUB0E1ZF0dcxCahcgWKay0ntw?e=GSJeVr&isSPOFile=1) |
|  2  | [Blueprint Design](./readme.md)  |
|  3  | [Evidence of CAD assessment](./compute-types/attachments/ec2-internal-v1.pdf) |    

