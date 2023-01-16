resource "aws_codebuild_project" "plan" {
  name          = "plan"
  description   = "Plan stage for terraform"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "amazon/aws-codebuild-local"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
    registry_credential{
        credential = var.dockerhub
        credential_provider = "SECRETS_MANAGER"
    }
 }
 source {
     type   = "CODEPIPELINE"
     buildspec = file("buildspec/plan-buildspec.yml")
 }
}



resource "aws_codepipeline" "pipeline" {

    name = "cicd"
    role_arn = aws_iam_role.codepipeline-role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.s3bucketcicd.id
    }

    stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["code"]
            configuration = {
                FullRepositoryId = "dgracilieri/stratusgrid-website"
                BranchName   = "main"
                ConnectionArn = var.connector
                OutputArtifactFormat = "CODE_ZIP"
            }
        }
    }

    stage {
        name ="Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["code"]
            configuration = {
                ProjectName = "plan"
            }
        }
    }

    
}