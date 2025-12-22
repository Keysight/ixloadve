## <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Google_Cloud_logo.svg/1920px-Google_Cloud_logo.svg.png" alt="GCP Logo" width="150"/> Google Cloud Platform (GCP)

### 🔧 Configurations

This folder contains several IxLoad VE .rxf configurations that can be used on their respective instance sizes. 
We have 4 different folders: 
- C2-STANDARD-4
- C2-STANDARD-8
- C2-STANDARD-16

### 🚀 Deployment

Version **26.0.0** of IxLoad Virtual Edition is available on the GCP Marketplace here:

- [Keysight IxLoad Virtual Edition Marketplace](https://console.cloud.google.com/marketplace/product/keysight-public/keysight-IxLoad-virtual-edition)

This product contains both the IxLoad VE Client and Virtual Test Appliance as part of the product subscription.
---

#### 🔧 Prerequisites

Before you begin, ensure you have the following:
- **GCP Account**: An active GCP account with appropriate permissions.
- **GCP CLI**: Installed and configured with your credentials. Install GCP CLI
- **IxLoad VE License**: Ensure you have a valid license for IxLoad Virtual Edition.
---

### 📦 Deployment Manager Templates

Located in `google-cloud-platform/Deployment/DeploymentManager/IxLoad-FullDeployment` and `google-cloud-platform/Deployment/DeploymentManager/IxLoad-TestApplianceOnly`, these JINJA templates are organized into:

  - **Demo Use Case**: Full deployment including networking, security groups, etc.
---

#### 🧪 Example #1: Deploying a Demo Use Case Template with one IxLoad VE Client and one Virtual Test Appliance

**Resources Created:**
- 1x IxLoad VE Client
- 1x Virtual Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instance
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `instance_name`: Name of the VM instance
- `machine_type`: GCP machine type
- `external_ip`: Boolean to assign an external IP
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-1-VTA-Demo-Use-Case --template GCP-1-VTA-Demo-Use-Case.jinja
```

#### 🧪 Example #2: Deploying a Demo Use Case Template with one Virtual IxLoad Client and two Virtual Test Appliances

**Resources Created:**
- 1x IxLoad VE Client
- 2x Virtual Test Appliances
- A dedicated VPC network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP addresses (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instances
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `client_instance_name`: Name of the IxLoad VE Client VM
- `appliance1_instance_name`: Name of the first Test Appliance VM
- `appliance2_instance_name`: Name of the second Test Appliance VM
- `machine_type`: GCP machine type 
- `external_ip`: Boolean to assign external IPs
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-2-VTA-Demo-Use-Case --template GCP-2-VTA-Demo-Use-Case.jinja
```

#### 🧪 Example #3: Deploying a Demo Use Case Template with one Virtual Test Appliance

**Resources Created:**
- 1x Virtual Test Appliance
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP address (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instance
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `instance_name`: Name of the Test Appliance VM
- `machine_type`: GCP machine type
- `external_ip`: Boolean to assign an external IP
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-1-VTA-Demo-Use-Case --template GCP-1-VTA-Demo-Use-Case.jinja
```

#### 🧪 Example #4: Deploying a Demo Use Case Template with two Virtual Test Appliances

**Resources Created:**
- 2x Virtual Test Appliances
- A dedicated VPC network
- Subnet and firewall rules for SSH and test traffic
- External IP addresses (optional)

**Parameters (via schema):**
- `project_id`: GCP project where resources will be deployed
- `region`: GCP region for the deployment
- `zone`: GCP zone for the VM instances
- `vpc_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
- `appliance1_instance_name`: Name of the first Test Appliance VM
- `appliance2_instance_name`: Name of the second Test Appliance VM
- `machine_type`: GCP machine type (e.g., `n1-standard-4`)
- `external_ip`: Boolean to assign external IPs
- `network_tags`: Optional tags for firewall rules

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Google Cloud Console.
2. **Upload the `.jinja` and `.schema` files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
gcloud deployment-manager deployments create GCP-2-VTA-Demo-Use-Case --template GCP-2-VTA-Demo-Use-Case.jinja
```