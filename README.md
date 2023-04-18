# Overview

This repository contains instructions and files for deploying ZPA LSS logs into Microsoft Sentinel using the Azure Monitor Agent.

## Step 1:

Deploy VM with Azure Monitor Agent Extension - https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-manage?tabs=azure-portal 

Ensure the VM has its syslog daemon enabled to receive logs on TCP port 514.

## Step 2:

Deploy an App Connector and LSS as per the following guide - https://help.zscaler.com/zpa/connector-deployment-guide-microsoft-azure 

Ensure you configure the Log Receiver to be the Public IP address of the VM with the Azure Monitor Agent Extension installed and configured to receive logs on TCP port 514.

While configuring the Log Receiver, choose JSON as Log Template

## Step 3:

Collect text logs with Azure Monitor Agent - https://learn.microsoft.com/en-us/azure/azure-monitor/agents/data-collection-text-log?tabs=portal

Create a new table called ZPA2_CL using the CreateTable.ps1 powershell script. Ensure you replace the subscription, resource group and workspace name with the details from your Microsfot Sentinel instance.

## Step 4:

Under Home > Monitor > Data Collection Rules > + Add a Data Source with the following information -

- Data Source Type: Custom Text Logs
- File Pattern: /var/log/syslog
- Table Name: ZPA2_CL
- Transform: source

## Step 5:

Under Home > Monitor > Logs create a new querty, and paste in the contents of the file ZPA2Event.kql

Save this as a function, and name it ZPA2Event
