# Go Web Server Containerization

This project focuses on building a robust web server using the Go standard library and containerizing it using Docker. It serves as a practical guide to learning Docker basics, managing container resources, and implementing development best practices.

## Project Requirements

- **Go Web Server**: Built strictly using Go standard packages.
- **Dockerization**: Includes a standard-compliant `Dockerfile`.
- **Docker Objects**: Contains at least one Dockerfile, one image, and one container.
- **Metadata**: Applied to Docker objects for better tracking and organization.
- **Garbage Collection**: Proper management of unused Docker objects.

---

## Technical Concepts Covered

- **Web Basics**: Server setup, HTML rendering, HTTP methods, data input, and data output.
- **Docker Fundamentals**: Containerizing applications, cross-platform compatibility, and dependency isolation.
- **Resource Management**: Cleaning up dangling images and stopped containers.

---

## Getting Started

### Prerequisites
Ensure you have the following installed on your system:
- [Go](https://go.dev) (Version 1.16 or later)
- [Docker Engine / Desktop](https://docker.com)

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone <your-repository-url>
   cd <repository-folder>
   ```

2. **Build the Docker Image:**
   This command builds the image and applies custom metadata labels defined in the Dockerfile.
   ```bash
   docker build -t go-web-server:1.0 .
   ```

3. **Run the Container:**
   Launch the containerized application and map it to port `8080`.
   ```bash
   docker run -d -p 8080:8080 --name my-go-server-container go-web-server:1.0
   ```

4. **Access the Application:**
   Open your browser and navigate to:
   ```text
   http://localhost:8080
   ```

---

## Garbage Collection (Cleaning Unused Objects)

To keep your system clean and avoid wasting disk space, use the following commands to manage unused Docker objects:

- **Remove the specific container:**
  ```bash
  docker rm -f my-go-server-container
  ```
- **Remove dangling images:**
  ```bash
  docker image prune
  ```
- **System-wide cleanup:**
  Removes all stopped containers, unused networks, and dangling build caches.
  ```bash
  docker system prune
  ```

---

## File Structure

```text
├── main.go          # Go web server source code (Standard packages only)
├── Dockerfile       # Production-ready Docker configuration with metadata
└── README.md        # Project documentation
```
