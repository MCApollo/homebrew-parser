name :
	 KeepkeyAgent
homepage :
	 https://github.com/romanz/trezor-agent
url :
	 https://files.pythonhosted.org/packages/65/72/4bf47a7bc8dc93d2ac21672a0db4bc58a78ec5cee3c4bcebd0b4092a9110/keepkey_agent-0.9.0.tar.gz
description :
	 Keepkey Hardware-based SSH/GPG agent
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['backports.shutil_which', 'ConfigArgParse', 'docutils', 'ecdsa', 'ed25519', 'hidapi', 'keepkey', 'libagent', 'lockfile', 'mnemonic', 'pbkdf2', 'protobuf', 'PyMsgBox', 'python-daemon', 'semver', 'six', 'Unidecode']
	 ['https://files.pythonhosted.org/packages/dd/ea/715dc80584207a0ff4a693a73b03c65f087d8ad30842832b9866fe18cb2f/backports.shutil_which-3.5.1.tar.gz', 'https://files.pythonhosted.org/packages/77/61/ae928ce6ab85d4479ea198488cf5ffa371bd4ece2030c0ee85ff668deac5/ConfigArgParse-0.13.0.tar.gz', 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz', 'https://files.pythonhosted.org/packages/f9/e5/99ebb176e47f150ac115ffeda5fedb6a3dbb3c00c74a59fd84ddf12f5857/ecdsa-0.13.tar.gz', 'https://files.pythonhosted.org/packages/d5/d6/cd19a64022dc7557d245aad6a943eed7693189b48c58a9adf3bc00ceedc5/ed25519-1.4.tar.gz', 'https://files.pythonhosted.org/packages/c1/86/89df0e8890f96eeb5fb68d4ccb14cb38e2c2d2cfd7601ba972206acd9015/hidapi-0.7.99.post21.tar.gz', 'https://files.pythonhosted.org/packages/bd/7c/8edc3d017b4b02f11533083d9987d11707fcf82ab6606c9b9aedd2e95b4c/keepkey-4.0.2.tar.gz', 'https://files.pythonhosted.org/packages/63/57/39df4b80036657c9d57a17fe94902965a20543569e9bef0bb7cd89e8fa4a/libagent-0.11.2.tar.gz', 'https://files.pythonhosted.org/packages/17/47/72cb04a58a35ec495f96984dddb48232b551aafb95bde614605b754fe6f7/lockfile-0.12.2.tar.gz', 'https://files.pythonhosted.org/packages/a4/5a/663362ccceb76035ad50fbc20203b6a4674be1fe434886b7407e79519c5e/mnemonic-0.18.tar.gz', 'https://files.pythonhosted.org/packages/02/c0/6a2376ae81beb82eda645a091684c0b0becb86b972def7849ea9066e3d5e/pbkdf2-1.3.tar.gz', 'https://files.pythonhosted.org/packages/73/73/4f133a31d67b27431fe4b9cc5e2f74d0644bce0327a743093f3cc27864ce/protobuf-3.5.2.post1.tar.gz', 'https://files.pythonhosted.org/packages/b6/65/86379ede1db26c40e7972d7a41c69cdf12cc6a0f143749aabf67ab8a41a1/PyMsgBox-1.0.6.zip', 'https://files.pythonhosted.org/packages/b2/fb/a280d65f81e9d69989c8d6c4e0bb18d7280cdcd6d406a2cc3f4eb47d4402/python-daemon-2.1.2.tar.gz', 'https://files.pythonhosted.org/packages/43/07/4a7470398de2d33547b54b4848d18fde88aa434883cb255e01630c8f7f65/semver-2.8.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/9d/36/49d0ee152b6a1631f03a541532c6201942430060aa97fe011cf01a2cce64/Unidecode-1.0.22.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
