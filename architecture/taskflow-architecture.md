# TaskFlow Architecture

## Overview

TaskFlow is a cloud-native Flask application deployed using Docker, Terraform, AWS EC2, GitHub Actions, and Kubernetes.

---

## Architecture Flow

                     USER
                       |
                       |
                  Web Browser
                       |
                       |
                AWS EC2 Instance
                       |
                       |
             Docker Container
                       |
                       |
             Flask TaskFlow App
                       |
                       |
               Task Data Storage

---

# Cloud Architecture

                     AWS CLOUD

                       |
                       |

                VPC (10.0.0.0/16)

                       |
         --------------------------------
         |                              |
         |                              |

   Public Subnet                  Private Subnet

         |
         |

   Internet Gateway

         |
         |

    EC2 Instance

         |
         |

  Docker Container

         |
         |

   Flask Application

         |
         |

    tasks.json

---

# CI/CD Pipeline


Developer

|

v

GitHub Repository

|

v

GitHub Actions

|

v

Docker Build

|

v

Docker Hub

|

v

Deployment


---

# Kubernetes Architecture

            User

             |

             v

      Kubernetes Service

             |

             v

    ---------------------

    |                   |

    Pod 1             Pod 2

    |                   |

    ---------------------

             |

             v

    Persistent Volume

             |

             v

         Task Data

---

# Technologies Used

| Layer | Technology |
|------|------------|
| Frontend | HTML, CSS, Bootstrap 5 |
| Backend | Flask |
| Container | Docker |
| Cloud | AWS EC2 |
| IaC | Terraform |
| CI/CD | GitHub Actions |
| Orchestration | Kubernetes |
| Storage | Persistent Volume |

---

# Project Goal

Build and deploy a production-style task management application using modern De