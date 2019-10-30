# Requirements Analysis and Specifications Document
<br>

![Politecnico di Milano's logo](images/polimi-logo.png)
<br>
###### Version 0.1
<br>

* Federico Cazzola (mat. _945835_)
* Francesco Dotti (mat. _945232_)


1. [X] [**INTRODUCTION**](#1)
    1. [Purpose](#1.1)
    2. [Scope](#1.2)
    3. [Definitions, Acronyms, Abbreviations](#1.3)
    4. [Revision history](#1.4)
    5. [Reference Documents](#1.5)
    6. [Document Structure](#1.6)
2. [ ] [**OVERALL DESCRIPTION**](#2)
    1. [Product perspective: here we include further details on the shared phenomena and a domain model (class diagrams and statecharts)](#2.1)
    2. [Product functions: here we include the most important requirements](#2.2)
    3. [User characteristics: here we include anything that is relevant to clarify their needs](#2.3)
    4. [Assumptions, dependencies and constraints: here we include domain assumptions](#2.4)
3. [ ] [**SPECIFIC REQUIREMENTS**: Here we include more details on all aspects in Section 2 if they can be useful for the development team.](#3)
    1. [External Interface Requirements](#3.1)
        1. [User Interfaces](#3.1.1)
        2. [Hardware Interfaces](#3.1.2)
        3. [Software Interfaces](#3.1.3)
        4. [Communication Interfaces](#3.1.4)
    2. [Functional Requirements: Definition of use case diagrams, use cases and associated sequence/activity diagrams, and mapping on requirements](#3.2)
    3. [Performance Requirements](#3.3)
    4. [Design Constraints](#3.4)
        1. [Standards compliance](#3.4.1)
        2. [Hardware limitations](#3.4.2)
        3. [Any other constraint](#3.4.3)
    5. [Software System Attributes](#3.5)
        1. [Reliability](#3.5.1)
        2. [Availability](#3.5.2)
        3. [Security](#3.5.3)
        4. [Maintainability](#3.5.4)
        5. [Portability](#3.5.5)
4. [ ] [**FORMAL ANALYSIS USING ALLOY**: in this section you will include your Alloy model. We require you to comment on the model by discussing the purpose of the model, what you can prove with it and why what you prove is important given the problem at hand. You are also required to show one or more worlds obtained by running your model.](#4)
5. [ ] [**EFFORT SPENT**: In this section you will include information about the number of hours each group member has worked for this document.](#5)
6. [ ] [**REFERENCES**](#6)

<a name="1"></a>
# 1 INTRODUCTION

<a name="1.1"></a>
## 1.1 Purpose
This document represents the Requirement Analysis and Specification Document (RASD). Goals of this document are to completely describe the system in terms of functional and non-functional requirements, analyze the real needs of the customer in order to model the system, show the constraints and the limit of the software and indicate the typical use cases that will occur after the release. This document is addressed to the developers who have to implement the requirements and could be used as a contractual basis.
### 1.1.2
The goals of the projects are:
- [G1](#G1) The system must allow users to send pictures of violations, including their date, time, and position to authorities
- [G2](#G2) The system must store the information provided by users, completing it with suitable meta-­data
- [G3](#G3) The system, when it receives a picture, must run an algorithm to read the license plate 
- [G4](#G4) The system must allow both end users and authorities to mine the information that has been received, for example by highlighting the streets (or the areas) with the highest frequency of violations, or the vehicles that commit the most violations
- [G5](#G5) The system must provide different levels of visibility to different roles
- [G6](#G6) The system must cross the information provided by the municipality about the accidents with its own data to identify potentially unsafe areas and suggest possible interventions.

<a name="1.2"></a>
## 1.2 Scope
The SafeStreet service is offered to common users that want to help the community.	
The S2B will give to the user the possibility to report traffic violation, in particular, parking violation (eg. parking in a spot reserved for disabled people, parking in an helicopter pitch, parking on the sidewalk). The system will allow the users to select the type of violation leading to differt amount of ticket value. 
The system will help the authorities to identify more infractions and therefore to issue more tickets which should increase the attention and respect of the citizens regarding the traffic rules.
Furthermore thanks to the increased number of ticket the municipality will have more money to invest in the community. This extra money could be used to do some interventions following the suggestions provided by SafeStreets.

<a name="1.3"></a>
## 1.3 Definitions, Acronyms, Abbreviations
- **FOSS**: free and open source software
- **S2B**: software to be
- **Mine**: <!-- TODO: definition  -->
- **Violation**: 
- **Unsafu area**:
- **OSM**: Open Street Map 

<a name="1.4"></a>
## 1.4 Revision history

<a name="1.5"></a>
## 1.5 Reference Documents
- Specification document: “SafeStreets Mandatory Project Assignment” 	
- [ISO/IEC/IEEE 29148:2018](https://sci-hub.tw/https://ieeexplore.ieee.org/document/8559686)
- [UML diagrams](https://www.uml-diagrams.org/)
- [Alloy documentation](http://alloy.lcs.mit.edu/alloy/documentation/quickguide/seq.html)
  
<a name="1.6"></a>
## 1.6 Document Structure
- **Chapter 1** Presents an introduction to the problem and describes the purpose of the application. The scope of the application is defined by stating the goals and description of the problem.
- **Chapter 2** Presents the overall description of the project. The product perspective includes details on the shared phenomena and the domain models. The class diagram describes the domain model used, and the state diagram analyzes the process of arranging a meeting and reaching it in time. Here the majority of functions of the system are more precisely specified, with respect to the already mentioned goals of the system. In the user characteristics section the types of actors that can use the application are described.
- **Chapter 3** Contains the external interface requirements (user interfaces, hardware interfaces, software interfaces and communication interfaces). The functional requirements are defined with use case and sequence diagram.
The non-functional requirements are defined through performance requirements, design constraints and software system attributes.
- **Chapter 4** Introduces an alloy model and the discussion of its purpose. Also, a world generated by it is shown.
- **Chapter 5** Shows the effort spent by each group member.
- **Chapter 6** Includes the reference documents.

<a name="2"></a>
# 2 OVERALL DESCRIPTION

<a name="2.1"></a>
## 2.1 Product perspective: here we include further details on the shared phenomena and a domain model (class diagrams and statecharts)

The following high level class diagram provides a model of the application domain: it contains only few essential attributes of the various classes and does not include every class that will be necessary to define the Model (useful data) of the system.

Now we are going to analyze some critical aspects of the application, modeling their behaviors and showing  the  evolution  over  time  of  their  states  through  appropriate  state  diagrams,  which  are reported below.
<a name="2.2"></a>
## 2.2 Product functions: here we include the most important requirements

Here it's Provided a summary of the major functions that the software will perform.

### Report parking violation
This is the main function of the system: The software will allow users to notify authorities when traffic violations occur, and in particular parking violations. The application allows users to send pictures of violations, including their date, time, and position to authorities. Examples of violations are vehicles parked in the middle of bike lanes or in places reserved for people with disabilities, double parking, and so on.

### Mine information
The S2B must gather all the reports of the parking violation and elaborate them with an algorithm to highlighting the streets (or the areas) with the highest frequency of violations, or the vehicles that commit the most violations. The system will allow only police officers to access some kind of data (e.g. information about a specific veichle), while more generic data will be available for every user.

### Suggest interventions
The S2B must gather information about accidents that the municipality will provide and cross them with his parking violation reports to generate new data about potentially unsafe area. Those potentially unsafe area will be sent to the municipality which will take action.

<a name="2.3"></a>
## 2.3. User characteristics: here we include anything that is relevant to clarify their needs

### 1. Standard User
Common citizien who signs up to use the SafeStreet service. There are no constraints or age limitations, anyone can join.
### 2. Traffic Warden
A police officer. The sign up process is made in collaboration with the authorities to guarantee their identity.

### 3. Municipality
Certified municipality's clerks who can access the suggestion for possible interventions.

### 4. SafeStreets Administrators

<a name="2.4"></a>
## 2.4 Assumptions, dependencies and constraints: here we include domain assumptions
- D1: All traffic wardens have a smartphone.
- D2: Each fiscal code number is unique.
- D3: The municipality will provide only well formatted report of accidents

<a name="3"></a>
# 3 SPECIFIC REQUIREMENTS
<a name="3.1"></a>
## 3.1 External Interface Requirements

<a name="3.1.1"></a>
### 3.1.1 User Interfaces
<a name="3.1.2"></a>
### 3.1.2 Hardware Interfaces 
- The software, in order to work, will need an internet connection so the device must have access to the internet.
- A standard user will need a device with GPS to capture the exact location and a camera to take the photo in order to report a traffic violation.
<a name="3.1.3"></a>
### 3.1.3 Software Interfaces 
- Safestreets will be available as a web application: so any modern up-to-date browser will be compatible (e.g. Firefox, Brave) and as a native app for Android and iOS (Android 4.4 and iOS 9.3 will be the oldest versions supported)
- Safestreets will use OSM to work with geographic data (maps and addresses).
- Safestreets will provide API for users that want to get the public available data.

<a name="3.1.4"></a>
### 3.1.4 Communication Interfaces 
<a name="3.2"></a>
## 3.2 Functional Requirements: Definition of use case diagrams, use cases and associated sequence/activity diagrams, and mapping on requirements
### Scenarios:
- Marco is tired of people parking on the sidewalk...
- Giuseppe the assessor wants to know where public interventions are most needed...
- Paolo the traffic warden commander wants to improve his operate...
- Omar the Mayor wants to raise more money...

### Use cases:
Don't forget UCs that don't involve humans.
- sign up
- log in
- report violation
- visualize private profile
- visualize public available data
- visualize map
- confirm violation
- access suggestions 
- access API

<a name="3.3"></a>
## 3.3 Performance Requirements
<a name="3.4"></a>
## 3.4 Design Constraints
<a name="3.4.1"></a>
### 3.4.1 Standards compliance
<a name="3.4.2"></a>
### 3.4.2 Hardware limitations
<a name="3.4.3"></a>
### 3.4.3 Any other constraint
<a name="3.5"></a>
## 3.5 Software System Attributes
<a name="3.5.1"></a>
### 3.5.1 Reliability
<a name="3.5.2"></a>
### 3.5.2 Availability
<a name="3.5.3"></a>
### 3.5.3 Security
<a name="3.5.4"></a>
### 3.5.4 Maintainability
<a name="3.5.5"></a>
### 3.5.5 Portability
<a name="4"></a>
# 4 FORMAL ANALYSIS USING ALLOY
 In this section you will include your Alloy model. We require you to comment on the model by discussing the purpose of the model, what you can prove with it and why what you prove is important given the problem at hand. You are also required to show one or more worlds obtained by running your model
<a name="5"></a>
# 5 EFFORT SPENT 
 In this section you will include information about the number of hours each group member has worked for this document
<a name="6"></a>
# 6 REFERENCES
