Overview

This repository contains instructions and fies for deploying ZPA LSS logs into Microsoft Sentinel using the Azure Monitor Agent.

Step 1:

Deploy VM with Azure Monitor Agent Extension - https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-manage?tabs=azure-portal 

Step 2:

Collect text logs with Azure Monitor Agent - https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-manage?tabs=azure-portal 

Step 3:

Create a new table called ZPA2_CL using the CreateTable.ps1 powershell script. Ensure you replace the subscription, resource group and workspace name with the details from your Microsfot Sentinel instance.

Step 4:

Under Home > Monitor > Data Collection Rules > + Add a Data Source with the following information -

Data Source Type: Custom Text Logs
File Pattern: /var/log/syslog
Table Name: ZPA2_CL
Transform: source

Step 5:

Under Home > Monitor > Logs create a new querty, and paste in the contents of the file ZPA2Event.kql

Save this as a function, and name it ZPA2Event
