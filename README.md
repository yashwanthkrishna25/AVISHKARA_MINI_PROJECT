# Smart Parking Slot Booking System 🚗📳

An automated, cross-platform full-stack solution designed to streamline urban parking management. This system allows users to view live parking availability, securely reserve slots in advance via a web or mobile application, and navigate efficiently—minimizing traffic congestion and fuel waste.

---

## 🚀 Key Features

* **Real-Time Interactive Grid:** A dynamic visual interface indicating available (green) and reserved (red) parking spaces in real-time.
* **Dual-Platform Access:** Scalable design featuring a responsive Web Dashboard alongside a dedicated Mobile Application wrapper.
* **Instant Booking System:** Smooth reservation workflows equipped with automated countdown timers to hold slots temporarily.
* **Secure Access Verification:** Integration-ready logic for dynamic passcodes or QR codes to validate vehicle arrivals seamlessly.
* **Concurrency Handling:** Advanced state management to prevent race conditions when multiple users attempt to reserve the same slot simultaneously.

---

## 🛠️ Architecture & Tech Stack

### Frontend & Mobile
* **Web UI:** React.js, Tailwind CSS
* **Mobile Wrapper:** React Native / Flutter
* **State Management:** WebSockets (for live, low-latency layout synchronization)

### Backend & Database
* **Server Runtime:** Node.js with Express.js (or FastAPI)
* **Database:** MongoDB / PostgreSQL (for users, active slot states, and booking histories)
* **API Testing & Version Control:** Postman, Git & GitHub

---


##  📱 App UI Preview


<div align="center" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px;">
  <img src="../parkease2/screenshot/1st.png" style="width:100%; object-fit: contain;" />
  <img src="../parkease2/screenshot/2nd.png" style="width:100%; object-fit: contain;" />
  <img src="../parkease2/screenshot/3rd.png" style="width:100%; object-fit: contain;" />
  <img src="../parkease2/screenshot/4th.png" style="width:100%; object-fit: contain;" />
  <img src="../parkease2/screenshot/5th.png" style="width:100%; object-fit: contain;" />
  <img src="../parkease2/screenshot/8th.png" style="width:100%; object-fit: contain;" />
</div>

---

## 📁 Repository Structure

```text
Parking/
├── android/                         # Native Android configuration files
├── ios/                             # Native iOS configuration files
├── web/                             # Flutter web configuration files (if needed)
├── assets/                          # Static assets utilized across the app
│   ├── icons/                       # App icons, car vectors, marker pins
│   └── images/                      # Branding logos, onboarding illustrations
├── lib/                             # Core Flutter application source code
│   ├── main.dart                    # Application entry point (initializes services)
│   ├── app.dart                     # Main MaterialApp configuration (routing, themes)
│   ├── core/                        # Shared utilities, constants, and global code
│   │   ├── constants/               # Global static values
│   │   │   ├── color_constants.dart # Theme configurations (Green/Red indicators)
│   │   │   └── api_endpoints.dart   # Backend REST & WebSocket URIs
│   │   ├── network/                 # Low-level networking clients
│   │   │   ├── api_client.dart      # HTTP/Dio client for REST requests
│   │   │   └── websocket_client.dart# Low-latency Socket.io connection manager
│   │   ├── utils/                   # Helper functions (date formatters, QR builders)
│   │   └── widgets/                 # Reusable UI elements (custom buttons, load spinners)
│   │
│   └── features/                    # Feature-First Architecture Modules
│       ├── auth/                    # --- Authentication Feature ---
│       │   ├── data/                # Data layer (API calls, local token storage)
│       │   ├── domain/              # Entities and business logic use cases
│       │   └── presentation/        # UI layer (Login screen, Register screen)
│       │
│       ├── parking_map/             # --- Live Parking Grid Feature ---
│       │   ├── data/                # Fetches initial layouts & listens to WebSockets
│       │   ├── domain/              # Slot models and live status entities
│       │   └── presentation/        # Grid View, Slot State Widgets (Red/Green)
│       │
│       ├── booking/                 # --- Slot Reservation Feature ---
│       │   ├── data/                # Handles reservation HTTP requests & timers
│       │   ├── domain/              # Active reservation state models
│       │   └── presentation/        # Countdown Timer UI, Ticket Confirmation Screen
│       │
│       └── profile/                 # --- User Settings & History Feature ---
│           ├── data/                # Fetches past history records
│           └── presentation/        # History Log View, Profile Management UI
│
├── pubspec.yaml                     # Project dependencies & asset declarations
└── README.md                        # Mobile sub-module documentation
