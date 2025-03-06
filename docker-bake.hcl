# Variable is used to set attribute values, interpolate them into other values, and perform arithmetic operations.
variable "REGISTRY" {
  default = "calebackom"
}

# Group is used to group targets together. This is useful when you want to build multiple targets at once
group "all" {
  targets = ["frontend", "backend"]
}

# Target is used to define a build target. A target is a single build artifact that can be built.
target "backend" {
    context = "./backend"
    dockerfile = "./Dockerfile"
    tags = ["${REGISTRY}/task-backend:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
}

target "frontend" {
    context = "./frontend"
    dockerfile = "./Dockerfile"
    tags = ["${REGISTRY}/task-frontend:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
}
