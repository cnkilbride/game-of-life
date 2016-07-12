s3_bucket=thunderclouds-game-of-life

iam_role=lambda_basic_execution

function getRoleArn {
    aws iam get-role --role-name $iam_role --query "Role.Arn" --output text
}

set -x

