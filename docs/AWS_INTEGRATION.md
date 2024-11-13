# Identity Authentication Method 

This is an example on setting up AWS IAM for a target cluster running on AWS that inherits the credentials from the runtime environment using the aws sdk default credential chain (in this case another role.)  

In this example, ec2-role will be assigned to the ec2 or target cluster as its default role and it will assume another role called test-role.  

1. Modify policy/permissions and trust relationships for ec2-role and test-role.

### Modify ec2-role policy/permissions

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": [
				"sts:AssumeRole"
			],
			"Effect": "Allow",
			"Resource": "arn:aws-us-gov:iam::account-id:role/test-role"
		}
	]
}
```

### Verify ec2-role trusted relationships (this is the default and no need to modify.)

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

### Verify test-role policy/permissions - test-role will be assumed by ec2-role 

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": "ec2:DescribeRegions",
			"Resource": "*"
		}
	]
}
```

### Modify test-role trusted relationships

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws-us-gov:iam::account-id:role/ec2-role"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

2. After k8s cluster is deployed on AWS, assign ec2-role to ec2 or the target cluster.  Go to AWS Console -> EC2 -> Instances -> find your instance -> Actions -> Security -> Modify IAM role -> find ec2-role -> click Update IAM role button (It's also possible to assign ec2-role to the running instance during deployment using instance profile.) 

3. The cluster should assume test-role and Secret Stores should have a valid status.
