# MS Teams Observability

The MS Teams Observability Agent provides a smart collector that refines call metadata and service‑health data from Microsoft Graph API. 

It supports exporting enriched observability data to multiple backends including **Dynatrace** and **Splunk**. 
It ships with ready‑to‑use visualizations so you can monitor Teams call quality and service status across your organization.

Dynatrace Hub page for the [Dynatrace App](https://www.dynatrace.com/hub/detail/microsoft-teams-observability/).

Splunkbase page for the [Splunk App](https://splunkbase.splunk.com/app/7850/) (Coming soon).

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
- Call Queue Records
- Auto Attendant Records
- MS Teams Service health and announcements

### Dynatrace Visualizations

#### Main page

![image](./src/assets/images/Dynatrace/App_%231_Tab_Home.png)

#### Calls list

![image](./src/assets/images/Dynatrace/App_%233_Choose_Call.png)

#### Call Details

![image](./src/assets/images/Dynatrace/App_%234_Tab_CallRecordOverview.png)

#### MS Teams Published Issues

![image](./src/assets/images/Dynatrace/App_%235_Tab_MicrosoftIssues.png)

#### Teams performance by locations

![image](./src/assets/images/Dynatrace/App_%232_Site_Overview.png)

#### Data flow for Dynatrace

MS Teams metadata are sent to your Dynatrace tenant, processed by OpenPipeline, stored in a dedicated Grail bucket, and then visualized in the dedicated app or dashboards.

<p align="center">
  <img src="./src/assets/images/Dynatrace/Architecture-DT.png" width=60%>
</p>

### Splunk Visualizations

#### Main page

![image](./src/assets/images/Splunk/App_%231_Overview.png)

#### Site Quality

![image](./src/assets/images/Splunk/App_%233_Site_Quality.png)

#### Call Details

![image](./src/assets/images/Splunk/App_%232_Call_Details.png)

#### Global Network Performance Assessment

![image](./src/assets/images/Splunk/App_%234_NPA.png)

#### Data flow for Splunk

MS Teams metadata are sent to your Splunk HEC and then visualized in your custom dashboards.

<p align="center">
  <img src="./src/assets/images/Splunk/Architecture-Splunk.png" width=60%>
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
