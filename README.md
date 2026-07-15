[![Documentation](https://img.shields.io/badge/Documentation-Online-blueviolet?logo=gitbook)](https://phenisys.github.io/microsoft-teams-observability-documentation/)
[![Dynatrace App](https://img.shields.io/badge/Dynatrace-App-1e8c8f)](https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app)
[![Dynatrace Extension](https://img.shields.io/badge/Dynatrace-EF2_Extension-0a6cff)](https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension)
[![Dynatrace Hub](https://img.shields.io/badge/Dynatrace-Hub-00b140)](https://www.dynatrace.com/hub/detail/microsoft-teams-observability/)
[![Grafana App](https://img.shields.io/badge/Grafana-App-FF6A00?logo=grafana)](https://grafana.com/grafana/plugins/phenisyslab-msteamsobservability-app/)
[![Splunk App](https://img.shields.io/badge/Splunk-App-black?logo=splunk)](https://splunkbase.splunk.com/app/7850)
[![Get your license](https://img.shields.io/badge/Get_your_license-Here-blue)](https://phenisys.notion.site/17b56c8e31f7806b8cd4e0debfe539fb)

# Microsoft Teams Observability

**Microsoft Teams Observability** provides a collector for Microsoft Teams telemetry and service health data.

It connects to Microsoft Graph, collects and enriches Microsoft Teams observability data, and exports it to supported backends such as **Dynatrace**, **Grafana Cloud/Loki** and **Splunk Enterprise**.

This repository is the **core collector project** (or "Agent") of the solution.

<img width="2246" height="1066" alt="Backends" src="https://github.com/user-attachments/assets/cb03f96e-5f2b-4400-bb23-95d5bab58bbb" />

---

## What the collector does

The collector retrieves and processes Microsoft Teams observability data including:

- Call Records with all Streams details
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
See **Dynatrace Hub** for more details :
  https://www.dynatrace.com/hub/detail/microsoft-teams-observability/

The solution includes:

- the **collector** — this repository
- the **Dynatrace Application** — ready-to-use dashboards and investigation views  
  https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app
- the **Dynatrace Extension** — EF2 packaging and deployment for Dynatrace  
  https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension

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

<img width="1800" height="1130" alt="image" src="https://github.com/user-attachments/assets/e6f1f3a3-d8a2-48cb-b10b-5c491861d79c" />

##### Issues

<img width="1800" height="1130" alt="image" src="https://github.com/user-attachments/assets/c8a034e7-55e6-41b5-8a1d-cbac453c99fb" />

---

### Grafana Labs

For Grafana Labs, the collector exports Microsoft Teams observability data to Grafana Labs plugin and dashboards.
This is a commercial plugin for sales on Grafana Labs Marketplace.
It includes a demo mode (example data) and a 1-month trial is proposed for the collector.

- **Grafana Labs Plugin**
  https://grafana.com/grafana/plugins/phenisys-msteamsobservability-app/

#### Grafana visualizations

##### Home

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/875d7c4c-72d7-43ac-af01-feec09b7fd08" />

##### Sites

<img width="1920" height="3312" alt="image" src="https://github.com/user-attachments/assets/0542c67f-d510-49df-a0fa-e724ecff9ada" />

##### Calls

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b23491c4-1e2b-40ae-801e-05da58f84461" />

##### Users

<img width="1920" height="1080" alt="users" src="https://github.com/user-attachments/assets/d9b8ffb3-2e0e-4a83-8ee0-945161abe4a5" />

##### Call Overview

<img width="1920" height="3703" alt="image" src="https://github.com/user-attachments/assets/83656fe1-bd41-4444-ad9f-a9fb6ce20f7b" />

##### Issues

<img width="1920" height="1080" alt="issues" src="https://github.com/user-attachments/assets/7efb5b4a-e90f-48dd-8fb7-a859540fe8c8" />

---

### Splunk

For Splunk, the collector exports Microsoft Teams observability data to Splunk for dashboarding and analytics.

#### Splunk visualizations

##### Home

<img width="3582" height="1936" alt="image" src="https://github.com/user-attachments/assets/8398bea5-1523-4d47-aa65-37eca05e768a" />

##### Site Quality

<img width="3571" height="3439" alt="image" src="https://github.com/user-attachments/assets/6b0daf53-0027-46e7-a939-ccad2ac1d4aa" />

##### Call Details

<img width="3600" height="1752" alt="image" src="https://github.com/user-attachments/assets/d10e8cd7-6bb8-47db-b8b3-31150c30920b" />

##### Global Network Performance Assessment

<img width="2284" height="1228" alt="image" src="https://github.com/user-attachments/assets/32d4694c-1852-4187-b4fe-fb5426a13ffb" />

##### Splunk data flow

Microsoft Teams metadata are sent to Splunk and visualized through dedicated dashboards.

<p align="center">
  <img width="2924" height="806" alt="image" src="https://github.com/user-attachments/assets/5fdbd5a0-805b-44bb-ad62-19a0126d8ed0" />
</p>

---

## Which repository should I use?

- **I want to collect Microsoft Teams data**  
  → this repository

- **I want dashboards and investigation views in Dynatrace**  
  → https://github.com/Phenisys/microsoft-teams-observability-dynatrace-app

- **I want the Dynatrace EF2 extension package**  
  → https://github.com/Phenisys/microsoft-teams-observability-dynatrace-extension

---
## How do I get a Trial License ?

- **[Please get in touch with this request form](https://phenisys.notion.site/17b56c8e31f7806b8cd4e0debfe539fb)**
