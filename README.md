[![Documentation](https://img.shields.io/badge/Documentation-Online-blueviolet?logo=gitbook)](https://phenisys.github.io/microsoft-teams-observability-documentation/)
[![Dynatrace App](https://img.shields.io/badge/Dynatrace-App-1e8c8f)](https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app)
[![Dynatrace Extension](https://img.shields.io/badge/Dynatrace-EF2_Extension-0a6cff)](https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension)
[![Dynatrace Hub](https://img.shields.io/badge/Dynatrace-Hub-00b140)](https://www.dynatrace.com/hub/detail/microsoft-teams-observability/)
[![Splunk App](https://img.shields.io/badge/Splunk-App-black?logo=splunk)](https://splunkbase.splunk.com/app/7850)

# Microsoft Teams Observability

**Microsoft Teams Observability** provides a collector for Microsoft Teams telemetry and service health data.

It connects to Microsoft Graph, collects and enriches Microsoft Teams observability data, and exports it to supported backends such as **Dynatrace** and **Splunk**.

This repository is the **core collector project** of the solution.

---

## What the collector does

The collector retrieves and processes Microsoft Teams observability data including:

- Call Records
- PSTN Call Records
- Direct Routing Records
- Call Queue Records
- Auto Attendant Records
- Microsoft Teams service health and announcements

It is designed to help teams monitor collaboration experience, investigate call quality issues, and feed backend-specific dashboards and troubleshooting workflows.

---

## Getting started

For prerequisites, installation, configuration, and backend integration, use the public documentation:

https://phenisys.github.io/microsoft-teams-observability-documentation/

This is the main entry point for deploying the collector and connecting it to your observability backend.

---

## Supported Backends

The collector can export Microsoft Teams observability data to multiple supported backends.

### Dynatrace

For Dynatrace, the collector sends Microsoft Teams observability data to Dynatrace, where it can be processed and visualized through the dedicated application and dashboards.

Related components:

- **Dynatrace Application**  
  https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app

- **Dynatrace Extension**  
  https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension

- **Dynatrace Hub**  
  https://www.dynatrace.com/hub/detail/microsoft-teams-observability/

#### Dynatrace visualizations

##### Home

<img width="3488" height="2084" alt="image" src="https://github.com/user-attachments/assets/6bfa52fb-bae4-4a9c-ad15-c157d51d248e" />

##### Sites

<img width="3482" height="2090" alt="image" src="https://github.com/user-attachments/assets/158999ae-6312-4b6a-b613-ff2c5efe381b" />

##### Calls

<img width="3488" height="2094" alt="image" src="https://github.com/user-attachments/assets/6389719b-2c4c-4c25-b1b6-027b4f812402" />

##### Users

<img width="3492" height="2096" alt="image" src="https://github.com/user-attachments/assets/d1a3c267-a018-4463-ae0a-00e1baba9957" />

##### Call Overview

<img width="3456" height="1842" alt="image" src="https://github.com/user-attachments/assets/732e7371-18bc-40b7-b176-a603be77caba" />

##### Issues

<img width="1800" height="1130" alt="image" src="https://github.com/user-attachments/assets/c8a034e7-55e6-41b5-8a1d-cbac453c99fb" />

##### Dynatrace data flow

Microsoft Teams metadata are sent to Dynatrace, processed for analysis and storage, and then visualized through the dedicated Dynatrace application and dashboards.

<p align="center">
  <img src="./src/assets/images/Dynatrace/Architecture-DT.png" width="60%">
</p>

---

### Splunk

For Splunk, the collector exports Microsoft Teams observability data to Splunk for dashboarding and analytics.

#### Splunk visualizations

##### Home

![Splunk - Home](./src/assets/images/Splunk/App_%231_Overview.png)

##### Site Quality

![Splunk - Site Quality](./src/assets/images/Splunk/App_%233_Site_Quality.png)

##### Call Details

![Splunk – Teams Calls Details](./src/assets/images/Splunk/App_%232_Call_Details.png)

##### Global Network Performance Assessment

![Splunk - Teams Sites performance](./src/assets/images/Splunk/App_%234_NPA.png)

##### Splunk data flow

Microsoft Teams metadata are sent to Splunk and visualized through dedicated dashboards.

<p align="center">
  <img src="./src/assets/images/Splunk/Architecture-Splunk.png" width="60%">
</p>

---

## Looking for the Dynatrace solution?

Many users arrive on this repository while looking for the Dynatrace components.

For Dynatrace, the solution includes:

- the **collector** — this repository
- the **Dynatrace Application** — ready-to-use dashboards and investigation views  
  https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app
- the **Dynatrace Extension** — EF2 packaging and deployment for Dynatrace  
  https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension

---

## Which repository should I use?

- **I want to collect Microsoft Teams data**  
  → this repository

- **I want dashboards and investigation views in Dynatrace**  
  → https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app

- **I want the Dynatrace EF2 extension package**  
  → https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension
