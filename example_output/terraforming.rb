name :
	 Terraforming
homepage :
	 https://terraforming.dtan4.net/
url :
	 https://github.com/dtan4/terraforming.git
description :
	 Export existing AWS resources to Terraform style (tf, tfstate)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['aws-sdk-autoscaling', 'aws-sdk-cloudwatch', 'aws-sdk-ec2', 'aws-sdk-efs', 'aws-sdk-elasticache', 'aws-sdk-elasticloadbalancing', 'aws-sdk-elasticloadbalancingv2', 'aws-sdk-iam', 'aws-sdk-kms', 'aws-sdk-rds', 'aws-sdk-redshift', 'aws-sdk-route53', 'aws-sdk-s3', 'aws-sdk-sns', 'aws-sdk-sqs', 'multi_json', 'thor']
	 ['https://rubygems.org/gems/aws-sdk-autoscaling-1.3.0.gem', 'https://rubygems.org/gems/aws-sdk-cloudwatch-1.2.0.gem', 'https://rubygems.org/gems/aws-sdk-ec2-1.10.0.gem', 'https://rubygems.org/gems/aws-sdk-efs-1.0.0.gem', 'https://rubygems.org/gems/aws-sdk-elasticache-1.1.0.gem', 'https://rubygems.org/gems/aws-sdk-elasticloadbalancing-1.1.0.gem', 'https://rubygems.org/gems/aws-sdk-elasticloadbalancingv2-1.3.0.gem', 'https://rubygems.org/gems/aws-sdk-iam-1.3.0.gem', 'https://rubygems.org/gems/aws-sdk-kms-1.2.0.gem', 'https://rubygems.org/gems/aws-sdk-rds-1.4.0.gem', 'https://rubygems.org/gems/aws-sdk-redshift-1.1.0.gem', 'https://rubygems.org/gems/aws-sdk-route53-1.3.0.gem', 'https://rubygems.org/gems/aws-sdk-s3-1.5.0.gem', 'https://rubygems.org/gems/aws-sdk-sns-1.1.0.gem', 'https://rubygems.org/gems/aws-sdk-sqs-1.2.0.gem', 'https://rubygems.org/gems/multi_json-1.12.2.gem', 'https://rubygems.org/gems/thor-0.20.0.gem']
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 resources.each do |r|
	 r.verify_download_integrity(r.fetch)
	 system "gem", "install", r.cached_download, "--no-document",
	 "--install-dir", libexec
	 end
	 system "gem", "build", "terraforming.gemspec"
	 system "gem", "install", "--ignore-dependencies",
	 "terraforming-#{version}.gem"
	 bin.install libexec/"bin/terraforming"
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
