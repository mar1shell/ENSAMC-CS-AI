# coEdit

![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![React](https://img.shields.io/badge/React-19-61DAFB?style=for-the-badge&logo=react&logoColor=black)
![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-4-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)
![WebSocket](https://img.shields.io/badge/WebSocket-Real--time-010101?style=for-the-badge&logo=socketdotio&logoColor=white)

A real-time collaborative document editing platform built with Spring Boot and React.

> **Note:** This project is maintained in a separate repository: [https://github.com/mal0101/coEdit](https://github.com/mal0101/coEdit)

## 📋 Overview

**coEdit** is a full-stack web application that enables users to create, edit, and collaborate on documents in real-time. Built as a group project for the Java Enterprise course, it demonstrates modern web development practices with a focus on real-time communication and user experience.

## ✨ Features

- **Real-time Collaboration** — Multiple users can edit documents simultaneously with WebSocket-powered live updates
- **Document Management** — Create, edit, rename, and delete documents with an intuitive dashboard
- **Sharing & Permissions** — Share documents with granular access control (Viewer/Editor roles)
- **Version History** — Track changes and restore previous versions of documents
- **Comments** — Add and manage comments on documents for team discussions
- **User Authentication** — Secure JWT-based authentication with registration and login
- **Responsive Design** — Modern dark-themed UI that works seamlessly across devices

## 🛠️ Tech Stack

### Backend

- **Java 17**
- **Spring Boot 3.5** — REST API framework
- **Spring Security** — Authentication & authorization with JWT
- **Spring Data JPA** — Database persistence
- **Spring WebSocket** — Real-time communication
- **PostgreSQL / H2** — Database (H2 for development, PostgreSQL for production)
- **Lombok** — Reduce boilerplate code
- **Swagger/OpenAPI** — API documentation

### Frontend

- **React 19** — UI library
- **Vite** — Build tool and dev server
- **React Router 7** — Client-side routing
- **Tailwind CSS 4** — Utility-first styling
- **Axios** — HTTP client
- **STOMP.js + SockJS** — WebSocket client

## 🚀 Getting Started

### Prerequisites

- Java 17+
- Node.js 18+
- Maven 3.8+

### Backend Setup

```bash
# Clone the repository
git clone https://github.com/mal0101/coEdit.git
cd coEdit

# Run the Spring Boot application
./mvnw spring-boot:run
```

The backend server will start at `http://localhost:8005`

### Frontend Setup

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

The frontend will be available at `http://localhost:5173`

### Environment Variables

Create a `.env` file in the root directory with:

```env
JWT_SECRET=your-secret-key-here
```

## 📁 Project Structure

```
coEdit/
├── src/main/java/com/main/editco/
│   ├── config/          # Security, WebSocket, CORS configs
│   ├── controller/      # REST API endpoints
│   ├── dao/             # Entities and repositories
│   ├── dto/             # Data transfer objects
│   └── service/         # Business logic
├── frontend/
│   └── src/
│       ├── components/  # Reusable UI components
│       ├── context/     # React context providers
│       ├── pages/       # Page components
│       ├── services/    # API service layer
│       └── utils/       # Utility functions
└── pom.xml
```

## 👥 Team

| Name                     | GitHub                                         |
| ------------------------ | ---------------------------------------------- |
| **Malak Mekyassi**       | [GitHub Profile](https://github.com/mal0101)   |
| **El-Hamdaoui Marouane** | [GitHub Profile](https://github.com/mar1shell) |

## 📝 License

This project was developed as part of the Java Enterprise course curriculum.

---

<p align="center">
    Built with ❤️ using Spring Boot & React
</p>
