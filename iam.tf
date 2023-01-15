resource "aws_iam_role" "codepipeline-role" {
  name = "codepipeline-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}



resource "aws_iam_policy" "pipeline-policy" {
    name = "pipeline-policy"
    path = "/"
    description = "Pipeline policy"
    policy = data.aws_iam_policy_document.pipeline-policies.json
}

resource "aws_iam_role_policy_attachment" "pipeline-attachment" {
    policy_arn = aws_iam_policy.pipeline-policy.arn
    role = aws_iam_role.codepipeline-role.id
}


resource "aws_iam_role" "codebuild-role" {
  name = "codebuild-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_policy" "build-policy" {
    name = "build-policy"
    path = "/"
    description = "Codebuild policy"
    policy = data.aws_iam_policy_document.build-policies.json
}

resource "aws_iam_role_policy_attachment" "codebuild-attachment1" {
    policy_arn  = aws_iam_policy.build-policy.arn
    role        = aws_iam_role.codebuild-role.id
}

resource "aws_iam_role_policy_attachment" "codebuild-attachment2" {
    policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    role        = aws_iam_role.codebuild-role.id
}

