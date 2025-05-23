#### must comment in first apply then use it 


terraform {
    backend "s3" {
        bucket         = "statefile-nti-2025"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "NTI-locks"
        encrypt        = true
    }
}





#### bootstrap to run for one time

resource "aws_dynamodb_table" "terraform_locks" {
    name = "NTI-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}


# resource "aws_s3_bucket" "terraform_state"{
#     bucket = "statefile-nti-2025"
#   }

# resource "aws_s3_bucket_versioning" "enable"{
#     bucket = aws_s3_bucket.terraform_state.id
#     versioning_configuration {
#         status = "Enabled"
#     }
# }



