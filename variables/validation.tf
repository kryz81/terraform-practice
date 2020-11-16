variable "image" {
  type        = string
  description = "image path"
  default     = "https://host.name/default.png"

  validation {
    condition     = substr(var.image, 0, 5) == "https"
    error_message = "Image path must be a HTTPS address."
  }
}
