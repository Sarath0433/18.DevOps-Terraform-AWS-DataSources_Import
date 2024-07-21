resource "aws_s3_bucket" "devopsb29bucket001" {
  bucket = "devopsb29bucket001"

  tags = {
    Name        = "devopsb29bucket001"
    Environment = "Dev"
  }
  depends_on = [aws_iam_user.adminuser3]
}
resource "aws_s3_bucket" "devopsb29bucket002" {
  bucket = "devopsb29bucket002"

  tags = {
    Name        = "devopsb29bucket002"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.devopsb29bucket001]
}

resource "aws_s3_bucket" "devopsb29bucket003" {
  bucket = "devopsb29bucket003"

  tags = {
    Name        = "devopsb29bucket003"
    Environment = "Dev"
  }
  depends_on = [aws_s3_bucket.devopsb29bucket002]
}