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
2. [ ] **OVERALL DESCRIPTION**
    1. Product perspective: here we include further details on the shared phenomena and a domain model (class diagrams and statecharts)
    2. Product functions: here we include the most important requirements
    3. User characteristics: here we include anything that is relevant to clarify their needs
    4. Assumptions, dependencies and constraints: here we include domain assumptions
3. [ ] **SPECIFIC REQUIREMENTS**: Here we include more details on all aspects in Section 2 if they can be useful for the development team.
    1. External Interface Requirements
        1. User Interfaces
        2. Hardware Interfaces
        3. Software Interfaces
        4. Communication Interfaces
    2. Functional Requirements: Definition of use case diagrams, use cases and associated sequence/activity diagrams, and mapping on requirements
    3. Performance Requirements
    4. Design Constraints
        1. Standards compliance
        2. Hardware limitations
        3. Any other constraint
    5. Software System Attributes
        1. Reliability
        2. Availability
        3. Security
        4. Maintainability
        5. Portability
4. [ ] **FORMAL ANALYSIS USING ALLOY**: in this section you will include your Alloy model. We require you to comment on the model by discussing the purpose of the model, what you can prove with it and why what you prove is important given the problem at hand. You are also required to show one or more worlds obtained by running your model.
5. [ ] **EFFORT SPENT**: In this section you will include information about the number of hours each group member has worked for this document.
6. [ ] **REFERENCES**

<a name="1"></a>
# 1 INTRODUCTION

<a name="1.1"></a>
## 1.1 Purpose
This document represents the Requirement Analysis and Specification Document (RASD). Goals of this document are to completely describe the system in terms of functional and non-functional requirements, analyze the real needs of the customer in order to model the system, show the constraints and the limit of the software and indicate the typical use cases that will occur after the release. This document is addressed to the developers who have to implement the requirements and could be used as a contractual basis.
### 1.1.2
The goals of the projects are:
- [G1] The system must allow users to send pictures of violations, including their date, time, and position to authorities
- [G2] The system must store the information provided by users, completing it with suitable meta-­data
- [G3] The system, when it receives a picture, must run an algorithm to read the license plate 
- [G4] The system must allow both end users and authorities to mine the information that has been received, for example by highlighting the streets (or the areas) with the highest frequency of violations, or the vehicles that commit the most violations
- [G5] The system must provide different levels of visibility to different roles
- [G6] The system must cross the information provided by the municipality about the accidents with its own data to identify potentially unsafe areas and suggest possible interventions.

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

<a name="1.4"></a>
## 1.4 Revision history

<a name="1.5"></a>
## 1.5 Reference Documents
- Specification document: “SafeStreets Mandatory Project Assignment” 	
- IEEE Std 830‐1998 IEEE Recommended Practice for Software Requirements Specifications
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

# 2 OVERALL DESCRIPTION
## 2.1 Product perspective: here we include further details on the shared phenomena and a domain model (class diagrams and statecharts)
## 2.2 Product functions: here we include the most important requirements
## 2.3. User characteristics: here we include anything that is relevant to clarify their needs
## 2.4. Assumptions, dependencies and constraints: here we include domain assumptions