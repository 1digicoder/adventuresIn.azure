# adventuresIn.azure
Playground for CI/CD reference architecture for Azure

## Why am I doing this?
> In the old way of doing things, we treat our servers like pets, for example 
> Bob the mail server. If Bob goes down, it’s all hands on deck. The CEO 
> can’t get his email and it’s the end of the world. In the new way, servers 
> are numbered, like cattle in a herd. For example, www001 to www100. When 
> one server goes down, it’s taken out back, shot, and replaced on the line.
>  *- Randy Bias*

The goal here is to both dogfood and documenting my experience with doing things in a sane manner.

## What topics do I hope to cover

Will be looking at patterns around using Azure with the following goals in mind:
   * CI/CD Pipeline
   * Infrastructure as Code
   * Moderately complex architecture
      * Polygot Data Access
      * Serverless Infrastructure
      * Security 'Better' Practices
      * Kubernetes / Elastic Scaling
      * API Gateway Pattern
      * Event Driven Architecture
      * React UI
      * Caching / Redis / HTTP Caching
      * Monitoring
      * Log Aggregation

## Status

```
| Topic                   |   Pet  | Cattle |
|-------------------------|--------|--------| 
|Create Resource Groups   |        |    /   |
|Create Virtual Machine   |    /   |    /   |
|Create Container Registry|        |    X   |
|Create K8S Cluster       |        |    X   |
|Deployment to K8S        |        |    /   |
|Create Key Vault         |        |    X   |
|Setup Jenkins            |    X   |   WIP  |

Legend:
  (blank) - Unknown
  /       - Partial
  X       - Complete
  WIP     - Work in Progress```
