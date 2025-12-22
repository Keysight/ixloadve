## <img src="https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png" alt="AWS Logo" width="50"/> Amazon Web Services (AWS)

### 🚀 Deployment

Version **26.0.0** of IxLoad Virtual Edition is available on the AWS Marketplace split into two different products:

- [Keysight IxLoad Virtual Edition Client](https://aws.amazon.com/marketplace/pp/prodview-fee3kemll2qvy)
- [Keysight IxLoad Virtual Test Appliance](https://aws.amazon.com/marketplace/pp/prodview-ytjro3kw7ad26)

The IxLoad Virtual Edition product is split between the two above VMs. Please make sure that you subscribe to all of them before moving forward. 

---
#### 🔧 Prerequisites

Before you begin, ensure you have the following:
- **AWS Account**: An active AWS account with appropriate permissions.
- **IxLoad VE License**: Ensure you have a valid license for IxLoad Virtual Edition.
---

### 📦 CloudFormation Templates

Located in `aws/Deployment/CloudFormation/IxLoad-FullDeployment` and `aws/Deployment/CloudFormation/IxLoad-TestApplianceOnly`, these JSON templates are organized into:

- **Demo Use Case**: Full deployment including networking, security groups, etc.
- **Standalone Use Case**: Similar to Demo, but allows parameter customization (e.g., VPC CIDR)
- **Add-On Use Case**: Designed to integrate with existing infrastructure
---

#### 🧪 Example #1: Deploying a Demo Use Case Template with one Virtual IxLoad VE Client + two Virtual Test Appliance

**Resources Created:**
- 1x IxLoad VE Client
- 2x Virtual Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

To deploy a full IxLoad VE environment using a CloudFormation template for Virtual Test Appliance use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-2-VTA-Demo \
  --template-body file://aws/Deployment/CloudFormation/IxLoad-FullDeployment/AWS-2-VTA-Demo-Use-Case.json
```

**This method is applicable for all templates that deploy from 2 up to 14 Virtual Test Appliances**

---

#### 🧷 Example #2: Deploying an Add-On Use Case Template with one IxLoad VE Client and two Virtual Test Appliance

This adds a the IxLoad VE Client and a Virtual Test Appliance to an existing infrastructure (e.g., VPC, subnets).

**Resources Created:**
- 1x IxLoad VE Client
- 2x Virtual Test Appliance
- Firewall rules for SSH, RDP and test traffic
- External IP address (optional)

For **Virtual Test Appliance** use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-2-VTA-Add-On \
  --template-body file://aws/Deployment/CloudFormation/IxLoad-FullDeployment/AWS-2-VTA-Add-On-Use-Case.json
```

### 📋 Notes
- Ensure the AWS CLI is configured with appropriate credentials and region.
- Replace file paths and parameter files with your actual paths if different.
---

#### 🧪 Example #3: Deploying a Demo Use Case Template with one Virtual Test Appliance

**Resources Created:**
- 1x Virtual Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

For **Virtual Test Appliance** use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-1-VTA-Demo \
  --template-body file://aws/Deployment/CloudFormation/IxLoad-TestApplianceOnly/AWS-1-VTA-Demo-Use-Case.json
```

**This method is applicable for all templates that deploy from 1 up to 2 Virtual Test Appliances**

#### 🧪 Example #4: Deploying an Add-On Use Case Template with one Virtual Test Appliance

**Resources Created:**
- 1x Virtual Test Appliance
- Firewall rules for SSH, RDP and test traffic
- External IP address (optional)

For **Virtual Test Appliance** use cases:

```bash
aws cloudformation create-stack \
  --stack-name AWS-1-VTA-Add-On \
  --template-body file://aws/Deployment/CloudFormation/IxLoad-TestApplianceOnly/AWS-1-VTA-Add-On-Use-Case.json
```

### 📋 Notes
- Ensure the AWS CLI is configured with appropriate credentials and region.
- Replace file paths and parameter files with your actual paths if different.
---