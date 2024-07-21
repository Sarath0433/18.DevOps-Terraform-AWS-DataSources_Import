resource "aws_iam_user" "adminuser1" {
  name       = "adminuser1"
  depends_on = [aws_route_table_association.terraform-public-3]
}

resource "aws_iam_user" "adminuser2" {
  name       = "adminuser2"
  depends_on = [aws_iam_user.adminuser1]
}

resource "aws_iam_user" "adminuser3" {
  name       = "adminuser3"
  depends_on = [aws_iam_user.adminuser2]
}