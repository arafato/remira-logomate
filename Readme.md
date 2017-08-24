# Remira Logomate on Azure
ARM Template to deploy the Remire Logomate environemnt onto Azure. Note that this is purely a proof of concept setup and not suited for production scenarios! Additional security measures and configurations may be needed.
The environment consists of
- 1 VNET (10.0.0.0/16) which contains one subnet (10.0.0.0/24) 
- 1 VM (cannot be scaled out) that runs the Logomate backend
- 1 Azure SQL database 
- 1 Azure Blob Storage that will be used for data exchange between a customer and its Logomate environment  

Additionally, an external Azure storage account (and its account key) needs to be specified that hosts the installation scripts and assets. This account is not part of a customer environment.
As an example we are triggering the execution of the script [https://github.com/arafato/remira-logomate/blob/master/scripts/install.ps1](https://github.com/arafato/remira-logomate/blob/master/scripts/install.ps1) which sends an event to the Windows event log during VM provisioning. Script execution can be configured and adapted here: [https://github.com/arafato/remira-logomate/blob/master/azuredeploy.json#L192-L200](https://github.com/arafato/remira-logomate/blob/master/azuredeploy.json#L192-L200)

## Deployment
To facilitate automated deployment with the command line please use the [Azure CLI 2.0](https://docs.microsoft.com/cli/azure/install-azure-cli):
Before you deploy the ARM script make sure to adapt the standard configuration of user names, passwords, storage accounts, etc. to your needs here: [https://github.com/arafato/remira-logomate/blob/master/azuredeploy.parameters.json](https://github.com/arafato/remira-logomate/blob/master/azuredeploy.parameters.json)

Then, create a resource group e.g. in North Europe:
```
$ az group create -n <resource-group> -l northeurope
```

Finally, start the provisioning of the environment:
```
$  az group deployment create -g <resource-group> --mode Complete --template-file azuredeploy.json --parameters @azuredeploy.parameters.json
```

If you want to deploy into a different Azure environment such as Azure Germany, please re-configure your CLI accordingly. See [https://docs.microsoft.com/azure/germany/germany-get-started-connect-with-cli](https://docs.microsoft.com/azure/germany/germany-get-started-connect-with-cli) for details.

Alternatively, click on below button to deploy the entire environment to the Azure Global Cloud.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Farafato%remira-logomate%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

