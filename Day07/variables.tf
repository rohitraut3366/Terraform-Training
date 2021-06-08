variable "x" {
  type = number
  default = "10"
}

variable "x1" {
  type = string
  default = 100
}

variable "x2" {
  type = bool
  default = true
}

variable "x3" {
  type = list
  default = ["10","20"]

}
variable "x4" {
  type = map
  default = {
    x1 = "21"
    x2 = 12
    x3 = "123"
  }
}
# count and count.index
# element and fetch element by index
# lookup output value of key

# ternary operator
variable "x5" {
  type =bool
  default = 10<20?true:false
}
