# MS Teams Observability

The MS Teams Observability Agent provides a smart collector that refines call metadata and service‑health data from Microsoft Graph API. 

It supports exporting enriched observability data to multiple backends including **Dynatrace** and **Splunk**. 
It ships with ready‑to‑use visualizations so you can monitor Teams call quality and service status across your organization.

Dynatrace Hub page for the [Dynatrace App](https://www.dynatrace.com/hub/detail/microsoft-teams-observability/).

Splunkbase page for the [Dynatrace App](https://splunkbase.splunk.com/app/7850/) (Coming soon).

## Table of Contents

- [Overview](#overview)
- [Dynatrace Visualizations](#dynatrace-visualizations)
- [Splunk Visualizations](#splunk-visualizations)
- [Prerequisites](#prerequisites)  
- [Configuration Steps](#configuration-steps--documentation)  

## Overview

The collector connects to Microsoft Graph to retrieve:
- Call Records
- PSTN Call Records
- Direct Routing Records
- MS Teams Service health and announcements

### Dynatrace Visualizations

#### Main page

![image](https://github.com/user-attachments/assets/1578f49f-4170-40af-a7db-f71653c48a33)

#### Calls list

![image](https://github.com/user-attachments/assets/3913a0d9-7fb7-479f-a956-ad566dc9be9a)

### Call Details

![image](https://github.com/user-attachments/assets/b426c6f0-6ae6-49e8-9978-03729ff694ee)

#### MS Teams Published Issues

![image](https://github.com/user-attachments/assets/b4444ab5-ff7f-4068-949d-96774de44a41)

#### Teams performance by locations

![image](https://github.com/user-attachments/assets/62ee70f5-3761-4797-83cf-a3846a9b67cf)

#### Data flow for Dynatrace

MS Teams metadata are sent to your Dynatrace tenant, processed by OpenPipeline, stored in a dedicated Grail bucket, and then visualized in the dedicated app or dashboards.

<p align="center">
  <img src="https://github.com/user-attachments/assets/e019469a-8eb9-4ec5-98a3-bacea3bfabe7" width=60%>
</p>

### Splunk Visualizations

#### Main page

![image](https://github.com/user-attachments/assets/1d8a9e2a-fe5c-41f0-a443-44db31c1a6af)

#### Site Quality

![image](https://github.com/user-attachments/assets/24068e6e-3e4c-4ab8-b3fe-f3b12057919d)

#### Call Details

![image](https://github.com/user-attachments/assets/fb5dcd61-da39-4266-b116-f56dc5eb4768)

#### Global Network Performance Assessment

![image](https://github.com/user-attachments/assets/6e9273ea-582a-403f-a6ee-fa12af2a5686)

#### Data flow for Splunk

MS Teams metadata are sent to your Splunk HEC and then visualized in your custom dashboards.

<p align="center">
  <img src="https://github.com/user-attachments/assets/25a01b75-a6c2-4ea1-a0bb-070b7d3fa4c3" width=60%>
</p>

## Prerequisites

- Azure AD Token or Certificate with following permissions:
  - *CallRecords.Read.All*
  - *ServiceHealth.Read.All*
  - *Reports.Read.All*
- VM Ubuntu 22.04 x64 or Windows x64
- A supported Observability backend: 
  -	Dynatrace (via Grail/OpenPipeline)
  -	Splunk (via HTTP Event Collector)
  - And more to come!

## Configuration Steps & Documentation

Take a look at our frequently updated [Wiki](https://github.com/Phenisys/microsoft-teams-observability/wiki) for the latest information.
