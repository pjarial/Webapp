output "pusnet" {
  value = aws_subnet.pub[*].id
}

output "prsnet" {
  value = aws_subnet.pr[*].id
}