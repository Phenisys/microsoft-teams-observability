# MS Teams Observability App

A Dynatrace app to collect and analyze Microsoft Teams call data.



## Table of Contents

[Overview](#overview)  
[Prerequisites](#prerequisites)  
[Configuration Steps](#configuration-steps)  




## Overview

The agent connects to Microsoft Graph to retrieve:

- Call details (duration, participants, health)
- Media stream metadata 
- Service health and announcements  

**Data flow**  
Logs are sent to your Dynatrace tenant, processed by OpenPipeline, stored in a dedicated Grail bucket, and then visualized in the dedicated app.

<p align="center">
  <img src="./src/assets/images/architecture.png" width=900>
</p>



## Prerequisites

- Azure AD Token or Certificate with following permissions:
  - CallRecords.Read.All
  - ServiceHealth.Read.All
  - Reports.Read.All
- Dynatrace SaaS
- VM Linux or Windows x64

## Configuration Steps

1. [Configure Azure Permissions](./wiki/azure-permissions)
2. [Configure Dynatrace environment](./wiki/dynatrace-setup)
3. [Install the MS Teams Observability App](./wiki/app-installation)
4. [Deploy the Agent](./wiki/agent-deployment)

