# AWS CodePipeline & CodeBuild

Fully managed CI/CD pipeline and build service.

## Key Topics

- **CodePipeline Stages** — Source (CodeCommit, GitHub, S3, ECR), Build (CodeBuild), Test, Deploy (CodeDeploy, ECS, CloudFormation, Elastic Beanstalk)
- **CodeBuild** — managed build service; `buildspec.yml` defines phases (install, pre_build, build, post_build); Docker support
- **Artifacts & Caching** — artifacts stored in S3 between stages; CodeBuild cache (S3 or local) for dependency reuse
- **CodeDeploy** — deployment strategies: In-Place, Blue/Green; deployment groups; appspec.yml hooks; rollback on alarm
- **Approval Actions** — manual approval gate in pipeline; SNS notification to approver; IAM policy controls who can approve

## Study Notes

<!-- Fill in your notes here -->
