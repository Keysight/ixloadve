## <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Microsoft_Azure.svg/1024px-Microsoft_Azure.svg.png" alt="Azure Logo" width="150"/> Microsoft Azure

### 🚀 Deployment

Version **11.00** of IxLoad Virtual Edition is available on the Microsoft Azure Marketplace here:

- [Keysight IxLoad Virtual Edition Marketplace](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/keysight-technologies-ixvm.keysight-ixload-virtual-edition?tab=Overview)

This product contains both the IxLoad VE Client and Virtual Test Appliance as part of the product subscription.
---

#### 🔧 Prerequisites

Before you begin, ensure you have the following:
- **Azure Account**: An active Azure account with appropriate permissions.
- **Azure CLI**: Installed and configured with your credentials. Install Azure CLI or Cloud Shell
- **IxLoad VE License**: Ensure you have a valid license for IxLoad Virtual Edition.
---

### 📦 Deployment Manager Templates

Located in `microsoft-azure/Deployment/AzureResourceManager/IxLoad-FullDeployment`, these ARM templates are organized into:

  - **Demo Use Case**: Full deployment including networking, security groups, etc.
  - **Add-On Use Case**: Designed to integrate with existing infrastructure
---

#### 🧪 Example #1: Deploying a Demo Use Case Template with one Virtual IxLoad VE Client + a single Virtual Test Appliance

**Resources Created:**
- 1x IxLoad VE Client
- 1x Virtual Test Appliance
- A dedicated VNET network
- Subnet and firewall rules for SSH, RDP and test traffic
- External IP address (optional)

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Azure Cloud Console.
2. **Upload the Paramters and Template files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
az deployment group create --name IxLoad-demo-01 --resource-group IxLoad-demo-01 --template-file Azure-VTA-1-Arm_Demo_Use_Case_Template.json--parameters Azure-VTA-1-Arm_Demo_Use_Case_Parameters.json
```

#### 🧪 Example #2: Deploying a Add On Use Case Template with one IxLoad VE Client and one Virtual Test Appliances

**Resources Created:**
- 1x IxLoad VE Client
- 1x Virtual Test Appliances
- Firewall rules for SSH, RDP and test traffic
- External IP addresses (optional)

---

### 🚀 Deployment Steps:

1. **Open Cloud Shell** in the Azure Cloud Console.
2. **Upload the Paramters and Template files**.
3. **Run the deployment command for Virtual Test Appliance use cases**:

```bash
az deployment group create --name IxLoad-addon-01 --resource-group IxLoad-addon-01 --template-file Azure-VTA-1-Arm_Add-On_Use_Case_Template.json  --parameters Azure-VTA-1-Arm_Add-On_Use_Case_Parameters.json
```