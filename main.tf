resource "aws_iam_user" "adminuser" {
  name = "adeola"
  

  tags = {
    description = "Linux user"
  }
}

resource "aws_iam_policy" "adminpolicy" {
  name = "console-user-policy"
#   users = [aws_iam_user.adminuser.name]
  policy = file("admin-policy.json")

}

resource "aws_iam_user_policy_attachment" "policy-attachment" {
#   name = "admin-user-access-policy"
  user       = aws_iam_user.adminuser.name
  policy_arn = aws_iam_policy.adminpolicy.arn
}