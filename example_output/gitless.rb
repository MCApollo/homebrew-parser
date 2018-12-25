name :
	 Gitless
homepage :
	 https://gitless.com/
url :
	 https://github.com/sdg-mit/gitless/archive/v0.8.6.tar.gz
description :
	 Simplified version control system on top of git
build_deps :
link_deps :
	 libgit2
	 python
optional_deps :
conflicts :
resource :
	 ['args', 'cffi', 'clint', 'pycparser', 'pygit2', 'sh', 'six']
	 ['https://files.pythonhosted.org/packages/e5/1c/b701b3f4bd8d3667df8342f311b3efaeab86078a840fb826bd204118cc6b/args-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/10/f7/3b302ff34045f25065091d40e074479d6893882faef135c96f181a57ed06/cffi-1.11.4.tar.gz', 'https://files.pythonhosted.org/packages/3d/b4/41ecb1516f1ba728f39ee7062b9dac1352d39823f513bb6f9e8aeb86e26d/clint-0.5.1.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/3b/0d/c11844421c7c3b9cb84c5503185bbb5ba780144fd64f5adde572bcdcdd8a/pygit2-0.27.0.tar.gz', 'https://files.pythonhosted.org/packages/7c/71/199d27d3e7e78bf448bcecae0105a1d5b29173ffd2bbadaa95a74c156770/sh-1.12.14.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
